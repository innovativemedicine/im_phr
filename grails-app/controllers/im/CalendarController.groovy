package im

import java.util.Date;

import org.springframework.dao.DataIntegrityViolationException

import groovy.sql.Sql

class CalendarController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "calendar", params: params)
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    /**
     * Main landing page for Calendar tab. Display the main calendar.
     */
    def calendar = {
        def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app
        
        def UserCalendarInstanceList = db.rows(
            "SELECT ui.illness_id, ui.name, ui.symptoms, ui.treatment, ui.comments, " +
            " DATE_FORMAT(ui.onset_date, '%d/%m/%Y') AS 'onset_date', DATE_FORMAT(ui.end_date, '%d/%m/%Y') AS 'end_date' " +
            " FROM user_illnesses ui " +
            " WHERE ui.user_id = ? AND ui.end_date >= CURDATE() ORDER BY ui.onset_date DESC", session.user.id)
        
        [UserCalendarInstanceList: UserCalendarInstanceList]
    }
    
    
}

