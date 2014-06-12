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
        name immunizations: "/immunizations"(view:"/immunizations")
        name allergies:     "/allergies"    (view:"/allergies")
        name illnesses:     "/illnesses"    (view:"/illnesses")
        name conditions:    "/conditions"   (view:"/conditions")
        name wellness:      "/wellness"     (view:"/wellness")
        name calendar:      "/calendar"     (view:"/calendar")
        name profile:       "/profile"      (view:"/profile")
        
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
