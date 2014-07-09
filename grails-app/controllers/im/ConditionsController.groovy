package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class ConditionsController {
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "conditions", params: params)
    }
    
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
        println("conditions");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCurrentConditionsInstanceList = db.rows(
            "SELECT uc.condition_id, uc.name, uc.comments, " + 
            " DATE_FORMAT(uc.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(uc.end_date, '%d/%m/%Y') AS 'end_date' " + 
            " FROM user_conditions uc " +
            " WHERE uc.user_id = ? AND uc.end_date >= CURDATE() ORDER BY onset_date DESC", session.user.id)
        
        def UserPreviousConditionsInstanceList = db.rows(
            "SELECT uc.condition_id, uc.name, uc.comments, " +
            " DATE_FORMAT(uc.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(uc.end_date, '%d/%m/%Y') AS 'end_date' " +
            " FROM user_conditions uc " +
            " WHERE uc.user_id = ? AND uc.end_date < CURDATE() ORDER BY onset_date DESC", session.user.id)
        
        [UserCurrentConditionsInstanceList: UserCurrentConditionsInstanceList, UserPreviousConditionsInstanceList: UserPreviousConditionsInstanceList]
    }
    
    def create() {
        println("create");
        [UserConditionsInstance: new UserConditions(params)]
    }
    
    def save() {
        println("save");
        
        def UserConditionsInstance = new UserConditions(params)
        
        if (!UserConditionsInstance.save(flush: true)) {
            flash.message = message(code: 'Error saving the entry. Please ensure the values are correct.', args: [message(code: 'UserConditions.label', default: 'UserConditions')])
            redirect(action: "create", params: params)
            return
        }
        redirect(action: "conditions", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserConditionsInstance = UserConditions.get(id)
        
        if (!UserConditionsInstance) {
            flash.message = message(code: 'Could not find the specific entry. Please try again.', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "immunizations")
            return
        }
        
        [userConditionsInstance: UserConditionsInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
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

    def delete(Long id) {
        println("delete")
        def UserConditionsInstance = UserConditions.get(id)
        if (!UserConditionsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions")
            return
        }

        try {
            UserConditionsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserConditions.label', default: 'UserConditions'), id])
            redirect(action: "conditions", id: id)
        }
        
    }
    
}
