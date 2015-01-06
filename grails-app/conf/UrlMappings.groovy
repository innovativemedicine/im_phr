class UrlMappings {

	static mappings = {
		//        "/$controller/$action?/$id?/$var1?/$var2?"
		"/$controller/$action?/$var1?/$var2?"
		{ constraints {
				// apply constraints here
			} }
		//   name about:"/"{view='/index.gsp'}

		name home:          "/"             (view:"/index")
		name summary:       "/summary"      (controller:"summary")
		name information:   "/information"  (controller:"healthInformation")

		name medications:   "/medications"  (controller:"medications2")
		name immunizations: "/immunizations"(controller:"immunizations")
		name allergies:     "/allergies"    (controller:"allergies")
		name illnesses:     "/illnesses"    (controller:"illnesses")

		name conditions:    "/conditions"   (controller:"conditions")
		name wellness:      "/wellness"     (controller:"wellness")

		name questionnaire: "/questionnaire"(controller:"questionnaire")
		name diary:         "/diary"        (controller:"diary")

		name calendar:      "/calendar"     (controller:"calendar")
		name profile:       "/profile"      (controller:"myProfile")

		//
		//        name login:"/login"(controller:"login")
		//        name logout:"/logout"(controller:"login", action:"logout")

		"/"(view:"/home")
		"500"(view:'/error')
		"404"(view:'/404')
	}
}
