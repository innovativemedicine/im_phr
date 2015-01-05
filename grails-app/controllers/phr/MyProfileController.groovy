package phr

import phr.UserEmergencyContacts;
import phr.UserEmploymentInfo;
import phr.UserFile;
import phr.UserPhysicianInfo;
import phr.UserProfile;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import javax.servlet.http.HttpServletRequest

import groovy.sql.Sql

import org.apache.commons.io.FileUtils
import org.apache.commons.io.monitor.FileEntry


class MyProfileController {

	static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
	private static final okcontents = [
		'image/png',
		'image/jpeg',
		'image/gif'
	]

	def dataSource // the Spring-Bean "dataSource" is auto-injected

	// Ensure that all pages must be accessed by a logged in user
	def beforeInterceptor = [action:this.&auth]

	def index() {
		redirect(action: "myProfile", params: params)
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
	 * Main landing page for Profile tab, listing the details about the current user's information.
	 */
	def myProfile = {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		def UserProfileInstanceList = db.rows(
				"SELECT up.*, DATE_FORMAT(up.birthday, '%d/%m/%Y') AS 'birthday' " +
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
		def UserPhysicianInstanceList = db.rows(
				"SELECT upi.* " +
				" FROM user_physician_info upi " +
				" WHERE upi.user_id = ? ", session.user.id)

		[UserProfileInstanceList: UserProfileInstanceList, UserContactsInstanceList: UserContactsInstanceList,
			UserEmploymentInstanceList: UserEmploymentInstanceList, UserPhysicianInstanceList: UserPhysicianInstanceList]
	}

	//    /**
	//     * Saves the data for the user's profile
	//     * @return the function fails if it is unable to load the data
	//     */
	//    def save() {
	//        def LoginInstance = new Login(params)
	//        def UserProfileInstance = new UserProfile(params)
	//
	//        if (!LoginInstance.save(flush: true)) {
	//            render(view: "create", model: [LoginInstance: LoginInstance])
	//            return
	//        }
	//
	//        if (!UserProfileInstance.save(flush: true)) {
	//            flash.message = message(code: 'There was an error saving your Profile. Make sure all the fields are correct and try again.', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
	//            redirect(action: "edit", id: params.id)
	//            return
	//        }
	//        redirect(action: "myProfile", params: params)
	//    }

	/**
	 * Loads the corresponding data to allow the user to edit the different fields. 
	 * Able to edit the user profile, employment info, emergency contacts, and physician info.
	 * @param id   - the corresponding ID for the specific entry
	 * @param page - the type of page that gets updated
	 * @return the function fails if it is unable to load the data
	 */
	def edit(Long id, String page) {
		if (page == "profile") {
			def UserProfileInstance = UserProfile.get(id)
			if (!UserProfileInstance) {
				flash.message = message(code: 'There was an error loading your Profile', args: [
					message(code: 'UserProfile.label', default: 'UserProfile'),
					id
				])
				redirect(action: "edit", id: params.id, page: "profile")
				return
			}
			[page: page, userProfileInstance: UserProfileInstance]

		} else if (page == "employment") {
			def UserEmploymentInstance = UserEmploymentInfo.get(id)
			if (!UserEmploymentInstance) {
				flash.message = message(code: 'There was an error loading your Employment information', args: [
					message(code: 'UserProfile.label', default: 'UserProfile'),
					id
				])
				redirect(action: "edit", id: params.id, page: "employment")
				return
			}
			[page: page, userEmploymentInstance: UserEmploymentInstance]

		} else if (page == "contacts") {
			def UserContactsInstance = UserEmergencyContacts.get(id)
			if (!UserContactsInstance) {
				flash.message = message(code: 'There was an error loading your Emergency Contacts information', args: [
					message(code: 'UserProfile.label', default: 'UserProfile'),
					id
				])
				redirect(action: "edit", id: params.id, page: "contacts")
				return
			}
			[page: page, userContactsInstance: UserContactsInstance]

		} else if (page == "physician") {
			def userPhysicianInfoInstance = UserPhysicianInfo.get(id)
			if (!userPhysicianInfoInstance) {
				flash.message = message(code: 'There was an error loading your Physicians information', args: [
					message(code: 'UserProfile.label', default: 'UserProfile'),
					id
				])
				redirect(action: "edit", id: params.id, page: "contacts")
				return
			}
			[page: page, userPhysicianInfoInstance: userPhysicianInfoInstance]

		}
	}

	/**
	 * Saves the updated profile data.
	 * @param id      - the id number of the specific user
	 * @param version - the number of times the specific user data has been edited
	 * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
	 */
	def updateProfile(Long id, Long version) {
		def UserProfileInstance = UserProfile.get(id)

		if (!UserProfileInstance) {
			flash.message = message(code: 'There was an error loading your profile', args: [
				message(code: 'UserProfile.label', default: 'UserProfile'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		if (version != null) {
			if (UserProfileInstance.version > version) {
				UserProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'UserProfile.label', default: 'UserProfile')] as Object[],
						"Another user has updated this profile while you were editing")
				render(view: "edit", model: [UserProfileInstance: UserProfileInstance])
				return
			}
		}

		UserProfileInstance.properties = params

		if (!UserProfileInstance.save(flush: true)) {
			flash.message = message(code: 'There was an error updating your Profile. Make sure all the fields are correct and try again.', args: [
				message(code: 'UserProfile.label', default: 'UserProfile'),
				id
			])
			redirect(action: "edit", id: params.id, page: "profile")
			return
		}

		flash.message = message(code: 'Profile updated successfully', args: [
			message(code: 'UserProfile.label', default: 'UserProfile'),
			UserProfileInstance.id
		])
		redirect(action: "myProfile", id: UserProfileInstance.id)
	}

	/**
	 * Saves the updated employment information data.
	 * @param id      - the id number of the employment information
	 * @param version - the number of times the specific employment information has been edited
	 * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
	 */
	def updateEmployment(Long id, Long version) {
		def UserEmploymentInfoInstance = UserEmploymentInfo.get(id)

		if (!UserEmploymentInfoInstance) {
			flash.message = message(code: 'There was an error loading your employment info', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		if (version != null) {
			if (UserEmploymentInfoInstance.version > version) {
				UserEmploymentInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo')] as Object[],
						"Another user has updated this employment info while you were editing")
				render(view: "edit", model: [UserEmploymentInfoInstance: UserEmploymentInfoInstance])
				return
			}
		}

		UserEmploymentInfoInstance.properties = params

		if (!UserEmploymentInfoInstance.save(flush: true)) {
			flash.message = message(code: 'There was an error updating your Employment Info. Make sure all the fields are correct and try again.', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				id
			])
			redirect(action: "edit", id: params.id, page: "employment")
			return
		}

		flash.message = message(code: 'Employment info updated successfully', args: [
			message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
			UserEmploymentInfoInstance.id
		])
		redirect(action: "myProfile", id: UserEmploymentInfoInstance.id)
	}

	/**
	 * Saves the updated emergency contacts information.
	 * @param id      - the id number of the emergency contact information
	 * @param version - the number of times the specific contact has been edited
	 * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
	 */
	def updateContacts(Long id, Long version) {
		def UserEmergencyContactsInstance = UserEmergencyContacts.get(id)

		if (!UserEmergencyContactsInstance) {
			flash.message = message(code: 'There was an error loading your emergency contacts', args: [
				message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		if (version != null) {
			if (UserEmergencyContactsInstance.version > version) {
				UserEmergencyContactsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts')] as Object[],
						"Another user has updated this UserEmergencyContacts while you were editing")
				render(view: "edit", model: [UserEmergencyContactsInstance: UserEmergencyContactsInstance])
				return
			}
		}

		UserEmergencyContactsInstance.properties = params

		if (!UserEmergencyContactsInstance.save(flush: true)) {
			flash.message = message(code: 'There was an error updating your Contacts Info. Make sure all the fields are correct and try again.', args: [
				message(code: 'UserContactInfo.label', default: 'UserContactInfo'),
				id
			])
			redirect(action: "edit", id: params.id, page: "employment")
			return
		}

		flash.message = message(code: 'Emergency contacts updated successfully', args: [
			message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
			UserEmergencyContactsInstance.id
		])
		redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
	}

	/**
	 * Saves the updated physician information.
	 * @param id      - the id number of the physician
	 * @param version - the number of times the specific physician data has been edited
	 * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
	 */
	def updatePhysician(Long id, Long version) {
		def UserPhysicianInfoInstance = UserPhysicianInfo.get(id)
		if (!UserPhysicianInfoInstance) {
			flash.message = message(code: 'There was an error saving your physician information', args: [
				message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		if (version != null) {
			if (UserPhysicianInfoInstance.version > version) {
				UserPhysicianInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo')] as Object[],
						"Another user has updated this UserPhysicianInfo while you were editing")
				render(view: "edit", model: [UserPhysicianInfoInstance: UserPhysicianInfoInstance])
				return
			}
		}

		UserPhysicianInfoInstance.properties = params

		if (!UserPhysicianInfoInstance.save(flush: true)) {
			flash.message = message(code: 'There was an error updating your Employment Info. Make sure all the fields are correct and try again.', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				id
			])
			redirect(action: "edit", id: params.id, page: "employment")
			return
		}

		flash.message = message(code: UserPhysicianInfoInstance.name + '&#39;s information updated successfully', args: [
			message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
			UserPhysicianInfoInstance.id
		])
		redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
	}

	/**
	 * Opens the 'create' view to allow users to add a new data entry according to the page.
	 */
	def create(String page) {
		if (page == "employment") {
			[page: page, userEmploymentInstance: new UserEmploymentInfo(params)]
		} else if (page == "contacts") {
			[page: page, userContactsInfoInstance: new UserEmergencyContacts(params)]
		} else if (page == "physician") {
			[page: page, userPhysicianInfoInstance: new UserPhysicianInfo(params)]
		} else if (page == "profile") {
			[page: page, userProfileInstance: new UserProfile(params)]
		}
	}

	/**
	 * Saves a new data entry for user physicians into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveProfile() {
		def UserProfileInstance = new UserProfile(params)

		if (!UserProfileInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserProfile.label', default: 'UserProfile')
			])
			redirect(action: "create", params: params)
			return
		}

		flash.message = message(code: 'Profile saved successfully', args: [
			message(code: 'UserProfile.label', default: 'UserProfile'),
			UserProfileInstance.id
		])
		redirect(action: "myProfile", id: UserProfileInstance.id)
	}

	/**
	 * Saves a new data entry for user physicians into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def savePhysician() {
		def UserPhysicianInfoInstance = new UserPhysicianInfo(params)

		if (!UserPhysicianInfoInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo')
			])
			redirect(action: "create", params: params)
			return
		}

		flash.message = message(code: 'Physician info saved successfully', args: [
			message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
			UserPhysicianInfoInstance.id
		])
		redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
	}

	/**
	 * Saves a new data entry for user contacts into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveContacts() {
		def UserEmergencyContactsInstance = new UserEmergencyContacts(params)

		if (!UserEmergencyContactsInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts')
			])
			redirect(action: "create", params: params)
			return
		}

		flash.message = message(code: 'Contact info saved successfully', args: [
			message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
			UserEmergencyContactsInstance.id
		])
		redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
	}

	/**
	 * Saves a new data entry for user employment information into the database.
	 * @return the function fails if it is unable to save the data
	 */
	def saveEmployment() {
		def UserEmploymentInstance = new UserEmploymentInfo(params)

		if (!UserEmploymentInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'UserEmployment.label', default: 'UserEmployment')
			])
			redirect(action: "create", params: params)
			return
		}

		flash.message = message(code: 'Employment information saved successfully', args: [
			message(code: 'UserEmployment.label', default: 'UserEmployment'),
			UserEmploymentInstance.id
		])
		redirect(action: "myProfile", id: UserEmploymentInstance.id)
	}

	/**
	 * Deletes the specific employment entry from the database
	 * @param id - the id number of the specific employment entry
	 * @return the function fails if it is unable to load the data
	 */
	def deleteEmployment(Long id) {
		def UserEmploymentInfoInstance = UserEmploymentInfo.get(id)

		if (!UserEmploymentInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		try {
			UserEmploymentInfoInstance.delete(flush: true)
			flash.message = message(code: 'Employment info deleted successfully', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				UserEmploymentInfoInstance.id
			])
			redirect(action: "myProfile")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'),
				id
			])
			redirect(action: "myProfile", id: UserEmploymentInfoInstance.id)
		}
	}

	/**
	 * Deletes the specific contact data from the database
	 * @param id - the id number of the specific contact data
	 * @return the function fails if it is unable to load the data
	 */
	def deleteContacts(Long id) {
		def UserEmergencyContactsInstance = UserEmergencyContacts.get(id)

		if (!UserEmergencyContactsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		try {
			UserEmergencyContactsInstance.delete(flush: true)
			flash.message = message(code: 'Contact information deleted successfully', args: [
				message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
				UserEmergencyContactsInstance.id
			])
			redirect(action: "myProfile")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'),
				id
			])
			redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
		}
	}

