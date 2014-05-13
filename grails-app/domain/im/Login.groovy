package im

import java.util.Date;

class Login {
    String userName
    String password
    String fullName
    String email
    Date birthday
    
    String toString () {
        "${fullName}"
    }
    
    static constraints = {
        fullName(blank: false)
        userName(blank: false, unique: true)
        password(password: true)
        email(blank: false, email: true)
        birthday(max: new Date())
    }
}
