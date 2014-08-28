package im

import org.springframework.dao.DataIntegrityViolationException

class LoginController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: ["POST"]]
    
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
        println("authenticate")
        def user = Login.findByUserNameAndPassword(params.userName, params.password)
        if (user) {
            println("user = " + user)
            session.user = user
            redirect(uri:'/')
        } else {
            println("failed = " + user)
            flash.message = "Sorry. Please try again."
            redirect(action:"login")
        }
    }
    
    /**
     * zzzzzzzzz
     */
    def createUser() {
        println("create user")
        [LoginInstance: new Login(params)]
    }
    
    /**
     * Saves a new 
     * @return the function fails if it is unable to save the data
     */
    def saveNewUser() {
        println("saveNewUser = " + params)
        
        def user = Login.findByUserName(params.userName)
        if (user) {
            println("username exists")
            flash.message = "The username already exists. Please use another one."
            redirect(action: "createUser")
            return
        }
        
        if (params.password != params.password2) {
            println("passwords do not match")
            flash.message = message(code: 'The passwords do not match.', args: [message(code: 'Login.label', default: 'Login')])
            redirect(action: "createUser")
            return
        }
        if (params.password == "") {
            println("passwords do not match")
            flash.message = message(code: 'The password cannot be blank.', args: [message(code: 'Login.label', default: 'Login')])
            redirect(action: "createUser")
            return
        }
        
//        println("encoded p1  =  " + params.password.encodeAsPassword())
//        println("encoded p2  =  " + params.password2.encodeAsPassword())
//        println("~~~~~~~~")
//      
//        def LoginInstance = new Login("user_name": params.username, "password": password.encodeAsPassword())
        
        println("so far so good")
        def LoginInstance = new Login(userName: params.userName, password: params.password)
        println("loginInstance = " + LoginInstance.dump())
        
        if (!LoginInstance.save(failOnError: true)) {
            flash.message = message(code: 'There was an error creating the user.', args: [message(code: 'Login.label', default: 'Login')])
            redirect(action: "createUser")
            return
        }
        
        flash.message = message(code: 'User created successfully', args: [message(code: 'Login.label', default: 'UserMedications'), LoginInstance.id])
//        redirect(controller: "healthInformation", action: "information", params: params)
        redirect(action: "login")
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
