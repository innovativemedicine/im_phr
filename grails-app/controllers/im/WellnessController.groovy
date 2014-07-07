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
        
        // Carbohydrates
        def UserCarbohydrates = db.rows(
            "SELECT uc.* " +
            " FROM user_carbohydrates uc " +
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
        
        
        
        
        [UserCalories: UserCalories, 
         UserCarbohydrates: UserCarbohydrates, 
         
         UserContactsInstanceList: UserContactsInstanceList,
         UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList,
         UserMedicationsInstanceList: UserMedicationsInstanceList, UserIllnessesInstanceList: UserIllnessesInstanceList,
         UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList, ]
        
    }
    
    
    
    
    
    def saveCalories() {
        println("Save - CALORIES");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def LastCaloriesInstance = db.rows(
            "SELECT uc.amount FROM user_calories uc " +
            " WHERE uc.user_id = ? AND date <= ? ORDER BY uc.date DESC LIMIT 1;", session.user.id, params.date)
        def NextCaloriesInstance = db.rows(
            "SELECT uc.calories_id AS 'id', uc.amount FROM user_calories uc " +
            " WHERE uc.user_id = ? AND date >= ? ORDER BY uc.date ASC LIMIT 1;", session.user.id, params.date)
        def change = 0;
        for (e in LastCaloriesInstance) {
            change = (params.amount.toInteger() - e.amount.toInteger())
        }
        
        def UserCaloriesInstance = db.execute(
            "INSERT INTO user_calories (version, amount, date, previous_change, user_id) " +
            " VALUES (0, ?, ?, ?, ?) ", params.amount, params.date, change, params.user.id)
        
        
        // Update next value's amount change if the user updated a date between other entries
        println("NextCaloriesInstance =  " + NextCaloriesInstance)
        for (e in NextCaloriesInstance) {
            def newDiff = e.amount.toInteger() - params.amount.toInteger()
            def UpdateNextCaloriesInstance = db.execute(
                "UPDATE user_calories SET previous_change = ?" +
                " WHERE calories_id = ? ", newDiff, e.id)
        }
        
        redirect(action: "wellness", params: params)
    }
    
    def saveCarbohydrates() {
        println("Save - CARBOHYDRATES");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def LastCarbohydratesInstance = db.rows(
            "SELECT uc.amount FROM user_carbohydrates uc " +
            " WHERE uc.user_id = ? AND date <= ? ORDER BY uc.date DESC LIMIT 1;", session.user.id, params.date)
        def NextCarbohydratesInstance = db.rows(
            "SELECT uc.carbohydrates_id AS 'id', uc.amount FROM user_carbohydrates uc " +
            " WHERE uc.user_id = ? AND date >= ? ORDER BY uc.date ASC LIMIT 1;", session.user.id, params.date)
        def change = 0;
        for (e in LastCarbohydratesInstance) {
            change = (params.amount.toInteger() - e.amount.toInteger())
        }
        
        def UserCarbohydratesInstance = db.execute(
            "INSERT INTO user_carbohydrates (version, amount, date, previous_change, user_id) " +
            " VALUES (0, ?, ?, ?, ?) ", params.amount, params.date, change, params.user.id)
        
        
        // Update next value's amount change if the user updated a date between other entries
        println("NextCarbohydratesInstance =  " + NextCarbohydratesInstance)
        for (e in NextCarbohydratesInstance) {
            def newDiff = e.amount.toInteger() - params.amount.toInteger()
            def UpdateNextCarbohydratesInstance = db.execute(
                "UPDATE user_carbohydrates SET previous_change = ?" +
                " WHERE carbohydrates_id = ? ", newDiff, e.id)
        }
        
        redirect(action: "wellness", params: params)
    }
    
}



