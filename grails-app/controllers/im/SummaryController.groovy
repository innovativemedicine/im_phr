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
            " FROM user_profile up, login l " +
            " WHERE up.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        def UserContactsInstanceList = db.rows(
            "SELECT uec.* " +
            " FROM user_emergency_contacts uec, login l " +
            " WHERE uec.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        def UserEmploymentInstanceList = db.rows(
            "SELECT uei.* " +
            " FROM user_employment_info uei, login l " +
            " WHERE uei.user_id = l.user_id AND l.user_name = ? ", session.user.userName)
        
        // Conditions
        def UserConditionsInstanceList = db.rows(
            "SELECT uc.name " +
            " FROM user_conditions uc, login l " +
            " WHERE uc.user_id = l.user_id AND l.user_name = ?  AND uc.end_date > curdate() " + 
            " ORDER BY uc.onset_date DESC", session.user.userName)
        
        // Medications
        def UserMedicationsInstanceList = db.rows(
            "SELECT um.name, um.dose, um.frequency, um.form " +
            " FROM user_medications2 um, login l " +
            " WHERE um.user_id = l.user_id AND l.user_name = ? AND um.stop_date > curdate() " + 
            " ORDER BY um.start_date DESC", session.user.userName)
        
        // Illnesses
        def UserIllnessesInstanceList = db.rows(
            "SELECT ui.name, ui.symptoms, ui.onset_date " +
            " FROM user_illnesses ui, login l " +
            " WHERE ui.user_id = l.user_id AND l.user_name = ? AND ui.end_date > curdate() " + 
            " ORDER BY ui.onset_date DESC", session.user.userName)
        
        // Immunizations
        def UserImmunizationsInstanceList = db.rows(
            "SELECT ui.name, ui.type, ui.date " +
            " FROM user_immunizations ui, login l " +
            " WHERE ui.user_id = l.user_id AND l.user_name = ? " + 
            " ORDER BY ui.date DESC", session.user.userName)
        
        // Allergies
        def UserAllergiesInstanceList = db.rows(
            "SELECT ua.name, ua.reaction, ua.severity " +
            " FROM user_allergies ua, login l " +
            " WHERE ua.user_id = l.user_id AND l.user_name = ? " + 
            " ORDER BY ua.onset_date DESC", session.user.userName)
        
        
        
        
        [UserProfileInstanceList: UserProfileInstanceList, UserContactsInstanceList: UserContactsInstanceList, 
         UserEmploymentInstanceList: UserEmploymentInstanceList, UserConditionsInstanceList: UserConditionsInstanceList, 
         UserMedicationsInstanceList: UserMedicationsInstanceList, UserIllnessesInstanceList: UserIllnessesInstanceList, 
         UserImmunizationsInstanceList: UserImmunizationsInstanceList, UserAllergiesInstanceList: UserAllergiesInstanceList, ]
        
    }
    
    
}
