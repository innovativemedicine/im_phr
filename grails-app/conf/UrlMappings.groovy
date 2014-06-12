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
        
        name home:          "/"             (view:"/index")
        name summary:       "/summary"      (view:"/summary")
        name medications:   "/medications"  (view:"/medications")
        name immunizations: "/immunizations"(view:"/contact")
        name allergies:     "/allergies"    (view:"/careers")
        name illnesses:     "/illnesses"    (view:"/careers")
        name conditions:    "/conditions"   (view:"/symposium-2012-MAY-31")
        name wellness:      "/wellness"     (view:"/tools")
        name calendar:      "/calendar"     (view:"/tools")
        name profile:       "/profile"      (view:"/tools")
        
//        name vcflatten:"/tools/vcflatten"(view:"/vcflatten")
        
        
//        name tissues:"/tissues"(view:"/tissues")
//        
//        name login:"/login"(controller:"login")
//        name logout:"/logout"(controller:"login", action:"logout")
        
        
//        name myoscarlogin:"/myoscar-login/"(controller:"login", action:"myoscar_login")
        
        
//        name myoscarlogin:"http://localhost:8090/myoscar_client/login.jsf"(view:"/about")
        
        
        "/"(view:"/home")
        "500"(view:'/error')
		"404"(view:'/404')
    }
}
