package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class AnswersController {
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "answers", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Answers tab. 
     */
    def answers = {
        println("answers");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def AnswersInstanceList = db.rows(
            "SELECT a.answer_id, a.answer_text " +
            " FROM answers a" + 
            " ORDER BY a.answer_id ASC")
        
        [AnswersInstanceList: AnswersInstanceList]
    }
    
    def create() {
        println("create");
        [AnswersInstance: new Answers(params)]
    }
    
    def save() {
        println("save");
        
        def AnswersInstance = new Answers(params)
        
        if (!AnswersInstance.save(flush: true)) {
            println("didn't save :  " + AnswersInstance.errors);
            render(view: "create", model: [AnswersInstance: AnswersInstance])
            return
        }
        redirect(action: "answers", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def AnswersInstance = Answers.get(id)
        
        if (!AnswersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Answers.label', default: 'Answers'), id])
            redirect(action: "answers")
            return
        }
        
        [answersInstance: AnswersInstance]
    }
    
    def update(Long id, Long version) {
        println("update : " + id);
        def AnswersInstance = Answers.get(id)
        if (!AnswersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Answers.label', default: 'Answers'), id])
            redirect(action: "answers")
            return
        }

        if (version != null) {
            if (AnswersInstance.version > version) {
                AnswersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'Answers.label', default: 'Answers')] as Object[],
                          "Another user has updated this Answers while you were editing")
                render(view: "edit", model: [AnswersInstance: AnswersInstance])
                return
            }
        }

        AnswersInstance.properties = params

        if (!AnswersInstance.save(flush: true)) {
            render(view: "edit", model: [AnswersInstance: AnswersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'Answers.label', default: 'Answers'), AnswersInstance.id])
        redirect(action: "answers", id: AnswersInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def AnswersInstance = Answers.get(id)
        if (!AnswersInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Answers.label', default: 'Answers'), id])
            redirect(action: "answers")
            return
        }

        try {
            AnswersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'Answers.label', default: 'Answers'), id])
            redirect(action: "answers")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'Answers.label', default: 'Answers'), id])
            redirect(action: "answers", id: id)
        }
        
    }
    
}
