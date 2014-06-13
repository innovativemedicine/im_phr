package im

import org.springframework.dao.DataIntegrityViolationException

class LoginController {
    
    def index() {
        redirect(action:"login", params: params)
    }
    
    def login = {
        if (session.user != null) {
            redirect(action:"welcome")
        }
    }
    
    def authenticate = {
        def user = Login.findByUserNameAndPassword(params.userName, params.password)
        if (user) {
            session.user = user
            redirect(action:"welcome")
            
        } else {
            flash.message = "Sorry. Please try again."
            redirect(action:"login")
        }
    }
    
    def logout = {
//        flash.message = "Goodbye ${session.user.fullName}"
        session.user = null
        redirect(action:"login")
    }
    
    def welcome =  {
        if (session.user != null) {
            
            def allData = Login.list()
            
            [firstName:session.user.firstName, allData: allData]
            
        } else {
            redirect(action: "login");
        }
    }
    
    def myoscar_login = {
        redirect (url: "http://localhost:8090/myoscar_client/login.jsf")
    }
    
}
