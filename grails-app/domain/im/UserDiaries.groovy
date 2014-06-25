package im

import java.util.Date;

class UserDiaries {
    String topic
    String entry
    Date   date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${topic}"
        "${entry}"
    }
    
    static mapping = {
        id column:'diary_id'
    }
    
    static constraints = {
        topic(blank: true, nullable: true)
        entry(blank: true, nullable: true, type: 'text')
        date(max: new Date(), blank: false, nullable: false)
    }
}

