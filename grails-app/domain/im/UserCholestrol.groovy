package im

import java.util.Date;

class UserCholestrol {
    int  amount
    int  previousChange
    Date date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'cholestrol_id'
    }
    
    static constraints = {
        amount(blank: false, nullable: true)
        previousChange(blank: false, nullable: true)
        date(blank: true, nullable: true)
    }
}

