package im

import org.springframework.dao.DataIntegrityViolationException


class ImmunizationsController {
    
    // Ensure that all pages must be accessed by a logged in user
    def beforeInterceptor = [action:this.&auth]
    
//    def index() {
//        redirect(action: "immunizations")
//    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
    }
    
    
    
    /**
     * Main landing page for Immunizations tab.
     */
    def immunizations = {
        def immunizationsInstance = new UserImmunizations(params)
//        immunizationsInstance.image = getProductPicturePath() ?: Product().image
//        immunizationsInstance.image = getProductPicturePath() ?: Product.DEFAULT_IMAGE
        [UserImmunizationsInstanceList: UserImmunizations.list(params)]
    }
    
    
    
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def index() {
        println("index  {params = " + params + "}");
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println("list");
        params.max = Math.min(max ?: 10, 100)
        [UserImmunizationsInstanceList: UserImmunizations.list(params)] // UserImmunizationsInstanceTotal: UserImmunizations.count()
        
        redirect(action: "immunizations", params: params)
    }
    
    def create() {
        println("create");
        [UserImmunizationsInstance: new UserImmunizations(params)]
    }
    
    def save() {
        println("save");
        def UserImmunizationsInstance = new UserImmunizations(params)
        if (!UserImmunizationsInstance.save(flush: true)) {
            render(view: "create", model: [UserImmunizationsInstance: UserImmunizationsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
        redirect(action: "show", id: UserImmunizationsInstance.id)
    }
    
    def show(Long id) {
        println("show");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "list")
            return
        }

        [UserImmunizationsInstance: UserImmunizationsInstance]
    }

    def edit(Long id) {
        println("edit");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "list")
            return
        }

        [UserImmunizationsInstance: UserImmunizationsInstance]
    }

    def update(Long id, Long version) {
        println("update");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (UserImmunizationsInstance.version > version) {
                UserImmunizationsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'UserImmunizations.label', default: 'UserImmunizations')] as Object[],
                          "Another user has updated this UserImmunizations while you were editing")
                render(view: "edit", model: [UserImmunizationsInstance: UserImmunizationsInstance])
                return
            }
        }

        UserImmunizationsInstance.properties = params

        if (!UserImmunizationsInstance.save(flush: true)) {
            render(view: "edit", model: [UserImmunizationsInstance: UserImmunizationsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), UserImmunizationsInstance.id])
        redirect(action: "show", id: UserImmunizationsInstance.id)
    }

    def delete(Long id) {
        println("delete");
        def UserImmunizationsInstance = UserImmunizations.get(id)
        if (!UserImmunizationsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "list")
            return
        }

        try {
            UserImmunizationsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'UserImmunizations.label', default: 'UserImmunizations'), id])
            redirect(action: "show", id: id)
        }
    }
    
}
