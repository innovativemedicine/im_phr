package im

import groovy.sql.Sql

class WellnessController {
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "wellness")
    }
    
    /**
     * Checks to see whether the user is logged in before loading the page
     */
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Profile tab. List the details about the current user's well-being information.
     */
    def wellness = {
        println("wellness")
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        // Calories
        def UserCaloriesInstanceList = db.rows(
            "SELECT uc.*, DATE_FORMAT(uc.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_calories uc " +
            " WHERE uc.user_id = ? " +
            " ORDER BY uc.date DESC LIMIT 5", session.user.id)
        
        // Carbohydrates
        def UserCarbohydratesInstanceList = db.rows(
            "SELECT uc.*, DATE_FORMAT(uc.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_carbohydrates uc " +
            " WHERE uc.user_id = ? " +
            " ORDER BY uc.date DESC LIMIT 5", session.user.id)
        
        // Cholestrol
        def UserCholestrolInstanceList = db.rows(
            "SELECT uc.*, DATE_FORMAT(uc.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_cholestrol uc " +
            " WHERE uc.user_id = ? " +
            " ORDER BY uc.date DESC LIMIT 5", session.user.id)
        
        // Blood Pressure
        def UserBloodPressureInstanceList = db.rows(
            "SELECT ub.*, DATE_FORMAT(ub.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_blood_pressure ub " +
            " WHERE ub.user_id = ? " +
            " ORDER BY ub.date DESC LIMIT 5", session.user.id)
        
        // BMI
        def UserBmiInstanceList = db.rows(
            "SELECT ub.*, DATE_FORMAT(ub.date, '%d/%m/%Y') AS 'date' " + 
            " FROM user_bmi ub " +
            " WHERE ub.user_id = ? " +
            " ORDER BY ub.date DESC LIMIT 5", session.user.id)
        
        // Exercise
        def UserPushupsInstanceList = db.rows(
            "SELECT ue.pushups, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' FROM user_exercise ue WHERE ue.user_id = ? AND ue.pushups > 0 " + 
            " ORDER BY ue.date DESC LIMIT 5", session.user.id)
        def UserSitupsInstanceList = db.rows(
            "SELECT ue.situps, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date' FROM user_exercise ue WHERE ue.user_id = ? AND ue.situps > 0 " + 
            " ORDER BY ue.date DESC LIMIT 5", session.user.id)
        def UserSquatsInstanceList = db.rows(
            "SELECT ue.squats, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date'  FROM user_exercise ue WHERE ue.user_id = ? AND ue.squats > 0 " + 
            " ORDER BY ue.date DESC LIMIT 5", session.user.id)
        def UserStepsInstanceList = db.rows(
            "SELECT ue.steps, DATE_FORMAT(ue.date, '%d/%m/%Y') AS 'date'  FROM user_exercise ue WHERE ue.user_id = ? AND ue.steps > 0 " + 
            " ORDER BY ue.date DESC LIMIT 5", session.user.id)
        
        [UserCaloriesInstanceList: UserCaloriesInstanceList, 
         UserCarbohydratesInstanceList: UserCarbohydratesInstanceList, 
         UserCholestrolInstanceList: UserCholestrolInstanceList, 
         UserBloodPressureInstanceList: UserBloodPressureInstanceList, 
         UserBmiInstanceList: UserBmiInstanceList, 
         UserPushupsInstanceList: UserPushupsInstanceList, 
         UserSitupsInstanceList: UserSitupsInstanceList, 
         UserSquatsInstanceList: UserSquatsInstanceList, 
         UserStepsInstanceList: UserStepsInstanceList]
    }
    
    /**
     * Saves a new data entry for calories into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveCalories() {
        println("Save - CALORIES");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def LastCaloriesInstance = db.rows(
            "SELECT uc.amount FROM user_calories uc " +
            " WHERE uc.user_id = ? AND date < ? ORDER BY uc.date DESC LIMIT 1;", session.user.id, params.date)
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
    
    /**
     * Saves a new data entry for carbohydrates into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveCarbohydrates() {
        println("Save - CARBOHYDRATES");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def LastCarbohydratesInstance = db.rows(
            "SELECT uc.amount FROM user_carbohydrates uc " +
            " WHERE uc.user_id = ? AND date < ? ORDER BY uc.date DESC LIMIT 1;", session.user.id, params.date)
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
    
    /**
     * Saves a new data entry for cholestrol into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveCholestrol() {
        println("Save - CHOLESTROL");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def LastCholestrolInstance = db.rows(
            "SELECT uc.amount FROM user_cholestrol uc " +
            " WHERE uc.user_id = ? AND date < ? ORDER BY uc.date DESC LIMIT 1;", session.user.id, params.date)
        def NextCholestrolInstance = db.rows(
            "SELECT uc.cholestrol_id AS 'id', uc.amount FROM user_cholestrol uc " +
            " WHERE uc.user_id = ? AND date >= ? ORDER BY uc.date ASC LIMIT 1;", session.user.id, params.date)
        def change = 0;
        for (e in LastCholestrolInstance) {
            change = (params.amount.toInteger() - e.amount.toInteger())
        }
        
        def UserCholestrolInstance = db.execute(
            "INSERT INTO user_cholestrol (version, amount, date, previous_change, user_id) " +
            " VALUES (0, ?, ?, ?, ?) ", params.amount, params.date, change, params.user.id)
        
        // Update next value's amount change if the user updated a date between other entries
        println("NextCholestrolInstance =  " + NextCholestrolInstance)
        for (e in NextCholestrolInstance) {
            def newDiff = e.amount.toInteger() - params.amount.toInteger()
            def UpdateNextCholestrolInstance = db.execute(
                "UPDATE user_cholestrol SET previous_change = ?" +
                " WHERE cholestrol_id = ? ", newDiff, e.id)
        }
        
        redirect(action: "wellness", params: params)
    }
    
    /**
     * Saves a new data entry for blood pressures into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveBloodPressure() {
        println("Save - BLOODPRESSURE");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserBloodPressureInstance = db.execute(
            "INSERT INTO user_blood_pressure (version, systolic, diastolic, date, user_id) " +
            " VALUES (0, ?, ?, ?, ?) ", params.systolic, params.diastolic, params.date, params.user.id)
        
        redirect(action: "wellness", params: params)
    }
    
    /**
     * Saves a new data entry for BMI (height and weight) into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveBmi() {
        println("Save - BMI");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def bmi = params.weight.toInteger() * 703 / (params.height.toInteger() * params.height.toInteger())
        
        print("" + params.weight.toInteger() + "/" + (params.height.toInteger() * params.height.toInteger()))
        print("  =  " + params.weight.toInteger() / (params.height.toInteger() * params.height.toInteger()))
        println(bmi)
        def UserBloodPressureInstance = db.execute(
            "INSERT INTO user_bmi (version, bmi, height, weight, date, user_id) " +
            " VALUES (0, ?, ?, ?, ?, ?) ", bmi, params.height, params.weight, params.date, params.user.id)
        
        redirect(action: "wellness", params: params)
    }
    
    /**
     * Saves a new data entry for the exercise information into the database.
     * @return the function fails if it is unable to save the data
     */
    def saveExercise() {
        println("Save - EXERCISE");
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        println(params)
        
        def UserBloodPressureInstance = db.execute(
            "INSERT INTO user_exercise (version, pushups, situps, squats, steps, date, user_id) " +
            " VALUES (0, ?, ?, ?, ?, ?, ?) ", params.pushups, params.situps, params.squats, params.steps, params.date, params.user.id)
        
        println("saving worked")
        
        redirect(action: "wellness", params: params)
    }
    
}
