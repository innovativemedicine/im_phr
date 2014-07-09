package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class Medications2Controller {
    
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
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCurrentMedicationsInstanceList = db.rows(
            "SELECT um.medication_id, um.name, um.dose, um.frequency, um.form, um.strength, um.comments, " + 
            " DATE_FORMAT(um.start_date, '%d/%m/%Y') AS 'start_date', DATE_FORMAT(um.stop_date, '%d/%m/%Y') AS 'stop_date', DATE_FORMAT(um.refill_date, '%d/%m/%Y') AS 'refill_date' " + 
            " FROM user_medications2 um " + 
            " WHERE um.user_id = ? AND um.stop_date >= CURDATE() ORDER BY um.start_date DESC ", session.user.id)
        def UserPreviousMedicationsInstanceList = db.rows(
            "SELECT um.medication_id, um.name, um.dose, um.frequency, um.form, um.strength, um.comments, " +
            " DATE_FORMAT(um.start_date, '%d/%m/%Y') AS 'start_date', DATE_FORMAT(um.stop_date, '%d/%m/%Y') AS 'stop_date', DATE_FORMAT(um.refill_date, '%d/%m/%Y') AS 'refill_date' " +
            " FROM user_medications2 um " +
            " WHERE um.user_id = ? AND um.stop_date < CURDATE() ORDER BY um.start_date DESC ", session.user.id)
        
        [UserCurrentMedicationsInstanceList: UserCurrentMedicationsInstanceList, UserPreviousMedicationsInstanceList: UserPreviousMedicationsInstanceList]
    }
    
    
    def create() {
        println("create");
        [UserMedicationsInstance: new UserMedications2(params)]
    }
    
    def save() {
        println("save");
        
        def UserMedicationsInstance = new UserMedications2(params)
        
        if (!UserMedicationsInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserMedications.label', default: 'UserMedications')])
            redirect(action: "create", params: params)
            return
        }
        redirect(action: "medications", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserMedicationsInstance = UserMedications2.get(id)
        
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "medications")
            return
        }
        
        [userMedicationsInstance: UserMedicationsInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
        def UserMedicationsInstance = UserMedications2.get(id)
        
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
            flash.message = message(code: 'Error updating the entry. Please ensure the values are correct.', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(action: "edit", id: params.id)
            return
        }
        
        flash.message = message(code: 'Medication \"' + UserMedicationsInstance.name + '\" updated successfully', args: [message(code: 'UserMedications.label', default: 'UserMedications'), UserMedicationsInstance.id])
        redirect(action: "medications", id: UserMedicationsInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def UserMedicationsInstance = UserMedications2.get(id)
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




