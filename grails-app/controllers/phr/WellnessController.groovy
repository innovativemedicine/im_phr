package phr

import groovy.sql.Sql

class WellnessController {

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "wellness")
	}

	/**
	 * Checks to see whether the user is logged in before loading the page
	 */
	def auth() {
		if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	}

	/**
	 * Main landing page for Profile tab. List the details about the current user's well-being information.
	 */
	def wellness = {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def curUser = Login.get(session.user.id)
		// Calories
		def UserCaloriesInstanceList = UserCalories.findAllByUser(curUser, [sort:"calDate", order:"desc"])

		// Carbohydrates
		def UserCarbohydratesInstanceList = UserCarbohydrates.findAllByUser(curUser, [sort:"carbDate", order:"desc"])

		// Cholestrol
		def UserCholestrolInstanceList = UserCholestrol.findAllByUser(curUser, [sort:"cholDate", order:"desc"])

		// Blood Pressure
		def UserBloodPressureInstanceList = UserBloodPressure.findAllByUser(curUser, [sort:"bpDate", order:"desc"])

		// BMI
		def UserBmiInstanceList = UserBmi.findAllByUser(curUser, [sort:"bmiDate", order:"desc"])

		//		// Exercise
		//		def UserPushupsInstanceList = db.rows(
		//				"SELECT ue.pushups, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' FROM user_exercise ue WHERE ue.user_id = ? AND ue.pushups > 0 " +
		//				" ORDER BY ue.date DESC LIMIT 5", session.user.id)
		//		def UserSitupsInstanceList = db.rows(
		//				"SELECT ue.situps, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' FROM user_exercise ue WHERE ue.user_id = ? AND ue.situps > 0 " +
		//				" ORDER BY ue.date DESC LIMIT 5", session.user.id)
		//		def UserSquatsInstanceList = db.rows(
		//				"SELECT ue.squats, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date'  FROM user_exercise ue WHERE ue.user_id = ? AND ue.squats > 0 " +
		//				" ORDER BY ue.date DESC LIMIT 5", session.user.id)
		//		def UserStepsInstanceList = db.rows(
		//				"SELECT ue.steps, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date'  FROM user_exercise ue WHERE ue.user_id = ? AND ue.steps > 0 " +
		//				" ORDER BY ue.date DESC LIMIT 5", session.user.id)

		[UserCaloriesInstanceList: UserCaloriesInstanceList,
			UserCarbohydratesInstanceList: UserCarbohydratesInstanceList,
			UserCholestrolInstanceList: UserCholestrolInstanceList,
			UserBloodPressureInstanceList: UserBloodPressureInstanceList,
			UserBmiInstanceList: UserBmiInstanceList]
		//			UserPushupsInstanceList: UserPushupsInstanceList,
		//			UserSitupsInstanceList: UserSitupsInstanceList,
		//			UserSquatsInstanceList: UserSquatsInstanceList,
		//			UserStepsInstanceList: UserStepsInstanceList]
	}

	/**
	 * Saves a new data entry for calories into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveCalories() {

		def newCaloriesInstance = new UserCalories(params)

		def existingCaloriesInstance = UserCalories.findByCalDate(newCaloriesInstance.calDate.clearTime())

		// If cal entry already exists for today, sum up the total.
		if (existingCaloriesInstance)
		{
			existingCaloriesInstance.amount = existingCaloriesInstance.amount + params.amount.toInteger()
			existingCaloriesInstance.save(flush: true)

			redirect(action: "wellness", params: params)
			return

		}
		// If no cal entry exists for today... insert
		else
		{
			if (!newCaloriesInstance.save(flush: true)) {
				flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
					message(code: 'UserCalories.label', default: 'UserBmi')
				])
				redirect(action: "wellness", params: params)
				return
			}
		}

		redirect(action: "wellness", params: params)
	}

	/**
	 * Saves a new data entry for carbohydrates into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveCarbohydrates() {

		def newCarbohydratesInstance = new UserCarbohydrates(params)

		def existingCarbsInstance = UserCarbohydrates.findByCarbDate(newCarbohydratesInstance.carbDate.clearTime())

		// If carb entry already exists for today, sum up the total.
		if (existingCarbsInstance)
		{
			existingCarbsInstance.amount = existingCarbsInstance.amount + params.amount.toInteger()
			existingCarbsInstance.save(flush: true)

			redirect(action: "wellness", params: params)
			return

		}
		// If no carb entry exists for today... insert
		else
		{
			if (!newCarbohydratesInstance.save(flush: true)) {
				flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
					message(code: 'UserCarbohydrates.label', default: 'UserBmi')
				])
				redirect(action: "wellness", params: params)
				return
			}
		}

		redirect(action: "wellness", params: params)
	}

	/**
	 * Saves a new data entry for cholestrol into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveCholestrol() {

		def UserCholestrolInstance = new UserCholestrol(params)

		if (!UserCholestrolInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserCholestrol.label', default: 'UserCholestrol')
			])
			redirect(action: "wellness", params: params)
			return
		}

		redirect(action: "wellness", params: params)
	}

	/**
	 * Saves a new data entry for blood pressures into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveBloodPressure() {

		def UserBloodPressureInstance = new UserBloodPressure(params)

		if (!UserBloodPressureInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserBloodPressure.label', default: 'UserBloodPressure')
			])
			redirect(action: "wellness", params: params)
			return
		}

		redirect(action: "wellness", params: params)
	}

	/**
	 * Saves a new data entry for BMI (height and weight) into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveBmi() {

		def bmi = params.weight.toInteger() * 703 / (params.height.toInteger() * params.height.toInteger())

		params.bmi = bmi

		def UserBmiInstance = new UserBmi(params)

		if (!UserBmiInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserBmi.label', default: 'UserBmi')
			])
			redirect(action: "wellness", params: params)
			return
		}

		redirect(action: "wellness", params: params)
	}

	/**
	 * Saves a new data entry for the exercise information into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveExercise() {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def UserBloodPressureInstance = db.execute(
				"INSERT INTO user_exercise (version, pushups, situps, squats, steps, date, user_id) " +
				" VALUES (0, ?, ?, ?, ?, ?, ?) ", params.pushups, params.situps, params.squats, params.steps, params.date, params.user.id)

		redirect(action: "wellness", params: params)
	}

}
