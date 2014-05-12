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
        "/"(view:"/home")
        "500"(view:'/error')
		"404"(view:'/404')
    }
}
