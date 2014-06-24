package im

import java.util.Date;

import org.springframework.dao.DataIntegrityViolationException

import groovy.sql.Sql

class IllnessesController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "illnesses", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Illnesses tab.
     */
    def illnesses = {
        println("illnesses");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserIllnessesInstanceList = db.rows(
            "SELECT ui.illness_id, ui.name, ui.symptoms, ui.treatment, ui.onset_date, ui.end_date, ui.comments " +
            " FROM user_illnesses ui, login l " +
            " WHERE ui.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        
        [UserIllnessesInstanceList: UserIllnessesInstanceList]
    }
    
    
    def create() {
        println("create");
        [UserIllnessesInstance: new UserIllnesses(params)]
    }
    
    def save() {
        println("save");
        
        def UserIllnessesInstance = new UserIllnesses(params)
        
        if (!UserIllnessesInstance.save(flush: true)) {
            println("didn't save :  " + UserIllnessesInstance.errors);
            render(view: "create", model: [UserIllnessesInstance: UserIllnessesInstance])
            return
        }
        redirect(action: "illnesses", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserIllnessesInstance = UserIllnesses.get(id)
        
        println("userIllnesses = " + UserIllnessesInstance + "   |   " + UserIllnesses)
        if (!UserIllnessesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses")
            return
        }
        
        [userIllnessesInstance: UserIllnessesInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
        def UserIllnessesInstance = UserIllnesses.get(id)
        
        println(id)
        println(UserIllnessesInstance)
        
        if (!UserIllnessesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses")
            return
        }

        if (version != null) {
            if (UserIllnessesInstance.version > version) {
                UserIllnessesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserIllnesses.label', default: 'UserIllnesses')] as Object[],
                          "Another user has updated this UserIllnesses while you were editing")
                render(view: "edit", model: [UserIllnessesInstance: UserIllnessesInstance])
                return
            }
        }

        UserIllnessesInstance.properties = params

        if (!UserIllnessesInstance.save(flush: true)) {
            render(view: "edit", model: [UserIllnessesInstance: UserIllnessesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), UserIllnessesInstance.id])
        redirect(action: "illnesses", id: UserIllnessesInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def UserIllnessesInstance = UserIllnesses.get(id)
        if (!UserIllnessesInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses")
            return
        }

        try {
            UserIllnessesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses", id: id)
        }
        
    }
    
}
