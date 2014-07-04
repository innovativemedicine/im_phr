package im

import groovy.sql.Sql
import java.text.ParseException;
import java.util.Date

class WellnessController {
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "wellness")
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    
    
    /**
     * Main landing page for Profile tab. List the details about the current user's information
     */
    def wellness = {
        println("wellness")
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        // Calories
        def UserCalories = db.rows(
            "SELECT uc.* " +
            " FROM user_calories uc " +
            " WHERE uc.user_id = ? " +
            " ORDER BY uc.date DESC LIMIT 5", session.user.id)
        def UserContactsInstanceList = db.rows(
            "SELECT uec.* " +
            " FROM user_emergency_contacts uec " +
            " WHERE uec.user_id = ? ", session.user.id)
        def UserEmploymentInstanceList = db.rows(
            "SELECT uei.* " +
            " FROM user_employment_info uei " +
            " WHERE uei.user_id = ? ", session.user.id)
        
        // Conditions
        def UserConditionsInstanceList = db.rows(
            "SELECT uc.name " +
            " FROM user_conditions uc " +
            " WHERE uc.user_id = ?  AND uc.end_date > curdate() " +
            " ORDER BY uc.onset_date DESC", session.user.id)
        
        // Medications
        def UserMedicationsInstanceList = db.rows(
            "SELECT um.name, um.dose, um.frequency, um.form " +
            " FROM user_medications2 um " +
            " WHERE um.user_id = ? AND um.stop_date > curdate() " +
            " ORDER BY um.start_date DESC", session.user.id)
        
        // Illnesses
        def UserIllnessesInstanceList = db.rows(
            "SELECT ui.name, ui.symptoms, ui.onset_date " +
            " FROM user_illnesses ui " +
            " WHERE ui.user_id = ? AND ui.end_date > curdate() " +
            " ORDER BY ui.onset_date DESC", session.user.id)
        
        // Immunizations
        def UserImmunizationsInstanceList = db.rows(
            "SELECT ui.name, ui.type, ui.date " +
            " FROM user_immunizations ui " +
            " WHERE ui.user_id = ? " +
            " ORDER BY ui.date DESC", session.user.id)
        
        // Allergies
        def UserAllergiesInstanceList = db.rows(
            "SELECT ua.name, ua.reaction, ua.severity " +
            " FROM user_allergies ua " +
            " WHERE ua.user_id = ? " +
            " ORDER BY ua.onset_date DESC", session.user.id)
        
        
        
        
        [UserCalories: UserCalories, UserContactsInstanceList: UserContactsInstanceList,
         UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList,
         UserMedicationsInstanceList: UserMedicationsInstanceList, UserIllnessesInstanceList: UserIllnessesInstanceList,
         UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList, ]
        
    }
    
    
    
    
    
    
    def save() {
        println("Save - CALORIES");
        
        def UserCaloriesInstance = new UserCalories(params)
        
        if (!UserCaloriesInstance.save(flush: true)) {
            println("didn't save :  " + UserCaloriesInstance.errors);
            render(view: "create", model: [UserCaloriesInstance: UserCaloriesInstance])
            return
        }
        redirect(action: "wellness", params: params)
    }

    
}



