package im

import org.springframework.dao.DataIntegrityViolationException

class LoginController {
    
    def index() {
        redirect(action: "login", params: params)
    }
    def login = {}
    
    def authenticate = {
        def user = Login.findByUserNameAndPassword(params.userName, params.password)
        if (user) {
            session.user = user
            flash.message = "Hello ${user.fullName}!"
            redirect(action:"login")
            
        } else {
        flash.message = "Sorry, ${params.userName}. Please try again."
        redirect(action:"login")
        }
    }
    
    def logout = {
        flash.message = "Goodbye ${session.user.fullName}"
        session.user = null
        redirect(action:"login")
    }
    
}
