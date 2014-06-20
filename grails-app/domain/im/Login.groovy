package im

import java.util.Date;

class Login {
    String userName
    String password
    String firstName
    String middleName
    String lastName
    String email
    
    String toString () {
        "${firstName}"
        "${middleName}"
        "${lastName}"
    }
    
    static mapping = {
        id column:'user_id'
    }
    
    static hasMany = [userAllergies : UserAllergies, userConditions : UserConditions, userIllnesses : UserIllnesses, 
                      userImmunizations : UserImmunizations, userMedications : UserMedications, userProfile : UserProfile, 
                      userEmergencyContacts : UserEmergencyContacts, userEmploymentInfo : UserEmploymentInfo]
    
    static constraints = {
        userName(blank: false, unique: true)
        password(password: true)
        firstName(blank: false)
        middleName(blank: true)
        lastName(blank: false)
        email(blank: false, email: true, unique: true)
    }
}
