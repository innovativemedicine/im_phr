package phr

import java.util.Date;

class UserCalories {
	int  amount
	int  previousChange
	Date calDate

	static belongsTo = [user : Login]

	static fetchMode = [user: 'eager']

	static mapping = { id column:'calories_id' }

	static constraints = {
		amount(blank: false, nullable: true)
		previousChange(blank: false, nullable: true)
		calDate(blank: true, nullable: true)
	}
}

