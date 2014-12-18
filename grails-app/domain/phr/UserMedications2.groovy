package phr

import java.util.Date;

class UserMedications2 {
    String name
    String dose
    String frequency
    String form
    String strength
    Date   startDate
    Date   stopDate
    Date   refillDate
    String comments
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
        "${dose}"
        "${frequency}"
        "${form}"
        "${strength}"
        "${comments}"
    }
    
    static mapping = {
        id column:'medication_id'
    }
    
    static constraints = {
        name(blank: false)
        dose(blank: true, nullable: true)
        frequency(blank: true, nullable: true)
        form(blank: true, nullable: true)
        strength(inList: ["Very Weak", "Weak", "Fair", "Moderate", "Strong", "Very Strong"], nullable: true)
        strength(blank: true, nullable: true)
        startDate(blank: false, nullable: true)
        stopDate(blank: false, nullable: true)
        refillDate(blank: true, nullable: true)
        comments(blank: true, nullable: true)
    }
}
