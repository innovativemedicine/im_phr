package phr

import java.util.Date;

class UserImmunizations {
    String name
    Date   date
    String comments
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
        "${comments}"
    }
    
    static mapping = {
        id column:'immunization_id'
    }
    
    static constraints = {
        name(blank: false)
        date(max: new Date(), blank: true, nullable: true)
        comments(blank: true, nullable: true)
    }
}
