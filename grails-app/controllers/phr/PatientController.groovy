package phr

import groovy.sql.Sql

class PatientController {

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	def index() {
		[UserProfileInstance: new UserProfile()]
	}


	def show() {
		def patientProfile = UserProfile.findByFirstNameAndLastName(params.firstName, params.lastName)
		def patient = patientProfile.user

		def UserContactsInstanceList = UserEmergencyContacts.findAllByUser(patient)
		def UserMedicationsInstanceList = UserMedications2.findAllByUser(patient)

		def UserConditionsInstanceList = UserConditions.findAllByUser(patient)
		def UserEmploymentInstanceList = UserEmploymentInfo.findAllByUser(patient)
		def UserImmunizationsInstanceList = UserImmunizations.findAllByUser(patient)
		def UserAllergiesInstanceList = UserAllergies.findAllByUser(patient)
		def UserCaloriesInstanceList = UserCalories.findAllByUser(patient)
		def UserCarbohydratesInstanceList = UserCarbohydrates.findAllByUser(patient)
		def UserCholestrolInstanceList = UserCholestrol.findAllByUser(patient)
		def UserBloodPressureInstanceList = UserBloodPressure.findAllByUser(patient)
		def UserBmiInstanceList = UserBmi.findAllByUser(patient)

		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def BasdaiMostRecent = db.rows(
				"SELECT user_questions_answers.date FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'BASDAI' AND " +
				"user_questions_answers.user_id = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC LIMIT 1", patient.id)

		def BasdaiQuestionsInstanceList = db.rows(
				"SELECT user_questions_answers.date, questions.question_text, questions.page_name, questions_answers.answer_value FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'BASDAI' AND " +
				"user_questions_answers.user_id = ? AND " +
				"user_questions_answers.date = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC", patient.id, BasdaiMostRecent.date[0])

		def BasfiMostRecent = db.rows(
				"SELECT user_questions_answers.date FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'BASFI' AND " +
				"user_questions_answers.user_id = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC LIMIT 1", patient.id)

		def BasfiQuestionsInstanceList = db.rows(
				"SELECT user_questions_answers.date, questions.question_text, questions.page_name, questions_answers.answer_value FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'BASFI' AND " +
				"user_questions_answers.user_id = ? AND " +
				"user_questions_answers.date = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC", patient.id, BasfiMostRecent.date[0])

		def HealthMostRecent = db.rows(
				"SELECT user_questions_answers.date FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'Health Assessment Questionnaire' AND " +
				"user_questions_answers.user_id = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC LIMIT 1", patient.id)

		def HealthQuestionsInstanceList = db.rows(
				"SELECT user_questions_answers.date, questions.question_text, questions.page_name, questions_answers.answer_value FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'Health Assessment Questionnaire' AND " +
				"user_questions_answers.user_id = ? AND " +
				"user_questions_answers.date = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC", patient.id, HealthMostRecent.date[0])


		def PgaMostRecent = db.rows(
				"SELECT user_questions_answers.date FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'PGA' AND " +
				"user_questions_answers.user_id = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC LIMIT 1", patient.id)

		def PgaQuestionsInstanceList = db.rows(
				"SELECT user_questions_answers.date, questions.question_text, questions.page_name, questions_answers.answer_value FROM " +
				"user_questions_answers, questions_answers, questions " +
				"WHERE " +
				"user_questions_answers.qa_id = questions_answers.qa_id AND " +
				"questions_answers.question_id = questions.question_id AND " +
				"questions.page_name = 'PGA' AND " +
				"user_questions_answers.user_id = ? AND " +
				"user_questions_answers.date = ? " +
				"ORDER BY user_questions_answers.date DESC, questions.question_id ASC", patient.id, PgaMostRecent.date[0])

		print PgaQuestionsInstanceList

		[UserProfileInstance: patientProfile, UserContactsInstanceList: UserContactsInstanceList,
			UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList,
			UserMedicationsInstanceList: UserMedicationsInstanceList,
			UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList,
			UserCaloriesInstanceList: UserCaloriesInstanceList, UserCarbohydratesInstanceList: UserCarbohydratesInstanceList,
			UserCholestrolInstanceList: UserCholestrolInstanceList, UserBloodPressureInstanceList: UserBloodPressureInstanceList,
			UserBmiInstanceList: UserBmiInstanceList, BasdaiQuestionsInstanceList: BasdaiQuestionsInstanceList, BasfiQuestionsInstanceList: BasfiQuestionsInstanceList,
			HealthQuestionsInstanceList: HealthQuestionsInstanceList, PgaQuestionsInstanceList: PgaQuestionsInstanceList]
	}
}
