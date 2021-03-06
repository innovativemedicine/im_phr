package phr

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class SummaryController {

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "summary")
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
	 * Main landing page for Summary tab. Gets all of the data from the other tables and displays it to the user.
	 */
	def summary = {

		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		// User Info
		def UserProfileInstanceList = db.rows(
				"SELECT up.* " +
				" FROM user_profile up " +
				" WHERE up.user_id = ? ", session.user.id)
		def UserContactsInstanceList = db.rows(
				"SELECT uec.* " +
				" FROM user_emergency_contacts uec " +
				" WHERE uec.user_id = ? ", session.user.id)
		def UserEmploymentInstanceList = db.rows(
				"SELECT uei.* " +
				" FROM user_employment_info uei " +
				" WHERE uei.user_id = ? ", session.user.id)

		// Wellness
		//        def UserPushupsInstanceList = db.rows(
		//            "SELECT ue.pushups, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' " +
		//            " FROM user_exercise ue WHERE ue.user_id = ? AND ue.pushups > 0 " +
		//            " ORDER BY ue.date DESC LIMIT 1", session.user.id)
		//        def UserSitupsInstanceList = db.rows(
		//            "SELECT ue.situps, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' " +
		//            " FROM user_exercise ue WHERE ue.user_id = ? AND ue.situps > 0 " +
		//            " ORDER BY ue.date DESC LIMIT 1", session.user.id)
		//        def UserSquatsInstanceList = db.rows(
		//            "SELECT ue.squats, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' " +
		//            " FROM user_exercise ue WHERE ue.user_id = ? AND ue.squats > 0 " +
		//            " ORDER BY ue.date DESC LIMIT 1", session.user.id)
		//        def UserStepsInstanceList = db.rows(
		//            "SELECT ue.steps, SUM(ue.steps) AS 'total', DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' " +
		//            " FROM user_exercise ue WHERE ue.user_id = ? AND ue.steps > 0 " +
		//            " ORDER BY ue.date DESC LIMIT 1", session.user.id)
		def UserCaloriesInstanceList = db.rows(
				"SELECT uc.amount, DATE_FORMAT(uc.cal_date, '%d/%m/%Y') AS 'calDate' " +
				" FROM user_calories uc " +
				" WHERE uc.user_id = ? ORDER BY uc.cal_date DESC LIMIT 1", session.user.id)
		def UserCarbohydratesInstanceList = db.rows(
				"SELECT uc.amount, DATE_FORMAT(uc.carb_date, '%d/%m/%Y') AS 'carbDate' " +
				" FROM user_carbohydrates uc " +
				" WHERE uc.user_id = ? ORDER BY uc.carb_date DESC LIMIT 1", session.user.id)
		def UserCholestrolInstanceList = db.rows(
				"SELECT uc.amount, DATE_FORMAT(uc.chol_date, '%d/%m/%Y') AS 'cholDate' " +
				" FROM user_cholestrol uc " +
				" WHERE uc.user_id = ? ORDER BY uc.chol_date DESC LIMIT 1", session.user.id)
		def UserBloodPressureInstanceList = db.rows(
				"SELECT ub.*, DATE_FORMAT(ub.bp_date, '%d/%m/%Y') AS 'bpDate' " +
				" FROM user_blood_pressure ub " +
				" WHERE ub.user_id = ? ORDER BY ub.bp_date DESC LIMIT 1", session.user.id)
		def UserBmiInstanceList = db.rows(
				"SELECT ub.*, DATE_FORMAT(ub.bmi_date, '%d/%m/%Y') AS 'bmiDate' " +
				" FROM user_bmi ub " +
				" WHERE ub.user_id = ? ORDER BY ub.bmi_date DESC LIMIT 1", session.user.id)

		// Conditions
		def UserConditionsInstanceList = db.rows(
				"SELECT uc.name " +
				" FROM user_conditions uc " +
				" WHERE uc.user_id = ? AND (uc.end_date >= CURDATE() OR uc.end_date IS null) " +
				" ORDER BY uc.onset_date DESC", session.user.id)

		// Medications
		def UserMedicationsInstanceList = db.rows(
				"SELECT um.name, um.dose, um.frequency, um.form " +
				" FROM user_medications2 um " +
				" WHERE um.user_id = ? AND (um.stop_date >= CURDATE() OR um.stop_date IS null) " +
				" ORDER BY um.start_date DESC", session.user.id)

		// Immunizations
		def UserImmunizationsInstanceList = db.rows(
				"SELECT ui.name, DATE_FORMAT(ui.date, '%d/%m/%Y') AS 'date' " +
				" FROM user_immunizations ui " +
				" WHERE ui.user_id = ? " +
				" ORDER BY ui.date DESC", session.user.id)

		// Allergies
		def UserAllergiesInstanceList = db.rows(
				"SELECT ua.name, ua.reaction, ua.severity " +
				" FROM user_allergies ua " +
				" WHERE ua.user_id = ? " +
				" ORDER BY ua.severity_value DESC, ua.onset_date DESC", session.user.id)

		[UserProfileInstanceList: UserProfileInstanceList, UserContactsInstanceList: UserContactsInstanceList,
			UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList,
			UserMedicationsInstanceList: UserMedicationsInstanceList,
			UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList,
			UserCaloriesInstanceList: UserCaloriesInstanceList, UserCarbohydratesInstanceList: UserCarbohydratesInstanceList,
			UserCholestrolInstanceList: UserCholestrolInstanceList, UserBloodPressureInstanceList: UserBloodPressureInstanceList,
			UserBmiInstanceList: UserBmiInstanceList]

		//		UserPushupsInstanceList: UserPushupsInstanceList, UserSitupsInstanceList: UserSitupsInstanceList,
		//		UserSquatsInstanceList: UserSquatsInstanceList, UserStepsInstanceList: UserStepsInstanceList,
	}

}
