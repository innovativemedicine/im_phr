package im

import java.util.Date;

class UserImmunizations {
    String name
//    String userId
    String type
    String manufacturer
    String dose
    Date   date
    Date   nextDate
    String comments
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
        "${comments}"
        "${type}"
    }
    
    static mapping = {
        id column:'immunization_id'
    }
    
    static constraints = {
        name(blank: false)
//        type(inList: ["Live", "Inactivated Killed", "Toxoids", "Cellular Fractions", "Combinations", "Immunoglobulins", 
//                      "Anitisera"], nullable: true) // http://www.webhealthcentre.com/HealthyLiving/immunisation_types.aspx
        type(blank: true, nullable: true)
        manufacturer(blank: true, nullable: true)
        dose(blank: true, nullable: true)
        date(max: new Date(), blank: true, nullable: true)
        nextDate(blank: true, nullable: true)
        comments(blank: true, nullable: true)
    }
}
