package im

import java.util.Date;

class UserAllergies {
    String name
    String reaction
    String severity
    Date   onsetDate
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
    }
    
    static mapping = {
        id column:'allergy_id'
    }
    
    static constraints = {
        name(blank: false)
        reaction(blank: true, nullable: true)
        severity(inList: ["Minor", "Moderate", "Serious", "Severe", "Critical"], nullable: true)
        onsetDate(max: new Date(), blank: true, nullable: true)
    }
}

