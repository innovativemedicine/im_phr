package im

import org.springframework.dao.DataIntegrityViolationException

import groovy.sql.Sql

class MyProfileController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
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
        
        [UserProfileInstanceList: UserProfileInstanceList, UserContactsInstanceList: UserContactsInstanceList, 
         UserEmploymentInstanceList: UserEmploymentInstanceList]
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
                flash.message = message(code: 'There was an error loading your Employment information', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "employment")
                return
            }
            [page: page, userEmploymentInstance: UserEmploymentInstance]
            
        } else if (page == "contacts") {
            println("CONTACTS PAGE")
            def UserContactsInstance = UserEmergencyContacts.get(id)
            println(UserContactsInstance)
            if (!UserContactsInstance) {
                flash.message = message(code: 'There was an error loading your Emergency Contacts information', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
                redirect(action: "edit", id: params.id, page: "contacts")
                return
            }
            [page: page, userContactsInstance: UserContactsInstance]
            
        }
        
    }
    
    def updateProfile(Long id, Long version) {
        println("update profile");
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
        println("update employment");
        def UserEmploymentInfoInstance = UserEmploymentInfo.get(session.user.id)
        
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
        println("update contacts");
        def UserEmergencyContactsInstance = UserEmergencyContacts.get(session.user.id)
        
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
            flash.message = message(code: 'There was an error updating your Employment Info. Make sure all the fields are correct and try again.', args: [message(code: 'UserEmploymentInfo.label', default: 'UserEmploymentInfo'), id])
            redirect(action: "edit", page123: 'test', id: params.id, page: "employment")
            return
        }
        
        flash.message = message(code: 'Emergency contacts updated successfully', args: [message(code: 'UserEmergencyContacts.label', default: 'UserEmergencyContacts'), UserEmergencyContactsInstance.id])
        redirect(action: "myProfile", id: UserEmergencyContactsInstance.id)
    }
    
    
}




