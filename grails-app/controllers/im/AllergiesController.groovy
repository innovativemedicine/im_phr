package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class AllergiesController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "allergies", params: params)
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
     * Main landing page for Allergies tab.
     */
    def allergies = {
        println("allergies");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserAllergiesInstanceList = db.rows(
            "SELECT ua.allergy_id, ua.name, ua.reaction, ua.severity, DATE_FORMAT(ua.onset_date, '%d/%m/%Y') AS 'onset_date' " + 
            " FROM user_allergies ua " +
            " WHERE ua.user_id = ? ORDER BY ua.severity_value DESC, ua.onset_date DESC", session.user.id)
        
        [UserAllergiesInstanceList: UserAllergiesInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new allergy entry.
     */
    def create() {
        println("create");
        [UserAllergiesInstance: new UserAllergies(params)]
    }
    
    /**
     * Saves a new data entry for allergies into the database.
     * @return the function fails if it is unable to save the data
     */
    def save() {
        println("save");
        
        def UserAllergiesInstance = new UserAllergies(params)
        
        if (!UserAllergiesInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserAllergies.label', default: 'UserAllergies')])
            redirect(action: "create", params: params)
            return
        }
        
        flash.message = message(code: 'Allergy \"' + UserAllergiesInstance.name + '\" added successfully', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), UserAllergiesInstance.id])
        redirect(controller: "healthInformation", action: "information", params: params)
    }
    
    /**
     * Loads an existing allergy entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific allergy entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        println("edit : " + id);
        
        def UserAllergiesInstance = UserAllergies.get(id)
        
        if (!UserAllergiesInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }
        
        [userAllergiesInstance: UserAllergiesInstance]
    }
    
    /**
     * Saves the updated allergy entry into the database.
     * @param id      - the id number of the specific allergy entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        println("update");
        def UserAllergiesInstance = UserAllergies.get(id)
        
        if (!UserAllergiesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }

        if (version != null) {
            if (UserAllergiesInstance.version > version) {
                UserAllergiesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserAllergies.label', default: 'UserAllergies')] as Object[],
                          "Another user has updated this UserAllergies while you were editing")
                render(view: "edit", model: [UserAllergiesInstance: UserAllergiesInstance])
                return
            }
        }

        UserAllergiesInstance.properties = params
        
        if (!UserAllergiesInstance.save(flush: true)) {
            flash.message = message(code: 'Error updating the entry. Please ensure the values are correct.', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), id])
            redirect(action: "edit", id: params.id)
            return
        }

        flash.message = message(code: 'Allergy \"' + UserAllergiesInstance.name + '\" updated successfully', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), UserAllergiesInstance.id])
        redirect(controller: "healthInformation", action: "information", id: UserAllergiesInstance.id)
    }
    
    /**
     * Deletes the allergy entry from the database
     * @param id - the id number of the specific allergy entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        println("delete")
        def UserAllergiesInstance = UserAllergies.get(id)
        if (!UserAllergiesInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }

        try {
            UserAllergiesInstance.delete(flush: true)
            flash.message = message(code: 'Allergy \"' + UserAllergiesInstance.name + '\" deleted successfully', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), UserAllergiesInstance.id])
            redirect(controller: "healthInformation", action: "information")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserAllergies.label', default: 'UserAllergies'), id])
            redirect(controller: "healthInformation", action: "information", id: id)
        }
    }
    
}
