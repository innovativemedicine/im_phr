<!doctype html>
<html>
<head>

<title>Summary</title>


</head>
<body>
    <content tag="header" style="display: none;">
        <h1>Summary</h1>
    </content>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <div class="row-fluid">
                <div class="block span6">
	                <div class="half-text-width">
		                <h1 class="block-header">
		                    User Info
		                </h1>
		                <div class="block-text-18">
		                    <g:each in="${result}"> <!-- Need to wrap the variable calls with "g:each" to remove square brackets -->
                                <p>
                                    <%--${it.first_name } ${it.last_name }<br />${it.address_one }<br />${it.city }<br />Home #: ${it.telephone_number }<br />Age: ${it.birthday }<br />Birthday: ${it.birthday }--%>
                                    ${it.first_name } ${it.last_name }<br />
                                </p>                                
                            </g:each>
                        </div>
		            </div>
		            <div class="user-image-small">
		                <img src="/images/placeholder-img.png" alt="User Image" class="img-polaroid" height="200" width="200" />
		            </div>
	            </div>
	            
	            <div class="block span6">
	                <h1 class="block-header">
	                    Wellness
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
	                    <br /><br />
	                    Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
	                    </p>
	                </div>
	            </div>
            </div>
            
            
            
            <div class="row-fluid">
                <div class="block span6">
	                <h1 class="block-header">
	                    Condition
	                </h1>
	                <div class="block-text-18">
	                    <p>
	                    Gray Fullbuster<br />20 King Road<br />Edolas<br />Home #: 416-245-6585<br />Age: 18<br />Birthdate: 03-15-1993
	                    </p>
	                </div>
	            </div>
            
                <div class="block span6">
	                <h1 class="block-header">
	                    Upcoming Appointments
	                </h1>
	                <div class="block-text">
	                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                        <br /><br />
                        Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
                        </p>
	                </div>
	            </div>
	        </div>
            
            
            
            
            <div class="row-fluid">
                <div class="block span6">
	                <h1 class="block-header">
	                    Medication
	                </h1>
	                <div class="block-text-18">
	                    <p>
	                    Gray Fullbuster<br />20 King Road<br />Edolas<br />Home #: 416-245-6585<br />Age: 18<br />Birthdate: 03-15-1993
	                    </p>
	                </div>
	            </div>
	            
                <div class="block span6">
	                <h1 class="block-header">
	                    Illnesses
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
	                    <br /><br />
	                    Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
	                    </p>
	                </div>
	            </div>
	        </div>
            
            
            
            
            
            <div class="row-fluid">
                <div class="block span6">
	                <h1 class="block-header">
	                    Immunization
	                </h1>
	                <div class="block-text-18">
	                    <p>
	                    Gray Fullbuster<br />20 King Road<br />Edolas<br />Home #: 416-245-6585<br />Age: 18<br />Birthdate: 03-15-1993
	                    </p>
	                </div>
	            </div>
	            
                <div class="block span6">
	                <h1 class="block-header">
	                    Allergies
	                </h1>
	                <div class="block-text">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
	                    <br /><br />
	                    Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
	                    </p>
	                </div>
	            </div>
	        </div>
	        
	        
	    </div>
    </div>
</body>