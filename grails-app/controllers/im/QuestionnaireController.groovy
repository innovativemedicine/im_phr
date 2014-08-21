package im

import org.springframework.dao.DataIntegrityViolationException

import groovy.sql.Sql

import java.util.Date

class QuestionnaireController {
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "questionnaire", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Questions tab.
     */
    def questionnaire = {
        println("questions  {params = " + params + "}");
        
        if (params.var1 == null) {
            println("params1 ")
            params.var1 = "BASDAI"
            redirect(action: "questionnaire", params: params)
        }
        
        def questionnaireParam = params.var1
        
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def QuestionsInstanceList = db.rows(
            "SELECT q.question_id, q.question_text, q.page_name " +
            " FROM questions q" + 
            " WHERE page_name = ? ORDER BY q.question_id ASC", questionnaireParam)
        
        
        [QuestionsInstanceList: QuestionsInstanceList, questionnaireParam: questionnaireParam]
    }
    
    def create() {
        println("create");
        [QuestionsInstance: new Questions(params)]
    }
    
    def save() {
        println("save");
        
        Date test = new Date()
        
        println("userId = " + params.user.id)
        println("date = " + test)
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        // Set the value that designates the User answering the questionnaire
        def UserQuestionsAnswersInstance = db.execute(
            "INSERT INTO user_questions_answers (version, date, user_id) " +
            " VALUES (0, ?, ?) ", new Date(), params.user.id)
        println(UserQuestionsAnswersInstance.dump())
        
        // Get the ID that was created in last MySQL call
        def lastId = db.rows("SELECT LAST_INSERT_ID() AS 'id';")
        long qaId = lastId.get(0).id   //lastId.id
        println("qaId = " + qaId)
        
//        // Find the corresponding answer table values
//        for (i in )
//        def AnswerValues = db.row("SELECT a.answer_text FROM answers a WHERE a.answer_id IN (0, 4, 5, 6, 8, 9, 11, 20)")
        
        
        // Save the data into the QuestionAnswers Table that links the userId with the Questions and Answers
        def arr1 = []
        for (e in params) {
            println(e.key + "  ~~~~~  " + e.value)
            if (e.key.contains("Q")) {
                arr1.add(e)
                println(arr1)
                
                def questionId = e.key.substring(1)
                def answerId = e.value
                def other = 0;
                
                // Questions with "other, specify" fields
                if (e.key == "Q33") {
                    other = params.other33b
                    println("OTHER = " + other + "   key = " + e.key)
                    answerId = 23
                }
                else if (e.key == "Q55") {
                    other = params.other55b
                    println("OTHER = " + other + "   key = " + e.key)
                    answerId = 23
                }
                // Questions with ranges
                else if (e.key == "Q60" || e.key == "Q61" || e.key == "Q62" ) {
                    other = e.value
                    answerId = 44
                }
                
                def QuestionsAnswersInstance = new QuestionsAnswers(qaId: qaId, questionId: questionId, answerId: answerId, other: other)
                
                if (!QuestionsAnswersInstance.save(flush: true)) {
                    println("didn't save :  " + QuestionsAnswersInstance.errors);
                    render(action: "questionnaire", params: params)
                    return
                }
                
                
            }
        }
        
        
        /* The following query gets the latest entry in the Questionnaires tables. Thus, it will check 
         * the corresponding question and answer of the user. */
//        SELECT
//        uqa.qa_id AS 'qaID', uqa.date AS 'dateAdded', uqa.user_id AS 'userID', 
//        q.question_id AS 'questionID', q.page_name AS 'page', q.question_text AS 'question',
//        a.answer_id AS 'answerId', a.answer_text AS 'answer', qa.other AS 'other', 
//        l.user_name AS 'username'
//        FROM user_questions_answers uqa
//            JOIN questions_answers qa
//                ON qa.qa_id = uqa.qa_id
//            JOIN questions q
//                ON q.question_id = qa.question_id
//            JOIN answers a
//                ON a.answer_id = qa.answer_id
//            JOIN login l
//                ON l.user_id = uqa.user_id
//            RIGHT JOIN (
//        SELECT MAX(date) AS 'date' FROM user_questions_answers WHERE user_id = 1
//        ) z ON z.date = uqa.date
//        WHERE uqa.user_id = 1
//        ORDER BY q.question_id ASC
        
        
//        // Redirect to the next questionnaire
//        println("`````````` SAVE DONE ````````````   " + params.var1)
//        println("params = " + params.dump())
//        if (params.var1 == "BASDAI") {
//            params.var1 = "BASFI"
//            println("BASFI = " + params.var1)
//        } else if (params.var1 == "BASFI") {
//            params.var1 = "Health Assessment Questionnaire"
//            println("Health Assessment Questionnaire = " + params.var1)
//        }
        
        redirect(action: "questionnaire", params: params)
    }
    
    def edit(Long id) {
        println("edit : " + id);
        
        def QuestionsInstance = Questions.get(id)
        
        if (!QuestionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Questions.label', default: 'Questions'), id])
            redirect(action: "questionnaire")
            return
        }
        
        [questionsInstance: QuestionsInstance]
    }
    
    def update(Long id, Long version) {
        println("update : " + id);
        def QuestionsInstance = Questions.get(id)
        if (!QuestionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Questions.label', default: 'Questions'), id])
            redirect(action: "questionnaire")
            return
        }

        if (version != null) {
            if (QuestionsInstance.version > version) {
                QuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'Questions.label', default: 'Questions')] as Object[],
                          "Another user has updated this Questions while you were editing")
                render(view: "edit", model: [QuestionsInstance: QuestionsInstance])
                return
            }
        }

        QuestionsInstance.properties = params

        if (!QuestionsInstance.save(flush: true)) {
            render(view: "edit", model: [QuestionsInstance: QuestionsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'Questions.label', default: 'Questions'), QuestionsInstance.id])
        redirect(action: "questionnaire", id: QuestionsInstance.id)
    }

    def delete(Long id) {
        println("delete")
        def QuestionsInstance = Questions.get(id)
        if (!QuestionsInstance) {
            println("something failed")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Questions.label', default: 'Questions'), id])
            redirect(action: "questionnaire")
            return
        }

        try {
            QuestionsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'Questions.label', default: 'Questions'), id])
            redirect(action: "questionnaire")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'Questions.label', default: 'Questions'), id])
            redirect(action: "questionnaire", id: id)
        }
        
    }
    
}
