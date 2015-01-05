modules = {

	app {

		dependsOn 'laf'
		resource url: [  dir: 'js', file: 'application.js' ], bundle: 'bundle_app'
		resource url: [  dir: 'css', file: 'main.css' ], attrs:[ rel: "stylesheet", type:'css' ], bundle: 'bundle_app'
	}
}