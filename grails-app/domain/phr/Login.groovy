package phr

import java.util.Date;

class Login {
	String userName
	String password
	String role

	String toString () {
		"${userName}"
		"${password}"
	}

	static mapping = { id column:'user_id' }

	static hasMany = [userAllergies : UserAllergies, userConditions : UserConditions, userIllnesses : UserIllnesses,
		userImmunizations : UserImmunizations, userMedications : UserMedications, userProfile : UserProfile,
		userEmergencyContacts : UserEmergencyContacts, userEmploymentInfo : UserEmploymentInfo]

	static constraints = {
		userName(blank: false, unique: true)
		password(blank: false)
	}
}
