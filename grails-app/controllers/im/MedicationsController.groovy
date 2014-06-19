package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class MedicationsController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "medications", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /** 
     * Main landing page for Medications tab.
     */
    def medications = {
        println("medications");
        
        /* OLD SQL CODE
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def result = db.rows("SELECT um.name, um.dose, um.frequency, um.form, um.strength, um.start_date, " + 
                             "um.stop_date, um.refill_date, um.comments FROM user_medications um, login l " + 
                             "WHERE um.user_id = l.user_id AND l.user_name = ? ", session.user.userName) // Perform the query
        
        [result: result] // return the results as model
        */
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserMedicationsInstanceList = db.rows(
            "SELECT um.medication_id, um.name, um.dose, um.frequency, um.form, um.strength, um.start_date, " + 
            " um.stop_date, um.refill_date, um.comments " + 
            " FROM user_medications um, login l " + 
            " WHERE um.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        
        [UserMedicationsInstanceList: UserMedicationsInstanceList]
    }
    
    
    def create() {
        println("create");
        [UserMedicationsInstance: new UserMedications(params)]
    }
    
    def save() {
        println("save");
        
        def UserMedicationsInstance = new UserMedications(params)
        
        if (!UserMedicationsInstance.save(flush: true)) {
            println("didn't save :  " + UserMedicationsInstance.errors);
            render(view: "create", model: [UserMedicationsInstance: UserMedicationsInstance])
            return
        }
        redirect(action: "medications", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserMedicationsInstance = UserMedications.get(id)
        
        println("userMedications = " + UserMedicationsInstance + "   |   " + UserMedications)
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications")
            return
        }
        
        [userMedicationsInstance: UserMedicationsInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
        def UserMedicationsInstance = UserMedications.get(id)
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications")
            return
        }

        if (version != null) {
            if (UserMedicationsInstance.version > version) {
                UserMedicationsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserMedications.label', default: 'UserMedications')] as Object[],
                          "Another user has updated this UserMedications while you were editing")
                render(view: "edit", model: [UserMedicationsInstance: UserMedicationsInstance])
                return
            }
        }

        UserMedicationsInstance.properties = params

        if (!UserMedicationsInstance.save(flush: true)) {
            render(view: "edit", model: [UserMedicationsInstance: UserMedicationsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), UserMedicationsInstance.id])
        redirect(action: "medications", id: UserMedicationsInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def UserMedicationsInstance = UserMedications.get(id)
        if (!UserMedicationsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications")
            return
        }

        try {
            UserMedicationsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications", id: id)
        }
        
    }
    
}




