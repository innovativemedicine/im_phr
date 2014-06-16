package im

import groovy.sql.Sql

import java.util.Date
import java.text.SimpleDateFormat

class MedicationsController {
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "medications")
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    
    
    /** 
     * Main landing page for Medications tab.
     */
    def medications = {
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def result = db.rows("SELECT um.name, um.dose, um.frequency, um.form, um.strength, um.start_date, " + 
                             "um.stop_date, um.refill_date, um.comments FROM user_medications um, login l " + 
                             "WHERE um.user_id = l.user_id AND l.user_name = ? ", session.user.userName) // Perform the query
        
        [result: result] // return the results as model
    }
    
    
    def add_medicine = {
        println("working")
        return false
    }
    
    
}
