package im

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import javax.servlet.http.HttpServletRequest

import groovy.sql.Sql

import org.apache.commons.io.FileUtils
import org.apache.commons.io.monitor.FileEntry


class MyProfileController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "myProfile", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Profile tab. List the details about the current user's information
     */
    def myProfile = {
        println("profile");
        
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
    
    
    def save() {
        println("save");
        
        def LoginInstance = new Login(params)
        def UserProfileInstance = new UserProfile(params)
        
        if (!LoginInstance.save(flush: true)) {
            println("didn't save Login :  " + LoginInstance.errors);
            render(view: "create", model: [LoginInstance: LoginInstance])
            return
        }
        
        if (!UserProfileInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error saving your Profile. Make sure all the fields are correct and try again.', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
            redirect(action: "edit", id: params.id)
            return
        }
        redirect(action: "myProfile", params: params)
    }
    
    def edit(Long id, String page, String page123) {
        println("--- edit : " + id + " : " + page + " | " + page123);
        
        if (page == "profile") {
            println("PROFILE PAGE")
            def UserProfileInstance = UserProfile.get(id)
            println(UserProfileInstance)
            if (!UserProfileInstance) {
                flash.message = message(code: 'There was an error loading your Profile', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "profile")
                return
            }
            [page: page, userProfileInstance: UserProfileInstance]
            
        } else if (page == "employment") {
            println("EMPLOYMENT PAGE")
            def UserEmploymentInstance = UserEmploymentInfo.get(id)
            println(UserEmploymentInstance)
            
            if (!UserEmploymentInstance) {
                //TODO
                UserEmploymentInstance = new UserEmploymentInfo(params)
                //TODO: if not found / no entries in Employment table, go to new function to create one (like Physicians)
            }
            
            if (!UserEmploymentInstance) {
                flash.message = message(code: 'There was an error loading your Employment information', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "employment")
                return
            }
            [page: page, userEmploymentInstance: UserEmploymentInstance]
            
        } else if (page == "contacts") {
            println("CONTACTS PAGE")
            def UserContactsInstance = UserEmergencyContacts.get(id)
            println(UserContactsInstance.version)
            if (!UserContactsInstance) {
                flash.message = message(code: 'There was an error loading your Emergency Contacts information', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "contacts")
                return
            }
            [page: page, userContactsInstance: UserContactsInstance]
            
        } else if (page == "physician") {
            println("PHYSICIANS PAGE")
            def userPhysicianInfoInstance = UserPhysicianInfo.get(id)
            println(userPhysicianInfoInstance)
            
            if (!userPhysicianInfoInstance) {
                flash.message = message(code: 'There was an error loading your Physicians information', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "contacts")
                return
            }
            [page: page, userPhysicianInfoInstance: userPhysicianInfoInstance]
            
        }
        
    }
    
    def updateProfile(Long id, Long version) {
        println("update profile = " + id);
        def UserProfileInstance = UserProfile.get(id)
        
        if (!UserProfileInstance) {
            flash.message = message(code: 'There was an error loading your profile', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
            redirect(action: "myProfile")
            return
        }
        
        if (version != null) {
            if (UserProfileInstance.version > version) {
                UserProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserProfile.label', default: 'UserProfile')] as Object[],
                          "Another user has updated this profile while you were editing")
                render(view: "edit", model: [UserProfileInstance: UserProfileInstance])
                return
            }
        }
        
        UserProfileInstance.properties = params
        
        if (!UserProfileInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error updating your Profile. Make sure all the fields are correct and try again.', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
            redirect(action: "edit", page123: 'test', id: params.id, page: "profile")
            return
        }
        
        flash.message = message(code: 'Profile updated successfully', args: [message(code: 'UserProfile.label', default: 'UserProfile'), UserProfileInstance.id])
        redirect(action: "myProfile", id: UserProfileInstance.id)
    }
    
    
    
    def updateEmployment(Long id, Long version) {
        println("update employment = " + id);
        def UserEmploymentInfoInstance = UserEmploymentInfo.get(id)
        
        
        
        if (!UserEmploymentInfoInstance) {
            //TODO
            UserEmploymentInfoInstance = new UserEmploymentInfo(params)
            
            if (!UserEmploymentInfoInstance.save(flush: true)) {
                flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo')])
                redirect(action: "create", params: params)
                return
            }
            
            flash.message = message(code: 'Employment status updated successfully', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), UserEmploymentInfoInstance.id])
         //   redirect(action: "myProfile")
        }
        
        
        
        
        if (!UserEmploymentInfoInstance) {
            flash.message = message(code: 'There was an error loading your employment info', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "myProfile")
            return
        }

        if (version != null) {
            if (UserEmploymentInfoInstance.version > version) {
                UserEmploymentInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo')] as Object[],
                          "Another user has updated this employment info while you were editing")
                render(view: "edit", model: [UserEmploymentInfoInstance: UserEmploymentInfoInstance])
                return
            }
        }

        UserEmploymentInfoInstance.properties = params

        if (!UserEmploymentInfoInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error updating your Employment Info. Make sure all the fields are correct and try again.', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "edit", page123: 'test', id: params.id, page: "employment")
            return
        }
        
        flash.message = message(code: 'Employment info updated successfully', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), UserEmploymentInfoInstance.id])
        redirect(action: "myProfile", id: UserEmploymentInfoInstance.id)
    }
    
    
    
    def updateContacts(Long id, Long version) {
        println("update contacts = " + id);
        def UserEmergencyContactsInstance = UserEmergencyContacts.get(id)
        
        if (!UserEmergencyContactsInstance) {
            flash.message = message(code: 'There was an error loading your emergency contacts', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), id])
            redirect(action: "myProfile")
            return
        }

        if (version != null) {
            if (UserEmergencyContactsInstance.version > version) {
                UserEmergencyContactsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts')] as Object[],
                          "Another user has updated this UserEmergencyContacts while you were editing")
                render(view: "edit", model: [UserEmergencyContactsInstance: UserEmergencyContactsInstance])
                return
            }
        }

        UserEmergencyContactsInstance.properties = params

        if (!UserEmergencyContactsInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error updating your Contacts Info. Make sure all the fields are correct and try again.', args: [message(code: 'UserContactInfo.label', default: 'UserContactInfo'), id])
            redirect(action: "edit", page123: 'test', id: params.id, page: "employment")
            return
        }
        
        flash.message = message(code: 'Emergency contacts updated successfully', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), UserEmergencyContactsInstance.id])
        redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
    }
    
    
    
    def updatePhysician(Long id, Long version) {
        println("update physician");
        def UserPhysicianInfoInstance = UserPhysicianInfo.get(id)
        println(id)
        if (!UserPhysicianInfoInstance) {
            flash.message = message(code: 'There was an error saving your physician information', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), id])
            redirect(action: "myProfile")
            return
        }

        if (version != null) {
            if (UserPhysicianInfoInstance.version > version) {
                UserPhysicianInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo')] as Object[],
                          "Another user has updated this UserPhysicianInfo while you were editing")
                render(view: "edit", model: [UserPhysicianInfoInstance: UserPhysicianInfoInstance])
                return
            }
        }

        UserPhysicianInfoInstance.properties = params

        if (!UserPhysicianInfoInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error updating your Employment Info. Make sure all the fields are correct and try again.', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "edit", page123: 'test', id: params.id, page: "employment")
            return
        }
        
        flash.message = message(code: UserPhysicianInfoInstance.name + '&#39;s information updated successfully', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), UserPhysicianInfoInstance.id])
        redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
    }
    
    def create() {
        println("create physician");
        [UserPhysicianInfoInstance: new UserPhysicianInfo(params)]
    }
    
    def savePhysician() {
        println("save physician");
        
        def UserPhysicianInfoInstance = new UserPhysicianInfo(params)
        
        if (!UserPhysicianInfoInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo')])
            redirect(action: "create", params: params)
            return
        }
        
        flash.message = message(code: 'Physician info saved successfully', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), UserPhysicianInfoInstance.id])
        redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
    }
    
    
    
    
    
    
    def deleteEmployment(Long id) {
        println("delete employment")
        def UserEmploymentInfoInstance = UserEmploymentInfo.get(id)
        
        if (!UserEmploymentInfoInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "myProfile")
            return
        }

        try {
            UserEmploymentInfoInstance.delete(flush: true)
            flash.message = message(code: 'Employment info deleted successfully', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), UserEmploymentInfoInstance.id])
            redirect(action: "myProfile")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "myProfile", id: UserEmploymentInfoInstance.id)
        }
        
    }
    
    
    def deleteContacts(Long id) {
        println("delete contacts")
        def UserEmergencyContactsInstance = UserEmergencyContacts.get(id)
        
        if (!UserEmergencyContactsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), id])
            redirect(action: "myProfile")
            return
        }

        try {
            UserEmergencyContactsInstance.delete(flush: true)
            flash.message = message(code: 'Contact information deleted successfully', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), UserEmergencyContactsInstance.id])
            redirect(action: "myProfile")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), id])
            redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
        }
        
    }
    
    
    def deletePhysician(Long id) {
        println("delete physician")
        def UserPhysicianInfoInstance = UserPhysicianInfo.get(id)
        
        if (!UserPhysicianInfoInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), id])
            redirect(action: "myProfile")
            return
        }

        try {
            UserPhysicianInfoInstance.delete(flush: true)
            flash.message = message(code: 'Physician info deleted successfully', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), UserPhysicianInfoInstance.id])
            redirect(action: "myProfile")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserPhysicianInfo.label', default: 'UserPhysicianInfo'), id])
            redirect(action: "myProfile", id: UserPhysicianInfoInstance.id)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    def saveImage() {
        println("saveImage")
        
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
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'File.label', default: 'File')])
            redirect(action: "myProfile")
            return
        }
        
        flash.message = "Profile image updated"
        redirect(action: "myProfile")
    }
    
    def showPayload() {
        println("showPayload")
        
        def fileInstance = UserFile.findByUserId(session.user.id)
        
        if (fileInstance == null) {
            println("fileInstance  =  " + fileInstance)
            fileInstance = UserFile.findByFileName("placeholder-img.png")
        }
        
        response.outputStream << fileInstance.filePayload // write the image to the outputstream
        response.outputStream.flush()
    }
    
    def delete() {
        println("delete  =  " + session.user.id)
        
        def fileInstance = UserFile.findByUserId(session.user.id)
        fileInstance.delete(flush: true) //flush:true ->flushes the persistence context, persisting the object immediately
        redirect(action: "myProfile")
    }
    
}




