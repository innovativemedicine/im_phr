package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class Medications2Controller {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "medications", params: params)
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
     * Main landing page for Medications tab for the current medications list.
     */
    def medications = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCurrentMedicationsInstanceList = db.rows(
            "SELECT um.medication_id, um.name, um.dose, um.frequency, um.form, um.strength, um.comments, " + 
            " DATE_FORMAT(um.start_date, '%d/%m/%Y') AS 'start_date', DATE_FORMAT(um.stop_date, '%d/%m/%Y') AS 'stop_date', DATE_FORMAT(um.refill_date, '%d/%m/%Y') AS 'refill_date' " + 
            " FROM user_medications2 um " + 
            " WHERE um.user_id = ? AND (um.stop_date >= CURDATE() OR um.stop_date IS null) ORDER BY um.start_date DESC ", session.user.id)
        
        [UserCurrentMedicationsInstanceList: UserCurrentMedicationsInstanceList]
    }
    
    /**
     * Main landing page for Medications tab for the previous medications list.
     */
    def medicationsPrevious = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserPreviousMedicationsInstanceList = db.rows(
            "SELECT um.medication_id, um.name, um.dose, um.frequency, um.form, um.strength, um.comments, " +
            " DATE_FORMAT(um.start_date, '%d/%m/%Y') AS 'start_date', DATE_FORMAT(um.stop_date, '%d/%m/%Y') AS 'stop_date', DATE_FORMAT(um.refill_date, '%d/%m/%Y') AS 'refill_date' " +
            " FROM user_medications2 um " +
            " WHERE um.user_id = ? AND um.stop_date < CURDATE() ORDER BY um.start_date DESC ", session.user.id)
        
        [UserPreviousMedicationsInstanceList: UserPreviousMedicationsInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new medication entry.
     */
    def create() {
        [UserMedicationsInstance: new UserMedications2(params)]
    }
    
    /**
     * Saves a new data entry for medications into the database.
     * @return the function fails if it is unable to save the data
     */
    def save() {
        def UserMedicationsInstance = new UserMedications2(params)
        
        if (!UserMedicationsInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserMedications.label', default: 'UserMedications')])
            redirect(action: "create", params: params)
            return
        }
        
        flash.message = message(code: 'Medication \"' + UserMedicationsInstance.name + '\" added successfully', args: [message(code: 'UserMedications.label', default: 'UserMedications'), UserMedicationsInstance.id])
        redirect(controller: "healthInformation", action: "information", params: params)
    }
    
    /**
     * Loads an existing medication entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific medication entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        def UserMedicationsInstance = UserMedications2.get(id)
        
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(controller: "healthInformation", action: "information", params: params)
            return
        }
        
        [userMedicationsInstance: UserMedicationsInstance]
    }
    
    /**
     * Saves the updated medication entry into the database.
     * @param id      - the id number of the specific medication entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        def UserMedicationsInstance = UserMedications2.get(id)
        
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(controller: "healthInformation", action: "information", params: params)
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
        redirect(controller: "healthInformation", action: "information", id: UserMedicationsInstance.id)
    }
    
    /**
     * Deletes the medication entry from the database
     * @param id - the id number of the specific medication entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        def UserMedicationsInstance = UserMedications2.get(id)
        if (!UserMedicationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }

        try {
            UserMedicationsInstance.delete(flush: true)
            flash.message = message(code: 'Medicine \"' + UserMedicationsInstance.name + '\" deleted successfully', args: [message(code: 'UserMedications.label', default: 'UserMedications'), UserMedicationsInstance.id])
            redirect(controller: "healthInformation", action: "information")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserMedications.label', default: 'UserMedications'), id])
            redirect(controller: "healthInformation", action: "information", id: id)
        }
    }
    
}
