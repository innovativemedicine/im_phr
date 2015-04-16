package phr

import phr.Questions;

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class QuestionsController {

	static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "questions", params: params)
	}

	def auth() {
		if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	}

	/**
	 * Main landing page for Questions tab.
	 */
	def questions = {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def QuestionsInstanceList = db.rows(
				"SELECT q.question_id, q.question_text " +
				" FROM questions q" +
				" ORDER BY q.question_id ASC")

		[QuestionsInstanceList: QuestionsInstanceList]
	}

	def create() {
		[QuestionsInstance: new Questions(params)]
	}

	def save() {
		def QuestionsInstance = new Questions(params)

		if (!QuestionsInstance.save(flush: true)) {
			render(view: "create", model: [QuestionsInstance: QuestionsInstance])
			return
		}
		redirect(action: "questions", params: params)
	}

	def edit(Long id) {
		def QuestionsInstance = Questions.get(id)

		if (!QuestionsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Questions.label', default: 'Questions'),
				id
			])
			redirect(action: "questions")
			return
		}

		[questionsInstance: QuestionsInstance]
	}

	def update(Long id, Long version) {
		def QuestionsInstance = Questions.get(id)
		if (!QuestionsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Questions.label', default: 'Questions'),
				id
			])
			redirect(action: "questions")
			return
		}

		if (version != null) {
			if (QuestionsInstance.version > version) {
				QuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'Questions.label', default: 'Questions')] as Object[],
						"Another user has updated this Questions while you were editing")
				render(view: "edit", model: [QuestionsInstance: QuestionsInstance])
				return
			}
		}

		QuestionsInstance.properties = params

		if (!QuestionsInstance.save(flush: true)) {
			render(view: "edit", model: [QuestionsInstance: QuestionsInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'Questions.label', default: 'Questions'),
			QuestionsInstance.id
		])
		redirect(action: "questions", id: QuestionsInstance.id)
	}

	def delete(Long id) {
		def QuestionsInstance = Questions.get(id)
		if (!QuestionsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'Questions.label', default: 'Questions'),
				id
			])
			redirect(action: "questions")
			return
		}

		try {
			QuestionsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'Questions.label', default: 'Questions'),
				id
			])
			redirect(action: "questions")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'Questions.label', default: 'Questions'),
				id
			])
			redirect(action: "questions", id: id)
		}

	}

}