	/**
	 * Deletes the specific physician information from the database
	 * @param id - the id number of the specific physician information 
	 * @return the function fails if it is unable to load the data
	 */
	def deletePhysician(Long id) {
		def UserPhysicianInfoInstance = UserPhysicianInfo.get(id)

		if (!UserPhysicianInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
				id
			])
			redirect(action: "myProfile")
			return
		}

		try {
			UserPhysicianInfoInstance.delete(flush: true)
			flash.message = message(code: 'Physician info deleted successfully', args: [
				message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
				UserPhysicianInfoInstance.id
			])
			redirect(action: "myProfile")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'),
				id
			])
			redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
		}
	}

	/**
	 * Saves an uploaded profile image from the user into the database
	 * @return the function fails if the uploaded file is empty or if it couldn't save properly into the database
	 */
	def saveImage() {
		def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

		// Check if you are updating an old image or creating a new entry
		def row = db.firstRow("SELECT COUNT(*) FROM user_file WHERE user_id = ?", params.userId)

		def fileInstance;

		if (row[0]) {
			fileInstance = UserFile.findByUserId(session.user.id)
		} else {
			fileInstance = new UserFile(params)
		}

		def uploadedFile = request.getFile('filePayload')

		//        if (uploadedFile.getBytes() == null || uploadedFile.getBytes().length == 0) {
		if (uploadedFile.empty ) { //&& uploadService.isFileAllowed(uploadedFile)) {
			flash.message = "Please select an image to upload"
			redirect(action: "myProfile")
			return
		}

		fileInstance.filePayload = uploadedFile.getBytes() //converting the file to bytes
		fileInstance.fileName = uploadedFile.originalFilename //getting the file name from the uploaded file
		fileInstance.fileType = uploadedFile.contentType//getting and storing the file type

		if (!fileInstance.save(flush: true)) {
			flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [
				message(code: 'File.label', default: 'File')
			])
			redirect(action: "myProfile")
			return
		}

		flash.message = "Profile image updated"
		redirect(action: "myProfile")
	}

	/**
	 * Loads up the profile image of the user and displays it in the view
	 */
	def showPayload() {
		def fileInstance = UserFile.findByUserId(session.user.id)

		if (fileInstance == null) {
			fileInstance = UserFile.findByFileName("placeholder-img.png")
		}
		else
		{
			response.outputStream << fileInstance.filePayload // write the image to the outputstream
			response.outputStream.flush()
		}
	}

	/**
	 * Deletes the specific user's profile image
	 */
	def delete() {
		def fileInstance = UserFile.findByUserId(session.user.id)
		fileInstance.delete(flush: true) //flush:true ->flushes the persistence context, persisting the object immediately
		redirect(action: "myProfile")
	}

}
