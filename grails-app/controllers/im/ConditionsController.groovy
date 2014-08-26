package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class ConditionsController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "conditions", params: params)
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
     * Main landing page for Conditions tab.
     */
    def conditions = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCurrentConditionsInstanceList = db.rows(
            "SELECT uc.condition_id, uc.name, uc.comments, uc.symptoms, " + 
            " DATE_FORMAT(uc.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(uc.end_date, '%d/%m/%Y') AS 'end_date' " + 
            " FROM user_conditions uc " +
            " WHERE uc.user_id = ? AND (uc.end_date >= CURDATE() OR uc.end_date IS null) ORDER BY onset_date DESC", session.user.id)
        
        def UserPreviousConditionsInstanceList = db.rows(
            "SELECT uc.condition_id, uc.name, uc.comments, uc.symptoms, " +
            " DATE_FORMAT(uc.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(uc.end_date, '%d/%m/%Y') AS 'end_date' " +
            " FROM user_conditions uc " +
            " WHERE uc.user_id = ? AND uc.end_date < CURDATE() ORDER BY onset_date DESC", session.user.id)
        
        [UserCurrentConditionsInstanceList: UserCurrentConditionsInstanceList, UserPreviousConditionsInstanceList: UserPreviousConditionsInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new conditions entry.
     */
    def create() {
        [UserConditionsInstance: new UserConditions(params)]
    }
    
    /**
     * Saves a new data entry for conditions into the database.
     * @return the function fails if it is unable to save the data
     */
    def save() {
        def UserConditionsInstance = new UserConditions(params)
        
        if (!UserConditionsInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserConditions.label', default: 'UserConditions')])
            redirect(action: "create", params: params)
            return
        }
        
        flash.message = message(code: 'Condition \"' + UserConditionsInstance.name + '\" added successfully', args: [message(code: 'UserConditions.label', default: 'UserConditions'), UserConditionsInstance.id])
        redirect(action: "conditions", params: params)
    }
    
    /**
     * Loads an existing condition entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific condition entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        def UserConditionsInstance = UserConditions.get(id)
        
        if (!UserConditionsInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions")
            return
        }
        
        [userConditionsInstance: UserConditionsInstance]
    }
    
    /**
     * Saves the updated condition entry into the database.
     * @param id      - the id number of the specific condition entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        def UserConditionsInstance = UserConditions.get(id)
        if (!UserConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions")
            return
        }

        if (version != null) {
            if (UserConditionsInstance.version > version) {
                UserConditionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserConditions.label', default: 'UserConditions')] as Object[],
                          "Another user has updated this UserConditions while you were editing")
                render(view: "edit", model: [UserConditionsInstance: UserConditionsInstance])
                return
            }
        }

        UserConditionsInstance.properties = params

        if (!UserConditionsInstance.save(flush: true)) {
            flash.message = message(code: 'Error updating the entry. Please ensure the values are correct.', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "edit", id: params.id)
            return
        }

        flash.message = message(code: 'Condition \"' + UserConditionsInstance.name + '\" updated successfully', args: [message(code: 'UserConditions.label', default: 'UserConditions'), UserConditionsInstance.id])
        redirect(action: "conditions", id: UserConditionsInstance.id)
    }
    
    /**
     * Deletes the condition entry from the database
     * @param id - the id number of the specific condition entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        def UserConditionsInstance = UserConditions.get(id)
        if (!UserConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions")
            return
        }

        try {
            UserConditionsInstance.delete(flush: true)
            flash.message = message(code: 'Condition \"' + UserConditionsInstance.name + '\" deleted successfully', args: [message(code: 'UserConditions.label', default: 'UserConditions'), UserConditionsInstance.id])
            redirect(action: "conditions")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions", id: id)
        }
    }
    
}
