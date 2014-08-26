package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class DiaryController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "diary", params: params)
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
     * Main landing page for Diary tab.
     */
    def diary = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserDiaryInstanceList = db.rows(
            "SELECT ud.diary_id, ud.topic, ud.entry, DATE_FORMAT(ud.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_diary ud " +
            " WHERE ud.user_id = ? " + 
            " ORDER BY date DESC LIMIT 10", session.user.id)
        
        [UserDiaryInstanceList: UserDiaryInstanceList]
    }
    
    /**
     * Opens the 'create' view to allow users to add a new diary entry.
     */
    def create() {
        [UserDiaryInstance: new UserDiary(params)]
    }
    
    /**
     * Saves a new diary entry into the database.
     * @return the function fails if it is unable to save the data
     */
    def save() {
        def UserDiaryInstance = new UserDiary(params)
        
        if (!UserDiaryInstance.save(flush: true)) {
            flash.message = message(code: 'There was an error saving the diary entry.', args: [message(code: 'UserDiary.label', default: 'UserDiary')])
            render(view: "create", model: [UserDiaryInstance: UserDiaryInstance])
            return
        }
        
        flash.message = message(code: 'Diary entry added successfully', args: [message(code: 'UserDiary.label', default: 'UserDiary'), UserDiaryInstance.id])
        redirect(action: "diary", params: params)
    }
    
    /**
     * Loads an existing diary entry into the page to allow the user to edit the different fields.
     * @param id - the id number of the specific diary entry
     * @return the function fails if it is unable to load the data
     */
    def edit(Long id) {
        def UserDiaryInstance = UserDiary.get(id)
        
        if (!UserDiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary")
            return
        }
        
        [userDiaryInstance: UserDiaryInstance]
    }
    
    /**
     * Saves the updated diary entry into the database.
     * @param id      - the id number of the specific diary entry
     * @param version - the number of times the specific entry has been edited
     * @return the function fails if it is unable to load the data, if the database entry's version is greater than the version loaded in the page, or if the save to the database doesn't work
     */
    def update(Long id, Long version) {
        def UserDiaryInstance = UserDiary.get(id)
        if (!UserDiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary")
            return
        }

        if (version != null) {
            if (UserDiaryInstance.version > version) {
                UserDiaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserDiary.label', default: 'UserDiary')] as Object[],
                          "Another user has updated this UserDiary while you were editing")
                render(view: "edit", model: [UserDiaryInstance: UserDiaryInstance])
                return
            }
        }

        UserDiaryInstance.properties = params

        if (!UserDiaryInstance.save(flush: true)) {
            render(view: "edit", model: [UserDiaryInstance: UserDiaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), UserDiaryInstance.id])
        redirect(action: "diary", id: UserDiaryInstance.id)
    }
    
    /**
     * Deletes the diary entry from the database
     * @param id - the id number of the specific diary entry
     * @return the function fails if it is unable to load the data
     */
    def delete(Long id) {
        def UserDiaryInstance = UserDiary.get(id)
        if (!UserDiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary")
            return
        }

        try {
            UserDiaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary", id: id)
        }
    }
    
}
