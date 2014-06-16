<!doctype html>
<html>
<head>

<title>Home</title>


</head>
<body>
    <content tag="header">
    <div id="homehero" style="background-color: #fff;">
    
        <div style="float: left; width: 65%;">
            <h1 style="line-height: 1.1em; font-size: 28px;">
                <span class="home-header">
                    <g:if test="${session.user != null}">
                    Welcome, ${session.user.firstName }!
                    </g:if>
                    
                    <g:elseif test="${session.user == null}">
                    Welcome, Test User!
                    </g:elseif>
                </span>
            </h1>
        </div>
        
    </div>
    </content>
    
    <div class="container home-body">
    
        <div>
            <p class="home-header-text">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.
            </p>
            <img class="home-header-img" src="/static/images/custom/red_pill_DNA.jpg">
        </div>
        
        <div id="main-body" style="clear: both">
            
            <div class="row-fluid">
	            <div class="block span4">
	                <h1 class="block-header">
	                    What is PHR
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim, quis nostrud exercitation ullamco laboris nisi:
	                    </p>
	                    
	                    <ul>
	                        <li>Blood Glucose Screening (06-03-2014)</li>
	                        <li>Blood Pressure Screening (06-03-2014)
	                        <li>bone density study (06-03-2014)</li>
	                        <li>Eye Exam (05-05-2014)</li>
	                    </ul>
	                </div>
	            </div>
	            
	            <div class="block span4">
	                <h1 class="block-header">
	                    Why should you use it?
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
	                    <br /><br />
	                    Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
	                    </p>
	                </div>
	            </div>
	            
	            <div class="block span4">
	                <h1 class="block-header">
	                    Our vision
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.
	                    <br /><br />
	                    Minim, quis nostrud exercitation ullamco nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
	                    <br /><br />
	                    Dolore eu fugiat nulla pariatur. Excepteur sinboru.
	                    </p>
	                </div>
	            </div>
	        </div>
            
            <div class="row-fluid">
	            <div class="block span12">
	                <div class="half-text-width">
		                <h1 class="block-header">
		                    How to use your PHR
		                </h1>
		                <div class="block-text" style="float: left;">
		                    <p>
		                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
		                    </p>
		                </div>
		            </div>
	                <span class="video-small">
	                    <iframe width="440" height="260" src="//www.youtube.com/embed/77r5p8IBwJk" frameborder="0" allowfullscreen></iframe>
	                </span>
	            </div>
            </div>
            
            <div class="row-fluid">
	            <div class="block span12">
	                <h1 class="block-header">
	                    Recommended Readings
	                </h1>
	                <ul class="block-text">
	                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod empor incididunt ut labore et dolore magna aliqua. Ut enim ad minim </li>
	                    <li>Quis ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</li>
	                    <li>Eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, unt in culpa qui officia deserunt mollit anim id est laborum</li>
	                </ul>  
	            </div>
	        </div>
        </div>
        
    </div>
    
</body>
</html>
