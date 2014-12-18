package phr

import phr.Answers;

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class AnswersController {

	static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "answers", params: params)
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
	 * Main landing page for Answers tab. 
	 */
	def answers = {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def AnswersInstanceList = db.rows(
				"SELECT a.answer_id, a.answer_text " +
				" FROM answers a" +
				" ORDER BY a.answer_id ASC")

		[AnswersInstanceList: AnswersInstanceList]
	}

	/**
	 * Opens the 'create' view to allow users to add a new answer.
	 */
	def create() {
		[AnswersInstance: new Answers(params)]
	}

	/**
	 * Saves a new data entry for the answers into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def save() {
		def AnswersInstance = new Answers(params)

		if (!AnswersInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'Answers.label', default: 'Answers')
			])
			render(view: "create", model: [AnswersInstance: AnswersInstance])
			return
		}

		flash.message = message(code: 'Answer added successfully', args: [
			message(code: 'AnswersInstance.label', default: 'AnswersInstance'),
			AnswersInstance.id
		])
		redirect(action: "answers", params: params)
	}

	/**
	 * Loads an existing answer into the page to allow the user to edit the different fields.
	 * @param id - the id number of the specific answer entry
	 * @return the function fails if it is unable to load the data
	 */
	def edit(Long id) {
		def AnswersInstance = Answers.get(id)

		if (!AnswersInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Answers.label', default: 'Answers'),
				id
			])
			redirect(action: "answers")
			return
		}

		[answersInstance: AnswersInstance]
	}

	/**
	 * Saves the updated answer entry into the database.
	 * @param id      - the id number of the specific answer entry
	 * @param version - the number of times the specific entry has been edited
	 * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
	 */
	def update(Long id, Long version) {
		def AnswersInstance = Answers.get(id)
		if (!AnswersInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Answers.label', default: 'Answers'),
				id
			])
			redirect(action: "answers")
			return
		}

		if (version != null) {
			if (AnswersInstance.version > version) {
				AnswersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'Answers.label', default: 'Answers')] as Object[],
						"Another user has updated this Answers while you were editing")
				render(view: "edit", model: [AnswersInstance: AnswersInstance])
				return
			}
		}

		AnswersInstance.properties = params

		if (!AnswersInstance.save(flush: true)) {
			render(view: "edit", model: [AnswersInstance: AnswersInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'Answers.label', default: 'Answers'),
			AnswersInstance.id
		])
		redirect(action: "answers", id: AnswersInstance.id)
	}

	/**
	 * Deletes the answer entry from the database
	 * @param id - the id number of the specific answer entry
	 * @return the function fails if it is unable to load the data
	 */
	def delete(Long id) {
		def AnswersInstance = Answers.get(id)
		if (!AnswersInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Answers.label', default: 'Answers'),
				id
			])
			redirect(action: "answers")
			return
		}

		try {
			AnswersInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'Answers.label', default: 'Answers'),
				id
			])
			redirect(action: "answers")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'Answers.label', default: 'Answers'),
				id
			])
			redirect(action: "answers", id: id)
		}
	}

}
