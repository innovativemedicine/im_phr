package im

import java.util.Date;

class UserExercise {
    int  pushups
    int  situps
    int  squats
    int  steps
    Date date
    
    static belongsTo = [user : Login]
    
    static fetchMode = [user: 'eager']
    
    static mapping = {
        id column:'exercise_id'
    }
    
    static constraints = {
        pushups(blank: true, nullable: true)
        situps(blank: true, nullable: true)
        squats(blank: true, nullable: true)
        steps(blank: true, nullable: true)
        date(blank: true, nullable: true)
    }
}

