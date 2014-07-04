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
        
        // User Info
        def UserProfileInstanceList = db.rows(
            "SELECT up.* " +
            " FROM user_profile up " +
            " WHERE up.user_id = ? ", session.user.id)
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
            " WHERE uc.user_id = ? AND uc.end_date > curdate() " + 
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
        
        
        
        
        [UserProfileInstanceList: UserProfileInstanceList, UserContactsInstanceList: UserContactsInstanceList, 
         UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList, 
         UserMedicationsInstanceList: UserMedicationsInstanceList, UserIllnessesInstanceList: UserIllnessesInstanceList, 
         UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList, ]
        
    }
    
    
}
