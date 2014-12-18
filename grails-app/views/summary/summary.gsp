<!doctype html>
<html>
<head>

<title>Summary</title>


</head>
<body>

    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <div class="row-fluid">
                <div class="block span6">
                    <div class="half-text-width">
                        <h1 class="block-header">
                            User Info
                        </h1>
                        <div class="block-text">
                            <g:each in="${UserProfileInstanceList }" var="data">
                                <span>${data.first_name } <g:if test="${data.middle_name != null}">${data.middle_name } </g:if>${data.last_name }</span><br />
                                <g:if test="${data.address_one != null }"><span>${data.address_one }</span><br /></g:if>
                                <g:if test="${data.address_two != null }"><span>${data.address_two }</span><br /></g:if>
                                <g:if test="${data.city != null }"><span>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</span><br /></g:if>
                                <g:if test="${data.home_phone != null }"><span>Home #: ${data.home_phone }</span><br /></g:if>
                                <g:if test="${data.cell_phone != null }"><span>Cell #: ${data.cell_phone }</span><br /></g:if>
                                <g:if test="${data.email != null }"><span>Email: ${data.email }</span><br /></g:if>
                                <span>Birthday: ${data.birthday }</span><br />
                                <g:if test="${data.blood_type != null }"><span>Blood Type: ${data.blood_type }</span><br /></g:if>
                                <g:if test="${data.height != null }"><span>Height: ${data.height } inches</span><br /></g:if>
                                <g:if test="${data.marital_status != null }"><span>Marital Status: ${data.marital_status }</span><br /></g:if>
                                <g:if test="${data.primary_language != null }"><span>Primary Language: ${data.primary_language }</span><br /></g:if>
                                <g:if test="${data.weight != null }"><span>Weight: ${data.weight } pounds</span><br /></g:if>
                                <g:if test="${data.race != null }"><span>Race: ${data.race }</span><br /></g:if>
                            </g:each>
                        </div>
                    </div>
                    <div class="user-image-small">
                        <!--
                        <img src="/images/placeholder-img.png" alt="User Image" class="img-polaroid" height="200" width="200" />
                        -->
                        <g:fieldValue bean="${fileInstance}" field="id"/>
                            <img  src="${createLink(controller:'MyProfile', action:'showPayload', id:"${session.user.id}")}" width='300' class="profile-img" />
                        <g:fieldValue bean="${fileInstance}" field="fileName"/>
                    </div>
                </div>
	            
	            <div class="block span6">
	                <h1 class="block-header">
	                    Wellness
	                </h1>
	                <div class="block-text">
	                    <g:if test="${UserStepsInstanceList.date == 0}">
                            <g:each in="${UserStepsInstanceList }" var="data">
                                <span><strong>Most recent steps taken:</strong> ${data.steps } [${data.date }]</span><br />
                                <span><strong>Total steps:</strong> ${data.total } steps</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserPushupsInstanceList.size != 0 }">
                            <g:each in="${UserPushupsInstanceList }" var="data">
                                <span><strong>Push-ups:</strong> ${data.pushups } [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserSitupsInstanceList.size != 0 }">
                            <g:each in="${UserSitupsInstanceList }" var="data">
                                <span><strong>Sit-ups:</strong> ${data.situps } [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserSquatsInstanceList.size != 0 }">
                            <g:each in="${UserSquatsInstanceList }" var="data">
                                <span><strong>Squats:</strong> ${data.squats } [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserCaloriesInstanceList.size != 0 }">
                            <g:each in="${UserCaloriesInstanceList }" var="data">
                                <span><strong>Most recent calories:</strong> ${data.amount } calories [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserCarbohydratesInstanceList.size != 0 }">
                            <g:each in="${UserCarbohydratesInstanceList }" var="data">
                                <span><strong>Most recent carbohydrates:</strong> ${data.amount } grams [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserCholestrolInstanceList.size != 0 }">
                            <g:each in="${UserCholestrolInstanceList }" var="data">
                                <span><strong>Most recent cholestrol:</strong> ${data.amount } mg/dl [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserBloodPressureInstanceList.size != 0 }">
                            <g:each in="${UserBloodPressureInstanceList }" var="data">
                                <span><strong>Most recent blood pressure:</strong> ${data.systolic }/${data.diastolic } mm Hg [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        <g:if test="${UserBmiInstanceList.size != 0 }">
                            <g:each in="${UserBmiInstanceList }" var="data">
                                <span><strong>Most recent height:</strong> ${data.height } inches [${data.date }]</span><br />
                                <span><strong>Most recent weight:</strong> ${data.weight } lbs [${data.date }]</span><br />
                                <span><strong>Most recent BMI:</strong> ${data.bmi } kg/m2 [${data.date }]</span><br />
                            </g:each>
                        </g:if>
                        
	                </div>
	            </div>
            </div>
            
            
            
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        Current Medications
                    </h1>
                    <div class="block-text">
                        <g:if test="${UserMedicationsInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserMedicationsInstanceList }" var="data">
                                    <li>${data.name } ( ${data.dose } ) - ${data.form }, ${data.frequency }</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
                
                <div class="block span6">
                    <h1 class="block-header">
                        Immunization
                    </h1>
                    <div class="block-text">
                        <g:if test="${UserImmunizationsInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserImmunizationsInstanceList }" var="data">
                                <li>${data.name } [${data.date }]</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
	        </div>
            
            
            
            
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        Current Conditions
                    </h1>
                    <div class="block-text">
                        <g:if test="${UserConditionsInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserConditionsInstanceList }" var="data">
                                    <li>${data.name }</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
	            
                <div class="block span6">
	                <h1 class="block-header">
	                    Allergies
	                </h1>
	                <div class="block-text">
	                    <g:if test="${UserAllergiesInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
	                            <g:each in="${UserAllergiesInstanceList }" var="data">
	                                <li>${data.name } ( ${data.reaction } ) - ${data.severity }</li>
	                            </g:each>
	                        </ul>
                        </g:else>
	                </div>
	            </div>
	            
            </div>
            
            
            
            
            
            <div class="row-fluid">
                <g:each in="${UserEmploymentInstanceList }" var="data">
                    <g:if test="${data.size() > 0 }">
                        <div class="block span6">
                            <h1 class="block-header">
                                Employment Info
                            </h1>
                            <div class="block-text">
                                <g:if test="${data.occupation != null }"><span>Occupation: ${data.occupation }</span><br /></g:if>
                                <g:if test="${data.name != null }"><span>Company: ${data.name }</span><br /></g:if>
                                <g:if test="${data.address_one != null }"><span>${data.address_one }</span><br /></g:if>
                                <g:if test="${data.address_two != null }"><span>${data.address_two }</span><br /></g:if>
                                <g:if test="${data.city != null }"><span>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</span><br /></g:if>
                                <g:if test="${data.phone_number != null }"><span>${data.phone_number }</span><br /></g:if>
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
                                <g:if test="${data.name != null }"><span>${data.name }</span><br /></g:if>
                                <g:if test="${data.address_one != null }"><span>${data.address_one }</span><br /></g:if>
                                <g:if test="${data.address_two != null }"><span>${data.address_two }</span><br /></g:if>
                                <g:if test="${data.city != null }"><span>${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }</span><br /></g:if>
                                <g:if test="${data.phone_number_one != null }"><span>${data.phone_number_one }</span><br /></g:if>
                                <g:if test="${data.phone_number_two != null }"><span>${data.phone_number_two }</span><br /></g:if>
                                <g:if test="${data.relationship != null }"><span>Relationship: ${data.relationship }</span><br /></g:if>
                            </div>
                        </div>
                    </g:if>
                </g:each>
            </div>
            
	        
	    </div>
    </div>
</body>