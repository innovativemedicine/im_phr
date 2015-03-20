<!doctype html>
<html>
<head>

<title>Patient Summary</title>

</head>
<body>

	<div class="container home-body">

		<div class="row-fluid">
			<div class="block span12" style="height: 80px; margin-top: 0px">
				<g:form class="form-inline" action="show">
					<label>Patient:</label>
					<g:textField name="firstName" value="${UserProfileInstance?.firstName}" class="input-medium" placeholder="First Name" />
					<g:textField name="lastName" value="${UserProfileInstance?.lastName}" class="input-medium" placeholder="Last Name" />

					<g:submitButton name="show" value="Search" class="btn" />
					
					Use: Nderoo Wonger
					
				</g:form>

			</div>
		</div>

		<div class="patient_result">
			<div class="row-fluid">
				<div class="block span3" style="height: 480px;">

					<ul class="nav nav-pills nav-stacked">
						<li class="active">
							<a href="#profile" data-toggle="tab">Profile</a>
						</li>
						<li>
							<a href="#cal" data-toggle="tab">Calories</a>
						</li>
						<li>
							<a href="#carb" data-toggle="tab">Carbs</a>
						</li>
						<li>
							<a href="#chol" data-toggle="tab">Cholesterol</a>
						</li>
						<li>
							<a href="#bp" data-toggle="tab">Blood Pressure</a>
						</li>
						<li>
							<a href="#bmi" data-toggle="tab">Height & Weight</a>
						</li>
						<li>
							<a href="#meds" data-toggle="tab">Medications</a>
						</li>
						<li>
							<a href="#imms" data-toggle="tab">Immunizations</a>
						</li>
						<li>
							<a href="#cons" data-toggle="tab">Conditions</a>
						</li>
						<li>
							<a href="#alls" data-toggle="tab">Allergies</a>
						</li>
					</ul>
				</div>

				<div class="block span9" style="height: 480px; overflow-y: auto;">
					<div class="tab-content" style="padding: 0px;">
						<div class="tab-pane active" id="profile">
						
							<h3 style="margin-top: 0px;">Patient Info</h3>

							<g:if test="${UserProfileInstance}">
								
								<g:if test="${UserProfileInstance.addressOne}">
									<span><b>Address: </b></span>
									<br>
									<span> ${UserProfileInstance.addressOne }
									</span>
									<br>
								</g:if>
								<g:if test="${UserProfileInstance.city}">
									<span> ${UserProfileInstance.city }, ${UserProfileInstance.province }
									</span>
									<br>
									<span> ${UserProfileInstance.country }&nbsp;&nbsp;${UserProfileInstance.postalCode }
									</span>
									<br>
								</g:if>
								<g:if test="${UserProfileInstance.homePhone}">
									<span><b>Home #:</b> ${UserProfileInstance.homePhone }</span>
									<br>
								</g:if>
								<g:if test="${UserProfileInstance.cellPhone}">
									<span><b>Cell #:</b> ${UserProfileInstance.cellPhone }</span>
									<br>
								</g:if>
								<g:if test="${UserProfileInstance.email}">
									<span><b>Email:</b> ${UserProfileInstance.email }</span>
									<br>
								</g:if>
								<span><b>Birthday:</b> <g:formatDate format="yyyy-MM-dd" date="${UserProfileInstance.birthday}"></g:formatDate></span>
								<br />
								<g:if test="${UserProfileInstance.bloodType}">
									<span><b>Blood Type:</b> ${UserProfileInstance.bloodType }</span>
									<br />
								</g:if>
								<g:if test="${UserProfileInstance.maritalStatus}">
									<span><b>Marital Status:</b> ${UserProfileInstance.maritalStatus }</span>
									<br />
								</g:if>
								<g:if test="${UserProfileInstance.primaryLanguage}">
									<span><b>Primary Language:</b> ${UserProfileInstance.primaryLanguage }</span>
									<br />
								</g:if>
								<g:if test="${UserProfileInstance.race}">
									<span><b>Race:</b> ${UserProfileInstance.race }</span>
									<br />
								</g:if>
							</g:if>
							<g:if test="${UserEmploymentInstanceList}">
								<g:each in="${UserEmploymentInstanceList}" var="data">
									<h3>Employment Info</h3>
									<div class="block-text">
										<g:if test="${data.occupation}">
											<span><b>Occupation:</b> ${data.occupation}</span>
											<br />
										</g:if>
										<g:if test="${data.name}">
											<span><b>Company:</b> ${data.name}</span>
											<br />
										</g:if>
										<g:if test="${data.phoneNumber}">
											<span><b>Phone:</b> ${data.phoneNumber} </span>
											<br />
										</g:if>
									</div>
								</g:each>
							</g:if>

							<g:if test="${UserContactsInstanceList}">

								<g:each in="${UserContactsInstanceList}" var="data">
									<h3>Emergency Contacts</h3>
									<div class="block-text">
										<g:if test="${data.name}">
											<span><b>Name:</b> ${data.name} </span>
											<br />
										</g:if>
										<g:if test="${data.phoneNumberOne}">
											<span><b>Phone:</b> ${data.phoneNumberOne} </span>
											<br />
										</g:if>
										<g:if test="${data.relationship}">
											<span><b>Relationship:</b> ${data.relationship}</span>
											<br />
										</g:if>
									</div>
								</g:each>
							</g:if>

						</div>


						<div class="tab-pane" id="cal">

							<h3 style="margin-top: 0px;">Calories</h3>
							<g:if test="${UserCaloriesInstanceList}">
								<g:each in="${UserCaloriesInstanceList }" var="data">
									<span><b><g:formatDate format="dd-MM-yyyy" date="${data.calDate}" />:</b> ${data.amount} calories</span>
									<br>
								</g:each>
							</g:if>

						</div>

						<div class="tab-pane" id="carb">

							<h3 style="margin-top: 0px;">Carbohydrates</h3>

							<g:if test="${UserCarbohydratesInstanceList}">
								<g:each in="${UserCarbohydratesInstanceList }" var="data">
									<span><b><g:formatDate format="dd-MM-yyyy" date="${data.carbDate}" />:</b> ${data.amount} grams</span>
									<br>
								</g:each>
							</g:if>
						</div>

						<div class="tab-pane" id="chol">
							<h3 style="margin-top: 0px;">Cholesterol</h3>

							<g:if test="${UserCholestrolInstanceList}">
								<g:each in="${UserCholestrolInstanceList }" var="data">
									<span><b><g:formatDate format="dd-MM-yyyy" date="${data.cholDate}" />:</b> ${data.amount} mg/dl</span>
									<br />
								</g:each>
							</g:if>
						</div>

						<div class="tab-pane" id="bp">
							<h3 style="margin-top: 0px;">Blood Pressure</h3>

							<g:if test="${UserBloodPressureInstanceList}">
								<g:each in="${UserBloodPressureInstanceList }" var="data">
									<span><b><g:formatDate format="dd-MM-yyyy" date="${data.bpDate}" />:</b> ${data.systolic}/${data.diastolic} mm
										Hg</span>
									<br />
								</g:each>
							</g:if>
						</div>
						<div class="tab-pane" id="bmi">

							<div class="row-fluid">

								<g:if test="${UserBmiInstanceList}">

									<div class="span4">

										<h3 style="margin-top: 0px;">BMI</h3>
										<g:each in="${UserBmiInstanceList}" var="data">
											<span><b><g:formatDate format="dd-MM-yyyy" date="${data.bmiDate}" />:</b> ${data.bmi} kg/m2</span>
											<br>
										</g:each>
									</div>
									<div class="span4">
										<h3 style="margin-top: 0px;">Height</h3>
										<g:each in="${UserBmiInstanceList}" var="data">
											<span> ${data.height} inches
											</span>
											<br>
										</g:each>

									</div>
									<div class="span4">
										<h3 style="margin-top: 0px;">Weight</h3>
										<g:each in="${UserBmiInstanceList}" var="data">
											<span> ${data.weight} lbs
											</span>
											<br>
										</g:each>
									</div>
								</g:if>
							</div>
						</div>

						<div class="tab-pane" id="meds">
							<h3 style="margin-top: 0px;">Medications</h3>
							<div class="block-text">
								<g:if test="${UserMedicationsInstanceList}">
									<ul>
										<g:each in="${UserMedicationsInstanceList}" var="data">
											<li style="list-style-type: circle;">
												${data.name}
												(
												${data.dose}
												) -
												${data.form},
												${data.frequency}
											</li>
										</g:each>
									</ul>

								</g:if>
								<g:else>
									<b>None</b>
								</g:else>
							</div>
						</div>
						<div class="tab-pane" id="imms">
							<h3 style="margin-top: 0px;">Immunization</h3>
							<div class="block-text">
								<g:if test="${UserImmunizationsInstanceList}">
									<ul>
										<g:each in="${UserImmunizationsInstanceList}" var="data">
											<li style="list-style-type: circle;">
												${data.name}
												[${data.date}]
											</li>
										</g:each>
									</ul>
								</g:if>
								<g:else>
									<b>None</b>
								</g:else>
							</div>
						</div>


						<div class="tab-pane" id="cons">
							<h3 style="margin-top: 0px;">Conditions</h3>
							<div class="block-text">
								<g:if test="${UserConditionsInstanceList}">
									<ul>
										<g:each in="${UserConditionsInstanceList}" var="data">
											<li style="list-style-type: circle;">
												${data.name}
											</li>
										</g:each>
									</ul>
								</g:if>
								<g:else>
									<b>None</b>

								</g:else>
							</div>
						</div>
						<div class="tab-pane" id="alls">
							<h3 style="margin-top: 0px;">Allergies</h3>
							<div class="block-text">
								<g:if test="${UserAllergiesInstanceList}">
									<ul>
										<g:each in="${UserAllergiesInstanceList}" var="data">
											<li style="list-style-type: circle;">
												${data.name}
												(
												${data.reaction}
												) -
												${data.severity}
											</li>
										</g:each>
									</ul>
								</g:if>
								<g:else>
									<b>None</b>

								</g:else>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>
	</div>
</body>