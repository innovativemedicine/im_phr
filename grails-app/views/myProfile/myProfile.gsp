<!doctype html>
<html>
<head>

<title>My Profile</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
 
         
            <div class="row-fluid">
                <div class="block span3">

		<g:if test="${UserProfileInstanceList}">
							<g:link class="btn btn-primary wellness-button" action="edit"
								params='[id: "${UserProfileInstanceList.profile_id[0] }", page: "profile"]'>
		                Edit
		            </g:link>
						</g:if>
						<g:else>
							<g:link class="add-button btn btn-primary form-button" action="create"
								params='[id: "${session.user.id }", page: "profile"]'>
		                Add
		            </g:link>
						</g:else>
						
					<h1 class="block-header">User Info</h1>
				
					<g:fieldValue bean="${fileInstance}" field="id" />
					<img src="${createLink(controller:'MyProfile', action:'showPayload', id:"${session.user.id}")}" width='300'
						class="profile-img" />
					<g:fieldValue bean="${fileInstance}" field="fileName" />
					<br /> <br />
					<g:form action="saveImage" enctype="multipart/form-data">
						<fieldset class="form">
							<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'filePayload', 'error')} ">
								<input type="file" id="filePayload" name="filePayload" />

								<g:hiddenField name="userId" value="${session.user.id}" />

							</div>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save ')}" />
							<g:actionSubmit class="save" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
						</fieldset>
					</g:form>

					<div class="block-text">
		                    <g:each in="${UserProfileInstanceList }" var="data">
                                </span></br>${data.first_name } <g:if test="${data.middle_name != null}">${data.middle_name } </g:if>${data.last_name }</span>
                                <g:if test="${data.address_one != null }"></span></br>${data.address_one }</span></g:if>
                                <g:if test="${data.address_two != null }"></span></br>${data.address_two }</span></g:if>
                                <g:if test="${data.city != null }"></span></br>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</span></g:if>
                                <g:if test="${data.home_phone != null }"></span></br>Home #: ${data.home_phone }</span></g:if>
                                <g:if test="${data.cell_phone != null }"></span></br>Cell #: ${data.cell_phone }</span></g:if>
                                <g:if test="${data.email != null }"></span></br>Email: ${data.email }</span></g:if>
                                </span></br>Gender: ${data.gender }</span>
                                </span></br>Birthday: ${data.birthday }</span>
                                <g:if test="${data.blood_type != null }"></span></br>Blood Type: ${data.blood_type }</span></g:if>
                                <g:if test="${data.height != null }"></span></br>Height: ${data.height } inches</span></g:if>
                                <g:if test="${data.marital_status != null }"></span></br>Marital Status: ${data.marital_status }</span></g:if>
                                <g:if test="${data.primary_language != null }"></span></br>Primary Language: ${data.primary_language }</span></g:if>
                                <g:if test="${data.weight != null }"></span></br>Weight: ${data.weight } pounds</span></g:if>
                                <g:if test="${data.race != null }"></span></br>Race: ${data.race }</span></g:if>
                            </g:each>
		                </div>
		            
		            
		      
	                 
					</div>
	          
	            
	            

			            <div class="block span9">
			            
            
            <g:if test="${UserEmploymentInstanceList}">
                <g:link class="wellness-button btn btn-primary" action="edit" params='[id: "${UserEmploymentInstanceList.employer_id[0] }", page: "employment"]' >
                    Edit
                </g:link>
            </g:if>
            <g:else>
                <g:link class="wellness-button btn btn-primary" action="create" params='[id: "${session.user.id }", page: "employment"]' >
                    Add
                </g:link>
            </g:else>
            
            
			                <h1 class="block-header">
			                    Employment Info
			                </h1>
			                
			    <g:each in="${UserEmploymentInstanceList }" var="data">
		            <g:if test="${data.size() > 0 }">
		            
			                <div class="block-text">
			                    <g:if test="${data.occupation != null }"><p>Occupation: ${data.occupation }</p></g:if>
			                    <g:if test="${data.name != null }"><p>Company: ${data.name }</p></g:if>
			                    <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
			                    <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
			                    <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
			                    <g:if test="${data.phone_number != null }"><p>${data.phone_number }</p></g:if>
			                </div>
		            </g:if>
	            </g:each>
	            
	    			            </div>
	    
                        <div class="block span9">
                        
                                    <g:if test="${UserContactsInstanceList}">
                <g:link class="wellness-button btn btn-primary" action="edit" params='[id: "${UserContactsInstanceList.emergency_id[0] }", page: "contacts"]' >
                    Edit
                </g:link>
            </g:if>
            <g:else>
                <g:link class="wellness-button btn btn-primary" action="create" params='[id: "${session.user.id }", page: "contacts"]' >
                    Add
                </g:link>
            </g:else>
            
                            <h1 class="block-header">
                                Emergency Contacts
                            </h1>
                            
              	<g:each in="${UserContactsInstanceList }" var="data">
                    <g:if test="${data.size() > 0 }">
                    
                            <div class="block-text">
                                <g:if test="${data.name != null }"><p>${data.name }</p></g:if>
                                <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
                                <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
                                <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
                                <g:if test="${data.phone_number_one != null }"><p>${data.phone_number_one }</p></g:if>
                                <g:if test="${data.phone_number_two != null }"><p>${data.phone_number_two }</p></g:if>
                                <g:if test="${data.relationship != null }"><p>Relationship: ${data.relationship }</p></g:if>
                            </div>
                    </g:if>
                </g:each>
                
            </div>
        
                <div class="block span9">
                
                           <g:link class="wellness-button btn btn-primary" action="create" params='[id: "${session.user.id }", page: "physician"]' >
                Add
            </g:link>
            
                
                	<h1 class="block-header">Physicians</h1>
                            
                <g:each in="${UserPhysicianInstanceList }" var="data">
                    <g:if test="${data.size() > 0 }">
                    					<hr>
                    
                                             
                            <g:link class="btn btn-primary wellness-button" action="edit" params='[id: "${data.physician_id }", page: "physician"]' >
                                Edit
                            </g:link>
                            
                    		<h1>
                                <!-- Physicians -->
                                ${data.occupation }
                            </h1>
   
                            
                            <div class="block-text">
                                <g:if test="${data.name != null }"><p>${data.name }</p></g:if>
                                <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
                                <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
                                <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
                                <g:if test="${data.phone_number_one != null }"><p>${data.phone_number_one }</p></g:if>
                                <g:if test="${data.phone_number_two != null }"><p>${data.phone_number_two }</p></g:if>
                            </div>
                    </g:if>
                </g:each>
                                        </div>
                
    
	        
	    </div>
    </div>
</body>