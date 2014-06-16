package im

import groovy.sql.Sql

import java.text.ParseException;
import java.util.Calendar;

import java.util.Date
import java.text.SimpleDateFormat

class SummaryController {
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "summary")
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    
    
    /**
     * Main landing page for Summary tab.
     */
    def summary = {
        
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def result = db.rows("SELECT * FROM login WHERE user_name = ? ", session.user.userName) // Perform the query
        
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String currentTime = sdf.format(new Date());
//       
//        println(result.birthday)
//        println(currentTime)
//        
//        println(currentTime - result.birthday)
//        
//        println(daysBetween(result.birthday, currentTime))
        
        [result: result] // return the results as model
    }
    
    
    
    
//    def list = {
//        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
//
//        def result = db.rows("SELECT * FROM login WHERE username = ? ", EndUser.username) // Perform the query
//
//        [ result: result ] // return the results as model
//    }
//    
    
}
