package phr

import java.util.Date;

class UserCarbohydrates {
	int  amount
	int  previousChange
	Date carbDate

	static belongsTo = [user : Login]

	static fetchMode = [user: 'eager']

	static mapping = { id column:'carbohydrates_id' }

	static constraints = {
		amount(blank: false, nullable: true)
		previousChange(blank: false, nullable: true)
		carbDate(blank: true, nullable: true)
	}
}

