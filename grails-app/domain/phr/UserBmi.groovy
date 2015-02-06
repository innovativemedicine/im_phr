package phr

import java.util.Date;

class UserBmi {
	BigDecimal  bmi
	BigDecimal  weight
	BigDecimal  height
	Date bmiDate

	static belongsTo = [user : Login]

	static fetchMode = [user: 'eager']

	static mapping = { id column:'bmi_id' }

	static constraints = {
		bmi(blank: false, nullable: true)
		height(blank: false, nullable: true)
		weight(blank: false, nullable: true)
		bmiDate(blank: true, nullable: true)
	}
}

