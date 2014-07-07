package im

import java.util.Date;

class UserBloodPressure {
    int  systolic
    int  diastolic
    Date date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'bloodpressure_id'
    }
    
    static constraints = {
        systolic(blank: false, nullable: true)
        diastolic(blank: false, nullable: true)
        date(blank: true, nullable: true)
    }
}

