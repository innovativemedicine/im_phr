package im

import java.util.Date;

class QuestionsAnswers {
    Long questionId
    Long answerId
    Date date
    
    static mapping = {
        id column:'qa_id'
    }
    
    static constraints = {
        questionId(blank: false)
        answerId(blank: false)
        date(blank: false, nullable: false)
    }
}

