package phr

import phr.Login;

import org.springframework.dao.DataIntegrityViolationException

class LoginController {

	static allowedMethods = [save: "POST", update: "POST", delete: ["POST"]]

	def index() {
		redirect(action:"login", params: params)
	}

	/**
	 * Opens the 'login' view to allow users to login with their credentials
	 */
	def login = {
		if (session.user != null) {
			redirect(uri:'/')
		}
	}

	/**
	 * Checks whether the user credentials matched any existing users in the database
	 */
	def authenticate = {
		def user = Login.findByUserNameAndPassword(params.userName, params.password)
		if (user) {
			session.user = user
			session.userRole = user.role

			print session.userRole

			if (session.userRole == "DOCTOR") {
				redirect (uri: '/patient/index')
			}
			else {
				redirect(uri:'/')
			}
		} else {
			flash.message = "Sorry. Please try again."
			redirect(action:"login")
		}
	}

	/**
	 * Opens the view to create a new user
	 */
	def createUser() {
		[LoginInstance: new Login(params)]
	}

	/**
	 * Saves the new user info into the database
	 * @return the function fails if the username already exists, if the passwords do not match, if the password field is empty, or if it is unable to save the data
	 */
	def saveNewUser() {
		def user = Login.findByUserName(params.userName)
		if (user) {
			flash.message = "The username already exists. Please use another one."
			redirect(action: "createUser")
			return
		}

		if (params.password != params.password2) {
			flash.message = message(code: 'The passwords do not match.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createUser")
			return
		}
		if (params.password == "") {
			flash.message = message(code: 'The password cannot be blank.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createUser")
			return
		}

		def LoginInstance = new Login(userName: params.userName, password: params.password, role: "PATIENT")

		if (!LoginInstance.save(failOnError: true)) {
			flash.message = message(code: 'There was an error creating the user.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createUser")
			return
		}

		flash.message = message(code: 'User created successfully', args: [
			message(code: 'Login.label', default: 'UserMedications'),
			LoginInstance.id
		])
		redirect(action: "login")
	}

	/**
	 * Opens the view to create a new user
	 */
	def createDoctor() {
		[LoginInstance: new Login(params)]
	}

	/**
	 * Saves the new user info into the database
	 * @return the function fails if the username already exists, if the passwords do not match, if the password field is empty, or if it is unable to save the data
	 */
	def saveNewDoctor() {
		def user = Login.findByUserName(params.userName)
		if (user) {
			flash.message = "The username already exists. Please use another one."
			redirect(action: "createDoctor")
			return
		}

		if (params.password != params.password2) {
			flash.message = message(code: 'The passwords do not match.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createDoctor")
			return
		}
		if (params.password == "") {
			flash.message = message(code: 'The password cannot be blank.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createDoctor")
			return
		}

		def LoginInstance = new Login(userName: params.userName, password: params.password, role: "DOCTOR")

		if (!LoginInstance.save(failOnError: true)) {
			flash.message = message(code: 'There was an error creating the user.', args: [
				message(code: 'Login.label', default: 'Login')
			])
			redirect(action: "createDoctor")
			return
		}

		flash.message = message(code: 'User created successfully', args: [
			message(code: 'Login.label', default: 'UserMedications'),
			LoginInstance.id
		])
		redirect(action: "login")
	}


	/**
	 * Logs the user out. Currently there are no ways to log out manually unless the user idles a long time, 
	 * if the browser restarts, or if the user visits this page manually in the URL.
	 */
	def logout = {
		session.user = null
		session.userRole = null
		redirect(action:"login")
	}

	/**
	 * Demo page
	 */
	def welcome =  {
		if (session.user != null) {
			[userName:session.user.userName]
		} else {
			redirect(action: "login");
		}
	}
}
