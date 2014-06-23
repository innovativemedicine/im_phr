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
            "SELECT up.* " +
            " FROM user_profile up, login l " +
            " WHERE up.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        def UserContactsInstanceList = db.rows(
            "SELECT uec.* " +
            " FROM user_emergency_contacts uec, login l " +
            " WHERE uec.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        def UserEmploymentInstanceList = db.rows(
            "SELECT uei.* " +
            " FROM user_employment_info uei, login l " +
            " WHERE uei.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        
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
            println("didn't save Profile :  " + UserProfileInstance.errors);
            render(view: "create", model: [UserProfileInstance: UserProfileInstance])
            return
        }
        redirect(action: "myProfile", params: params)
    }
    
    def edit(Long id) {
        println("--- edit : " + id);
        
        def LoginInstance = Login.get(id)
        def UserProfileInstance = UserProfile.get(id)
        def UserContactsInstance = UserEmergencyContacts.get(id)
        def UserEmploymentInstance = UserEmploymentInfo.get(id)
        
        println("userProfile = " + UserProfileInstance + "   |   " + UserProfile)
        if (!UserProfileInstance) {
            println("failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
            redirect(action: "myProfile")
            return
        }
        
        [loginInstance: LoginInstance, userProfileInstance: UserProfileInstance, userContactsInstance: UserContactsInstance, userEmploymentInstance: UserEmploymentInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
        
        def LoginInstance = Login.get(id)
        def UserProfileInstance = UserProfile.get(id)
        
        println(LoginInstance)
        println(UserProfileInstance)
        
        if (!LoginInstance) {
            println("couldn't update LOGIN")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Login.label', default: 'Login'), id])
            redirect(action: "myProfile")
            return
        }
        
        if (!UserProfileInstance) {
            println("couldn't update PROFILE")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), id])
            redirect(action: "myProfile")
            return
        }
        
        
        if (version != null) {
            println("version not null")
            if (UserProfileInstance.version > version) {
                println("PROFILE version is too large")
//                UserProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'UserProfile.label', default: 'UserProfile')] as Object[],
//                          "Another user has updated this UserProfile while you were editing")
//                render(view: "edit", model: [UserProfileInstance: UserProfileInstance])
//                return
            }
            if (LoginInstance.version > version) {
                println("LOGIN version is too large")
//                LoginInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'Login.label', default: 'Login')] as Object[],
//                          "Another user has updated this Login while you were editing")
//                render(view: "edit", model: [LoginInstance: LoginInstance])
//                return
            }
        }

        LoginInstance.properties = params
        UserProfileInstance.properties = params
        
        println("||  " + params)
        println("||  " + LoginInstance)
        println("||  " + UserProfileInstance)
        
        if (!LoginInstance.save(flush: true)) {
            println("LoginInstance save flush failed")
            render(view: "edit", model: [UserProfileInstance: LoginInstance])
            return
        }
        
        println("update correct")
        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), UserProfileInstance.id])
        redirect(action: "myProfile", id: LoginInstance.id)
    }
    
}




