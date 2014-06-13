package im

class MyProfileController {

    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
    def index() {
        redirect(action: "profile")
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
    def profile = {
        
    }
    
    
}
