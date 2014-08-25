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
     * Main landing page for Immunizations tab.
     */
    def immunizations = {
        println("immunizations");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserImmunizationsInstanceList = db.rows(
            "SELECT ui.immunization_id, ui.name, ui.comments, DATE_FORMAT(ui.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_immunizations ui " + 
            " WHERE ui.user_id = ? ORDER BY ui.date DESC", session.user.id)
        
        [UserImmunizationsInstanceList: UserImmunizationsInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new immunization entry.
     */
    def create() {
        println("create");
        [UserImmunizationsInstance: new UserImmunizations(params)]
    }
    
    /**
     * Saves a new data entry for immunization into the database.
     * @return the function fails if it is unable to save the data
     */
    def save() {
        println("save");
        
        def UserImmunizationsInstance = new UserImmunizations(params)
        
        if (!UserImmunizationsInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations')])
            redirect(action: "create", params: params)
            return
        }
        
        flash.message = message(code: 'Immunization \"' + UserImmunizationsInstance.name + '\" added successfully', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
        redirect(controller: "healthInformation", action: "information", params: params)
    }
    
    /**
     * Loads an existing immunization entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific immunization entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        println("edit : " + id);
        
        def UserImmunizationsInstance = UserImmunizations.get(id)
        
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }
        
        [userImmunizationsInstance: UserImmunizationsInstance]
    }
    
    /**
     * Saves the updated immunization entry into the database.
     * @param id      - the id number of the specific immunization entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        println("update");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(controller: "healthInformation", action: "information")
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
            flash.message = message(code: 'Error updating the entry. Please ensure the values are correct.', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "edit", id: params.id)
            return
        }

        flash.message = message(code: 'Immunization \"' + UserImmunizationsInstance.name + '\" updated successfully', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
        redirect(controller: "healthInformation", action: "information", id: UserImmunizationsInstance.id)
    }
    
    /**
     * Deletes the immunization entry from the database
     * @param id - the id number of the specific immunization entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        println("delete")
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(controller: "healthInformation", action: "information")
            return
        }

        try {
            UserImmunizationsInstance.delete(flush: true)
            flash.message = message(code: 'Immunization \"' + UserImmunizationsInstance.name + '\" deleted successfully', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
            redirect(controller: "healthInformation", action: "information")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(controller: "healthInformation", action: "information", id: id)
        }
    }
    
}
