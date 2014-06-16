package im

import java.util.Date;

class Login {
    String userName
    String password
    String firstName
    String middleName
    String lastName
    String email
    
    String addressOne
    String addressTwo
    String city
    String province
    String postalCode
    String country
    String telephoneNumber
    String gender
    
    
    Date birthday
    
    String toString () {
        "${firstName}"
        "${middleName}"
        "${lastName}"
    }
    
    static mapping = {
        id column:'user_id'
    }
    
    static constraints = {
        userName(blank: false, unique: true)
        password(password: true)
        firstName(blank: false)
        middleName(blank: true)
        lastName(blank: false)
        email(blank: false, email: true, unique: true)
        
//        addressOne(blank: false)
//        addressTwo(blank: true)
//        city(blank: false)
//        province(blank: false)
//        postalCode(blank: false)
//        country(blank: false)
//        telephoneNumber(blank: false)
//        gender(inList: ["Male", "Female", "Decline to answer"])
        
        birthday(max: new Date())
    }
}
