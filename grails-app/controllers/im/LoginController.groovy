package im

import org.springframework.dao.DataIntegrityViolationException

class LoginController {
    
    def index() {
        redirect(action:"login", params: params)
    }
    
    /**
     * Opens the 'login' view to allow users to login with their credentials
     */
    def login = {
        if (session.user != null) {
            redirect(uri:'/')
        }
    }
    
    /**
     * Checks whether the user credentials matched any existing users in the database
     */
    def authenticate = {
        def user = Login.findByUserNameAndPassword(params.userName, params.password)
        if (user) {
            session.user = user
            redirect(uri:'/')
        } else {
            flash.message = "Sorry. Please try again."
            redirect(action:"login")
        }
    }
    
    /**
     * Logs the user out. Currently there are no ways to log out manually unless the user idles a long time, 
     * if the browser restarts, or if the user visits this page manually in the URL.
     */
    def logout = {
        session.user = null
        redirect(action:"login")
    }
    
    /**
     * Demo page
     */
    def welcome =  {
        if (session.user != null) {
            [userName:session.user.userName]
        } else {
            redirect(action: "login");
        }
    }
    
}
