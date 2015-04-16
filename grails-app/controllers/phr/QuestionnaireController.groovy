package phr

import phr.QuestionsAnswers;

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class QuestionnaireController {

	static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "questionnaire", params: params)
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
	 * Main landing page for Questionnaires tab.
	 */
	def questionnaire = {
		if (params.var1 == null) {
			params.var1 = "BASDAI"
			redirect(action: "questionnaire", params: params)
		}

		def questionnaireParam = params.var1

		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def QuestionsInstanceList = db.rows(
				"SELECT q.question_id, q.question_text, q.page_name " +
				" FROM questions q" +
				" WHERE page_name = ? ORDER BY q.question_id ASC", questionnaireParam)

		[QuestionsInstanceList: QuestionsInstanceList, questionnaireParam: questionnaireParam]
	}

	/**
	 * Saves the user's questionnaire answers into the database. Goes through each question and pulls the answer values.
	 * @return the function fails if it is unable to save the data
	 */
	def save() {
		Date test = new Date()

		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		// Set the value that designates the User answering the questionnaire
		def UserQuestionsAnswersInstance = db.execute(
				"INSERT INTO user_questions_answers (version, date, user_id) " +
				" VALUES (0, ?, ?) ", new Date(), params.user.id)

		// Get the ID that was created in last MySQL call
		def lastId = db.rows("SELECT LAST_INSERT_ID() AS 'id';")
		long qaId = lastId.get(0).id   //lastId.id

		//println params

		// Save the data into the QuestionAnswers Table that links the userId with the Questions and Answers
		for (e in params) {
			if (e.key.contains("_"))
			{
				// Do nothing
			}
			else if (e.key.contains("Q")) {

				def questionId = e.key.substring(1)
				def answerId = e.value
				def answerValue = e.value
				def other = 0;

				// Health Questionaires
				if (e.key == "Q26" || e.key == "Q34" || e.key == "Q49" || e.key == "Q56" )
				{

					if(answerValue.size() >= 1)
					{
						answerValue = answerValue.toString()
					}
					else
					{
						answerValue = answerValue.join(",")
					}

					answerId = 18

					if (answerValue.contains("Other"))
					{
						if (e.key == "Q26")
						{
							answerValue = answerValue.replaceAll("Other", params.other26b)
						}
						else if (e.key == "Q49")
						{
							answerValue = answerValue.replaceAll("Other", params.other49b)
						}
					}

				}
				// Health Questionaiers
				else if (questionId.toInteger() >= 17 && questionId.toInteger() <= 59 )
				{
					answerValue = answerValue.toString().replaceAll('0','Without any difficulty').replaceAll('1','With some difficulty').replaceAll('2', 'With much difficulty').replaceAll('3', 'Unable to do')
				}
				// Questions with "other, specify" fields
				//				else if (e.key == "Q33") {
				//					other = params.other33b
				//					answerId = 23
				//				}
				else if (e.key == "Q55") {
					other = params.other55b
					answerId = 23
				}
				// Questions with ranges
				else if (e.key == "Q60" || e.key == "Q61" || e.key == "Q62" ) {
					other = e.value
					answerId = 44
				}

				def QuestionsAnswersInstance = new QuestionsAnswers(qaId: qaId, questionId: questionId, answerId: answerId, other: other, answerValue: answerValue)


				//println qaId + " " + questionId + " " + answerId + " " + other + " " + answerValue

				if (!QuestionsAnswersInstance.save(flush: true)) {
					render(action: "questionnaire", params: params)
					return
				}
			}
		}

		redirect(action: "questionnaire", params: params)
	}
}
