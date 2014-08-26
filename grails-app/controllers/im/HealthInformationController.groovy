package im

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class HealthInformationController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET", "POST"]]
    
    def dataSource // the Spring-Bean "dataSource" is auto-injected
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "information", params: params)
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
     * Main landing page for the Health Information tab.
     */
    def information = {
    }
    
}
