<!doctype html>
<html>
<head>

<title>My Profile</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <g:link class="add-button btn btn-primary form-button" action="create" params='[id: "${session.user.id }", page: "physician"]' >
                Add Physician Info
            </g:link>
            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${UserContactsInstanceList.emergency_id[0] }", page: "contacts"]' >
                <g:if test="${UserContactsInstanceList != [] }">
                    Edit Contacts
                </g:if>
                <g:else>
                    Add Contacts
                </g:else>
            </g:link>
            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${UserEmploymentInstanceList.employer_id[0] }", page: "employment"]' >
                <g:if test="${UserEmploymentInstanceList != [] }">
                    Edit Employment
                </g:if>
                <g:else>
                    Add Employment
                </g:else>
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
	                    <g:fieldValue bean="${fileInstance}" field="id"/>
                            <img  src="${createLink(controller:'MyProfile', action:'showPayload', id:"${session.user.id}")}" width='300' class="profile-img" />
                        <g:fieldValue bean="${fileInstance}" field="fileName"/>
                        <br /><br />
						<g:form action="saveImage" enctype="multipart/form-data">
							<fieldset class="form">
								<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'filePayload', 'error')} ">
								<input type="file" id="filePayload" name="filePayload" />
								
                                <g:hiddenField name="userId" value="${session.user.id}"/> 
								
								</div>
							</fieldset>
							<fieldset class="buttons">
							    <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save ')}" />
							    <g:actionSubmit class="save" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
							</fieldset>
						</g:form>
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
                
                
                <g:each in="${UserPhysicianInstanceList }" var="data">
                    <g:if test="${data.size() > 0 }">
                        <div class="block span6">
                            <h1 class="block-header">
                                <!-- Physicians -->
                                ${data.occupation }
                            </h1>
                            
                            <g:link class="add-button btn btn-primary form-button" action="edit" params='[id: "${data.physician_id }", page: "physician"]' >
				                Edit Physician Info
				            </g:link>
				            
                            <div class="block-text">
                                <g:if test="${data.name != null }"><p>${data.name }</p></g:if>
                                <g:if test="${data.address_one != null }"><p>${data.address_one }</p></g:if>
                                <g:if test="${data.address_two != null }"><p>${data.address_two }</p></g:if>
                                <g:if test="${data.city != null }"><p>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</p></g:if>
                                <g:if test="${data.phone_number_one != null }"><p>${data.phone_number_one }</p></g:if>
                                <g:if test="${data.phone_number_two != null }"><p>${data.phone_number_two }</p></g:if>
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