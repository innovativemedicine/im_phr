package im

import java.util.Date;

class UserEmergencyContacts {
    String name
    String relationship
    String phoneNumberOne
    String phoneNumberTwo
    String addressOne
    String addressTwo
    String city
    String province
    String country
    String postalCode
    
    static belongsTo = [user : Login]
    static fetchMode = [user: 'eager']
    
    String toString () {
        "${name}"
    }
    
    static mapping = {
        id column:'emergency_id'
    }
    
    static constraints = {
        name(blank:true, nullable: true)
        phoneNumberOne(blank:true, nullable: true)
        phoneNumberTwo(blank:true, nullable: true)
        addressOne(blank:true, nullable: true)
        addressTwo(blank:true, nullable: true)
        city(blank:true, nullable: true)
        province(blank:true, nullable: true)
//        province(inList:["AB - Alberta", "BC - British Columbia", "MB - Manitoba",
//                        "NB - New Brunswick", "NS - Nova Scotia", "NT - Northwest Territories",
//                        "NU - Nunavut", "ON - Ontario", "PE - Prince Edward Island",
//                        "QC - Quebec", "SK - Saskatchewan", "YT - Yukon"])
        country(blank:true, nullable: true)
//        country(inList:["", "Canada", "United States of America"])
        postalCode(blank:true, nullable: true)
    }
}
