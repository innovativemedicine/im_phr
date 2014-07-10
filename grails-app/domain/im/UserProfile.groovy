package im

import java.util.Date;

class UserProfile {
    String firstName
    String middleName
    String lastName
    String email
    String addressOne
    String addressTwo
    String city
    String province
    String country
    String postalCode
    String gender
    Date   birthday
    String maritalStatus
    String homePhone
    String cellPhone
    String race
    String primaryLanguage
    int    height
    int    weight
    String bloodType
    
    static belongsTo = [user : Login]
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${firstName}"
        "${middleName}"
        "${lastName}"
    }
    
    static mapping = {
        id column:'profile_id'
    }
    
    static constraints = {
        firstName(blank: false, nullable: true)
        middleName(blank: true, nullable: true)
        lastName(blank: false, nullable: true)
        email(blank: false, email: true, unique: true, nullable: true)
        addressOne(blank:true, nullable: true)
        addressTwo(blank:true, nullable: true)
        city(blank:true, nullable: true)
        province(blank:true, nullable: true)
        country(blank:true, nullable: true)
        postalCode(blank:true, nullable: true)
//        gender(blank:true, nullable: true)
        gender(inList:["Male", "Female", "Decline to answer"])
        birthday(blank:true, nullable: true, max: new Date())
        
//        maritalStatus(blank:true, nullable: true)
        maritalStatus(inList:["Married", "Separated", "Divorced", "Widowed", "Single", "Common Law", "Decline to answer"])
        
        homePhone(blank:true, nullable: true)
        cellPhone(blank:true, nullable: true)
        race(blank:true, nullable: true)
        primaryLanguage(blank:true, nullable: true)
        height(blank:true, nullable: true)
        weight(blank:true, nullable: true)
//        bloodType(blank:true, nullable: true)
        bloodType(inList:["Don't Know", "A +", "A -", "B +", "B -", "AB +", "AB -", "O +", "O -"])
    }
}
