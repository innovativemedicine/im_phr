package im

import java.util.Date;

class UserQuestionAnswers {
    Date date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'qa_id'
//        version defaultValue: "0"
    }
    
    static constraints = {
        date(blank: true, nullable: true)
    }
}

