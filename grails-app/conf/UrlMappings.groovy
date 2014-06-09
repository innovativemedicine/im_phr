class UrlMappings
{
    
    static mappings =
    {
        "/$controller/$action?/$id?"
        { constraints
            { // apply constraints here
            }
        }
        //   name about:"/"{view='/index.gsp'}
        
        name about:"/about"(view:"/about")
        name team:"/team"(view:"/team")
        name contact:"/contact"(view:"/contact")
        name careers:"/careers"(view:"/careers")
        name services:"/services"(view:"/services")
        name home:"/"(view:"/index")
        name symposium:"/symposium-2012-MAY-31"(view:"/symposium-2012-MAY-31")
        name tools:"/tools"(view:"/tools")
        name vcflatten:"/tools/vcflatten"(view:"/vcflatten")
        
        
        name tissues:"/tissues"(view:"/tissues")
        
        name login:"/login"(controller:"login")
        name logout:"/logout"(controller:"login", action:"logout")
        
        
        name myoscarlogin:"/myoscar-login/"(controller:"login", action:"myoscar_login")
        
        
//        name myoscarlogin:"http://localhost:8090/myoscar_client/login.jsf"(view:"/about")
        
        
//        name login:"/login"(view:"/login/login", controller:"login")
        
        "/"(view:"/home")
        "500"(view:'/error')
		"404"(view:'/404')
    }
}
