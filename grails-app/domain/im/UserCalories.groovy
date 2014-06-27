package im

import java.util.Date;

class UserCalories {
    int  amount
    int  previousChange
    Date date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'calories_id'
    }
    
    static constraints = {
        amount(blank: false)
        previousChange(blank: false, nullable: true)
        date(max: new Date(), blank: true, nullable: true)
    }
}

