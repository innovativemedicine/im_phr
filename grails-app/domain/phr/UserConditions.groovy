package phr

import java.util.Date;

class UserConditions {
    String name
    String symptoms
    String comments
    Date   onsetDate
    Date   endDate
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
    }
    
    static mapping = {
        id column:'condition_id'
    }
    
    static constraints = {
        name(blank: false)
        symptoms(blank: true, nullable: true)
        comments(blank: true, nullable: true)
        onsetDate(max: new Date(), blank: false, nullable: false)
        endDate(blank: true, nullable: true)
    }
}

