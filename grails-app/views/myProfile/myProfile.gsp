<!doctype html>
<html>
<head>

<title>My Profile</title>


</head>
<body>

	<div class="container">
		<div class="row-fluid">
			<div class="span3">
				<div class="block span12s" style="margin-top: 0px;">

					<g:if test="${UserProfileInstanceList}">
						<g:link class="btn btn-primary wellness-button" action="edit"
							params='[id: "${UserProfileInstanceList.profile_id[0] }", page: "profile"]'>
		                Edit</g:link>
					</g:if>
					<g:else>
						<g:link class="add-button btn btn-primary form-button" action="create"
							params='[id: "${session.user.id }", page: "profile"]'>Add</g:link>
					</g:else>

					<h1 class="block-header">User Info</h1>

					<g:fieldValue bean="${fileInstance}" field="id" />
					<img src="${createLink(controller:'MyProfile', action:'showPayload', id:"${session.user.id}")}" style="height: 98px"
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
							<g:submitButton name="create" class="btn btn-mini"
								value="${message(code: 'default.button.save.label', default: 'Save ')}" />
							<g:actionSubmit class="btn btn-mini" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
						</fieldset>
					</g:form>

					<div class="block-text">
						<g:each in="${UserProfileInstanceList }" var="data">
							<h4>
								${data.first_name }
								<g:if test="${data.middle_name != null}">
									${data.middle_name }
								</g:if>
								${data.last_name }
							</h4>
							<g:if test="${data.address_one}">
								<span><b>Address:</b></span>
								<br>
							</g:if>
							<g:if test="${data.address_one}">
								<span> ${data.address_one }
								</span>
								<br>
							</g:if>
							<g:if test="${data.address_two}">
								<span> ${data.address_two }
								</span>
								<br>
							</g:if>
							<g:if test="${data.city}">
								<span> ${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }
								</span>
								<br>
							</g:if>
							<g:if test="${data.home_phone}">
								<span><b>Home #:</b> ${data.home_phone }</span>
								<br>
							</g:if>
							<g:if test="${data.cell_phone}">
								<span><b>Cell #:</b> ${data.cell_phone }</span>
								<br>
							</g:if>
							<g:if test="${data.email}">
								<span><b>Email:</b> ${data.email }</span>
								<br>
							</g:if>
							<span><b>Gender:</b> ${data.gender }</span>
							<br>
							<span><b>Birthday:</b> ${data.birthday }</span>
							<br>
							<g:if test="${data.blood_type}">
								<span><b>Blood:</b> ${data.blood_type }</span>
								<br>
							</g:if>
							<g:if test="${data.height}">
								<span><b>Height:</b> ${data.height } inches</span>
								<br>
							</g:if>
							<g:if test="${data.marital_status}">
								<span><b>Marital Status:</b> ${data.marital_status }</span>
								<br>
							</g:if>
							<g:if test="${data.primary_language}">
								<span><b>Primary Language:</b> ${data.primary_language }</span>
								<br>
							</g:if>
							<g:if test="${data.weight}">
								<span><b>Weight:</b> ${data.weight } pounds</span>
								<br>
							</g:if>
							<g:if test="${data.race}">
								<span><b>Race:</b> ${data.race }</span>
								<br>
							</g:if>
						</g:each>
					</div>
				</div>
			</div>

			<div class="span9">
				<div class="row-fluid">


					<div class="block span6" style="margin-top: 0px; height: 270px;">

						<g:if test="${UserEmploymentInstanceList}">
							<g:link class="wellness-button btn btn-primary" action="edit"
								params='[id: "${UserEmploymentInstanceList.employer_id[0] }", page: "employment"]'>
			                    Edit
			                </g:link>
						</g:if>
						<g:else>
							<g:link class="wellness-button btn btn-primary" action="create"
								params='[id: "${session.user.id }", page: "employment"]'>
			                    Add
			                </g:link>
						</g:else>

						<h1 class="block-header">Employment Info</h1>

						<g:each in="${UserEmploymentInstanceList }" var="data">
							<g:if test="${data.size() > 0 }">

								<div class="block-text">
									<g:if test="${data.name}">
										<span><b>Company:</b> ${data.name }</span>
										<br>
									</g:if>
									<g:if test="${data.occupation}">
										<span><b>Occupation:</b> ${data.occupation }</span>
										<br>
									</g:if>
									<g:if test="${data.phone_number}">
										<span><b>Phone:</b> ${data.phone_number }</span>
										<br>
									</g:if>
									<g:if test="${data.address_one}">
										<span><b>Address:</b></span>
										<br>
									</g:if>
									<g:if test="${data.address_one}">
										<span> ${data.address_one }
										</span>
										<br>
									</g:if>
									<g:if test="${data.address_two}">
										<span> ${data.address_two }
										</span>
										<br>
									</g:if>
									<g:if test="${data.city}">
										<span> ${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }
										</span>
										<br>
									</g:if>
								</div>
							</g:if>
						</g:each>

					</div>

					<div class="block span6" style="margin-top: 0px; height: 270px;">

						<g:if test="${UserContactsInstanceList}">
							<g:link class="wellness-button btn btn-primary" action="edit"
								params='[id: "${UserContactsInstanceList.emergency_id[0] }", page: "contacts"]'>
                    Edit
                </g:link>
						</g:if>
						<g:else>
							<g:link class="wellness-button btn btn-primary" action="create" params='[id: "${session.user.id }", page: "contacts"]'>
                    Add
                </g:link>
						</g:else>

						<h1 class="block-header">Emergency Contacts</h1>

						<g:each in="${UserContactsInstanceList }" var="data">
							<g:if test="${data.size() > 0 }">

								<div class="block-text">
									<g:if test="${data.name}">
										<span><b>Contact Name: </b> ${data.name }</span>
										<br>
									</g:if>
									<g:if test="${data.relationship}">
										<span><b>Relationship: </b> ${data.relationship }</span>
										<br>
									</g:if>
									<g:if test="${data.phone_number_one}">
										<span><b>Phone #1: </b> ${data.phone_number_one }</span>
										<br>
									</g:if>
									<g:if test="${data.phone_number_two}">
										<span><b>Phone #2: </b> ${data.phone_number_two }</span>
										<br>
									</g:if>
									<g:if test="${data.address_one}">
										<span><b>Address:</b></span>
										<br>
									</g:if>
									<g:if test="${data.address_one}">
										<span> ${data.address_one }
										</span>
										<br>
									</g:if>
									<g:if test="${data.address_two}">
										<span> ${data.address_two }
										</span>
										<br>
									</g:if>
									<g:if test="${data.city}">
										<span> ${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }
										</span>
										<br>
									</g:if>

								</div>
							</g:if>
						</g:each>

					</div>
				</div>

				<div class="row-fluid">

					<div class="block span12" style="height: 320px;">

						<g:link class="wellness-button btn btn-primary" action="create" params='[id: "${session.user.id }", page: "physician"]'>
                Add
            </g:link>


						<h1 class="block-header">Physicians</h1>

						<div class="physician-list" style="max-height: 235px; overflow: auto;">
							<g:each in="${UserPhysicianInstanceList }" var="data">
								<g:if test="${data.size() > 0 }">
									<hr>

									<g:link class="btn btn-primary wellness-button" action="edit"
										params='[id: "${data.physician_id }", page: "physician"]'>
                                Edit
                            </g:link>

									<h4>
										${data.occupation }
									</h4>


									<div class="block-text">
										<g:if test="${data.name}">
											<span> ${data.name }
											</span>
											<br>
										</g:if>
										<g:if test="${data.phone_number_one}">
											<span><b>Phone #1: </b> ${data.phone_number_one }</span>
											<br>
										</g:if>
										<g:if test="${data.phone_number_two}">
											<span><b>Phone #2: </b> ${data.phone_number_two }</span>
											<br>
										</g:if>
										<g:if test="${data.address_one}">
											<span><b>Address: </b></span>
											<br>
										</g:if>
										<g:if test="${data.address_one}">
											<span> ${data.address_one }
											</span>
											<br>
										</g:if>
										<g:if test="${data.address_two}">
											<span> ${data.address_two }
											</span>
											<br>
										</g:if>
										<g:if test="${data.city}">
											<span> ${data.city }, ${data.province }, ${data.country }&nbsp;&nbsp;${data.postal_code }
											</span>
											<br>
										</g:if>

									</div>
								</g:if>
							</g:each>
							<hr>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>