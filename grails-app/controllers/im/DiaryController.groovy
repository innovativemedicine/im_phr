package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class DiaryController {
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "diary", params: params)
    }
    
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
        println("diary");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserDiaryInstanceList = db.rows(
            "SELECT ud.diary_id, ud.topic, ud.entry, DATE_FORMAT(ud.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_diary ud " +
            " WHERE ud.user_id = ? " + 
            " ORDER BY date DESC LIMIT 10", session.user.id)
        
        [UserDiaryInstanceList: UserDiaryInstanceList]
    }
    
    def create() {
        println("create");
        [UserDiaryInstance: new UserDiary(params)]
    }
    
    def save() {
        println("save");
        
        def UserDiaryInstance = new UserDiary(params)
        
        if (!UserDiaryInstance.save(flush: true)) {
            println("didn't save :  " + UserDiaryInstance.errors);
            render(view: "create", model: [UserDiaryInstance: UserDiaryInstance])
            return
        }
        redirect(action: "diary", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def UserDiaryInstance = UserDiary.get(id)
        
        if (!UserDiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserDiary.label', default: 'UserDiary'), id])
            redirect(action: "diary")
            return
        }
        
        [userDiaryInstance: UserDiaryInstance]
    }
    
    def update(Long id, Long version) {
        println("update");
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

    def delete(Long id) {
        println("delete")
        def UserDiaryInstance = UserDiary.get(id)
        if (!UserDiaryInstance) {
            println("something failed")
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
