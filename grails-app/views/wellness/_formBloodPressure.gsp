

<div class="block span6">

	<a id="wellness-button" class="wellness-button btn btn-primary">Add</a>

	<h1 class="block-header">Blood Pressure</h1>
	<div class="block-text" style="height: 90px; position: relative">
		<div class="wellness-info">
			<ul class="block-text">
				<g:if test="${UserBloodPressureInstanceList.size == 0 }">
					<li>
						<h4>None</h4>
					</li>
				</g:if>
				<g:else>
					<g:each in="${UserBloodPressureInstanceList }" var="data">
						<li>
							<span> ${data.systolic }/${data.diastolic } mm Hg
							</span> <span class="date-block">[ <g:formatDate format="dd-MM-yyyy" date="${data.bpDate }" /> ]
							</span>
						</li>
					</g:each>
				</g:else>
			</ul>
		</div>

		<g:form action="saveBloodPressure" class="form-hidden form-horizontal">
			<div id="bloodpressure_add" class="add-section"
				style="position: absolute; top: 0; left: 0; display: none; z-index: 10; width: 100%; background-color: #EEF4FF;">

				
				<div class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'bpDate', 'error')} required">
					<label class="control-label" for="date">
						<g:message code="project.date.label" default="Date" />
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
					<calendar:datePicker name="bpDate" value="${userBloodPressureInstance?.bpDate}" dateFormat="%d-%m-%Y"
						defaultValue="${new Date()}" />
					</div>
				</div>
				
				<div class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'systolic', 'error')} required">
					<label class="control-label" for="systolic">
						Systolic / Diastolic
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
					<g:textField class="span3" name="systolic" value="${userBloodPressureInstance?.systolic}" /> /
					<g:textField class="span3" name="diastolic" value="${userBloodPressureInstance?.diastolic}" />
										<g:submitButton name="create" class="btn save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
					
					</div>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'user', 'error')} required hidden">
					<label for="user">
						<g:message code="project.user.label" default="User" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
						value="${userBloodPressureInstance?.user?.id}" class="many-to-one" />
				</div>

			</div>

		</g:form>
	</div>
</div>








