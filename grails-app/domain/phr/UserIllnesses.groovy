package phr
// Unused controller now, as Illnesses are now combined with Conditions.

import java.util.Date;

class UserIllnesses {
    String name
    String symptoms
    String treatment
    Date   onsetDate
    Date   endDate
    String comments
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
    }
    
    static mapping = {
        id column:'illness_id'
    }
    
    static constraints = {
        name(blank: false)
        symptoms(blank: true, nullable: true)
        treatment(blank: true, nullable: true)
        onsetDate(max: new Date(), blank: true, nullable: true)
        endDate(blank: true, nullable: true)
        comments(blank: true, nullable: true)
    }
}

