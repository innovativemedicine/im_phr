package im

import java.util.Date;

class Login {
    String userName
    String password
    String firstName
    String lastName
    String email
    Date birthday
    
    String toString () {
        "${firstName}"
        "${lastName}"
    }
    
    static constraints = {
        firstName(blank: false)
        lastName(blank: false)
        userName(blank: false, unique: true)
        password(password: true)
        email(blank: false, email: true)
        birthday(max: new Date())
    }
}
