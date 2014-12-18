package phr

import java.util.Date;

class UserQuestionsAnswers {
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

