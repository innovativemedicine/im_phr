package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class ImmunizationsController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "immunizations", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Immunizations tab.
     */
    def immunizations = {
        println("immunizations");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserImmunizationsInstanceList = db.rows(
            "SELECT ui.immunization_id, ui.name, ui.comments, ui.date, ui.dose, ui.manufacturer, ui.next_date, ui.type " +
            " FROM user_immunizations ui, login l " +
            " WHERE ui.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        
        [UserImmunizationsInstanceList: UserImmunizationsInstanceList]
    }
    
    def create() {
        println("create");
        [UserImmunizationsInstance: new UserImmunizations(params)]
    }
    
    def save() {
        println("save");
//        String name = params.name
//        String type = params.type
//        String manufacturer = params.manufacturer
//        String comments = params.comments
//        String date = params.date
//        String nextDate = params.nextDate
//        String user = params.user
//        println(name + "  " + type + " | " + manufacturer + " | " + comments + " | " + date + " | " + nextDate + " | " + user);
        
        def UserImmunizationsInstance = new UserImmunizations(params)
        if (!UserImmunizationsInstance.save(flush: true)) {
            println("didn't save :  " + UserImmunizationsInstance.errors);
            render(view: "create", model: [UserImmunizationsInstance: UserImmunizationsInstance])
            return
        }
//        flash.message = message(code: 'default.created.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
//        redirect(action: "show", id: UserImmunizationsInstance.id)
        redirect(action: "immunizations", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserImmunizationsInstance = UserImmunizations.get(id)
        
        println("userImmunizations = " + UserImmunizationsInstance + "   |   " + UserImmunizations)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "immunizations")
            return
        }
        
        [userImmunizationsInstance: UserImmunizationsInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "immunizations")
            return
        }

        if (version != null) {
            if (UserImmunizationsInstance.version > version) {
                UserImmunizationsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserImmunizations.label', default: 'UserImmunizations')] as Object[],
                          "Another user has updated this UserImmunizations while you were editing")
                render(view: "edit", model: [UserImmunizationsInstance: UserImmunizationsInstance])
                return
            }
        }

        UserImmunizationsInstance.properties = params

        if (!UserImmunizationsInstance.save(flush: true)) {
            render(view: "edit", model: [UserImmunizationsInstance: UserImmunizationsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
        redirect(action: "immunizations", id: UserImmunizationsInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "immunizations")
            return
        }

        try {
            UserImmunizationsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "immunizations")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "immunizations", id: id)
        }
        
    }
    
}
