package im
// Unused controller now, as Illnesses are now combined with Conditions.

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class IllnessesController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "illnesses", params: params)
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
     * Main landing page for Illnesses tab.
     */
    def illnesses = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCurrentIllnessesInstanceList = db.rows(
            "SELECT ui.illness_id, ui.name, ui.symptoms, ui.treatment, ui.comments, " +
            " DATE_FORMAT(ui.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(ui.end_date, '%d/%m/%Y') AS 'end_date' " + 
            " FROM user_illnesses ui " +
            " WHERE ui.user_id = ? AND ui.end_date >= CURDATE() ORDER BY ui.onset_date DESC", session.user.id)
        def UserPreviousIllnessesInstanceList = db.rows(
            "SELECT ui.illness_id, ui.name, ui.symptoms, ui.treatment, ui.comments, " +
            " DATE_FORMAT(ui.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(ui.end_date, '%d/%m/%Y') AS 'end_date' " +
            " FROM user_illnesses ui " +
            " WHERE ui.user_id = ? AND ui.end_date < CURDATE() ORDER BY ui.onset_date DESC", session.user.id)
        
        [UserCurrentIllnessesInstanceList: UserCurrentIllnessesInstanceList, UserPreviousIllnessesInstanceList: UserPreviousIllnessesInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new illness entry.
     */
    def create() {
        [UserIllnessesInstance: new UserIllnesses(params)]
    }
    
    /**
     * Saves a new data entry for illnesses into the database.
     * @return
     */
    def save() {
        def UserIllnessesInstance = new UserIllnesses(params)
        
        if (!UserIllnessesInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses')])
            redirect(action: "create", params: params)
            return
        }
        redirect(action: "illnesses", params: params)
    }
    
    /**
     * Loads an existing illness entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific illness entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        def UserIllnessesInstance = UserIllnesses.get(id)
        
        if (!UserIllnessesInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "illnesses")
            return
        }
        
        [userIllnessesInstance: UserIllnessesInstance]
    }
    
    /**
     * Saves the updated illness entry into the database.
     * @param id      - the id number of the specific illness entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        def UserIllnessesInstance = UserIllnesses.get(id)
        
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
            flash.message = message(code: 'Error updating the entry. Please ensure the values are correct.', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), id])
            redirect(action: "edit", id: params.id)
            return
        }
        
        flash.message = message(code: 'Illness \"' + UserIllnessesInstance.name + '\" updated successfully', args: [message(code: 'UserIllnesses.label', default: 'UserIllnesses'), UserIllnessesInstance.id])
        redirect(action: "illnesses", id: UserIllnessesInstance.id)
    }
    
    /**
     * Deletes the illness entry from the database
     * @param id - the id number of the specific illness entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        def UserIllnessesInstance = UserIllnesses.get(id)
        if (!UserIllnessesInstance) {
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
