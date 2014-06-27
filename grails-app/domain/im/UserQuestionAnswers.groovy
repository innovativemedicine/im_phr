package im

import java.util.Date;

class UserQuestionAnswers {
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'qa_id'
    }
    
    static constraints = {
    }
}

