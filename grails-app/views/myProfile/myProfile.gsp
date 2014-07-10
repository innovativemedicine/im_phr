<!doctype html>
<html>
<head>

<title>My Profile</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            
            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${session.user.id }", page: "contacts"]' >
                Edit Contacts
            </g:link>
            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${session.user.id }", page: "employment"]' >
                Edit Employment
            </g:link>
            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${session.user.id }", page: "profile"]' >
                Edit Profile
            </g:link>
            
            
            <h1>My Profile</h1>
            <div class="row-fluid">
                <div class="block span6">
	                <div class="half-text-width">
		                <h1 class="block-header">
		                    User Info
		                </h1>
		                <div class="block-text">
		                    <g:each in="${UserProfileInstanceList }" var="data">
                                <p>${data.first_name } <g:if test="${data.middle_name != null}">${data.middle_name } </g:if>${data.last_name }</p>
                                <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
                                <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
                                <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
                                <g:if test="${data.home_phone != null }"><p>Home #: ${data.home_phone }</p></g:if>
                                <g:if test="${data.cell_phone != null }"><p>Cell #: ${data.cell_phone }</p></g:if>
                                <g:if test="${data.email != null }"><p>Email: ${data.email }</p></g:if>
                                <p>Gender: ${data.gender }</p>
                                <p>Birthday: ${data.birthday }</p>
                                <g:if test="${data.blood_type != null }"><p>Blood Type: ${data.blood_type }</p></g:if>
                                <g:if test="${data.height != null }"><p>Height: ${data.height } inches</p></g:if>
                                <g:if test="${data.marital_status != null }"><p>Marital Status: ${data.marital_status }</p></g:if>
                                <g:if test="${data.primary_language != null }"><p>Primary Language: ${data.primary_language }</p></g:if>
                                <g:if test="${data.weight != null }"><p>Weight: ${data.weight } pounds</p></g:if>
                                <g:if test="${data.race != null }"><p>Race: ${data.race }</p></g:if>
                            </g:each>
		                </div>
		            </div>
		            <div class="user-image-small">
		                <img src="/images/placeholder-img.png" alt="User Image" class="img-polaroid" height="200" width="200" />
		            </div>
	            </div>
	            
	            
	            <g:each in="${UserEmploymentInstanceList }" var="data">
		            <g:if test="${data.size() > 0 }">
			            <div class="block span6">
			                <h1 class="block-header">
			                    Employment Info
			                </h1>
			                <div class="block-text">
			                    <g:if test="${data.occupation != null }"><p>Occupation: ${data.occupation }</p></g:if>
			                    <g:if test="${data.name != null }"><p>Company: ${data.name }</p></g:if>
			                    <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
			                    <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
			                    <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
			                    <g:if test="${data.phone_number != null }"><p>${data.phone_number }</p></g:if>
			                </div>
			            </div>
		            </g:if>
	            </g:each>
	            
	            <g:each in="${UserContactsInstanceList }" var="data">
                    <g:if test="${data.size() > 0 }">
                        <div class="block span6">
                            <h1 class="block-header">
                                Emergency Contacts
                            </h1>
                            <div class="block-text">
                                <g:if test="${data.name != null }"><p>${data.name }</p></g:if>
                                <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
                                <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
                                <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
                                <g:if test="${data.phone_number_one != null }"><p>${data.phone_number_one }</p></g:if>
                                <g:if test="${data.phone_number_two != null }"><p>${data.phone_number_two }</p></g:if>
                                <g:if test="${data.relationship != null }"><p>Relationship: ${data.relationship }</p></g:if>
                            </div>
                        </div>
                    </g:if>
                </g:each>
            </div>
            
            
            <!-- 
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        
                    </h1>
                    <div class="block-text">
                        
                    </div>
                </div>
                
                <div class="block span6">
	                <h1 class="block-header">
	                    
	                </h1>
	                <div class="block-text">
	                    
	                </div>
	            </div>
	        </div>
            -->
            
            
	        
	    </div>
    </div>
</body>