package phr

class PatientController {

	def index() {
		[UserProfileInstance: new UserProfile()]
	}


	def show() {
		def patientProfile = UserProfile.findByFirstNameAndLastName(params.firstName, params.lastName)
		def patient = patientProfile.user

		def UserContactsInstanceList = UserEmergencyContacts.findAllByUser(patient)
		def UserMedicationsInstanceList = UserMedications2.findAllByUser(patient)

		print UserMedicationsInstanceList

		def UserConditionsInstanceList = UserConditions.findAllByUser(patient)
		def UserEmploymentInstanceList = UserEmploymentInfo.findAllByUser(patient)
		def UserImmunizationsInstanceList = UserImmunizations.findAllByUser(patient)
		def UserAllergiesInstanceList = UserAllergies.findAllByUser(patient)
		def UserCaloriesInstanceList = UserCalories.findAllByUser(patient)
		def UserCarbohydratesInstanceList = UserCarbohydrates.findAllByUser(patient)
		def UserCholestrolInstanceList = UserCholestrol.findAllByUser(patient)
		def UserBloodPressureInstanceList = UserBloodPressure.findAllByUser(patient)
		def UserBmiInstanceList = UserBmi.findAllByUser(patient)

		[UserProfileInstance: patientProfile, UserContactsInstanceList: UserContactsInstanceList,
			UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList,
			UserMedicationsInstanceList: UserMedicationsInstanceList,
			UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList,
			UserCaloriesInstanceList: UserCaloriesInstanceList, UserCarbohydratesInstanceList: UserCarbohydratesInstanceList,
			UserCholestrolInstanceList: UserCholestrolInstanceList, UserBloodPressureInstanceList: UserBloodPressureInstanceList,
			UserBmiInstanceList: UserBmiInstanceList]
	}
}
