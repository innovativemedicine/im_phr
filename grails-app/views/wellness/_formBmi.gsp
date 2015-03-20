
<div class="block span12" style="margin-top: 0px;">

	<div class="span12">

		<a id="wellness-button" class="wellness-button btn btn-primary">Add</a>

		<h1 class="block-header span4" style="margin-left: 0px;">
			BMI&nbsp; <span id="bmi-tooltip" type="button" class="pointer" data-toggle="tooltip" data-placement="right"
				title="Body Mass Index - A relative measure of your mass and height. It is used to assess weight categories to check if it could lead to health problems.
        BMI Categories: 
		Underweight = <18.5
		Normal weight = 18.5–24.9 
		Overweight = 25–29.9 
		Obesity = BMI of 30 or greater
        "><i
				class="icon-question-sign"></i></span>
		</h1>
		<h1 class="block-header span4" style="margin-left: 0px;">Weight</h1>

		<h1 class="block-header" style="margin-left: 0px;">Height</h1>
		<div class="block-text" style="height: 85px; position: relative"">
			<div class="wellness-info">

				<ul class="block-text span3" style="margin-left: 25px;">
					<g:if test="${UserBmiInstanceList.size == 0 }">
						<li>
							<h4>None</h4>
						</li>
					</g:if>
					<g:else>
						<g:each in="${UserBmiInstanceList }" var="data">
							<li>
								<span class="value-block"> ${data.bmi } <%--							</span> <span class="date-block" style="margin-right: 0px;">[ <g:formatDate format="dd-MM-yyyy" date="${data.bmiDate }" /> ]--%>
								</span>
							</li>
						</g:each>
					</g:else>
				</ul>

				<ul class="block-text  span4" style="margin-left: 9%">
					<g:if test="${UserBmiInstanceList.size == 0 }">
						<li>
							<h4>None</h4>
						</li>
					</g:if>
					<g:else>
						<g:each in="${UserBmiInstanceList }" var="data">
							<li>
								<span class="value-block"> ${data.weight } lbs <%--							</span> <span class="date-block">[ <g:formatDate format="dd-MM-yyyy" date="${data.bmiDate }" /> ]--%>
								</span>
							</li>
						</g:each>
					</g:else>
				</ul>

				<ul class="block-text">
					<g:if test="${UserBmiInstanceList.size == 0 }">
						<li>
							<h4>None</h4>
						</li>
					</g:if>
					<g:else>
						<g:each in="${UserBmiInstanceList }" var="data">
							<li>
								<span class="value-block"> ${data.height } in
								</span> <span class="date-block">[ <g:formatDate format="dd-MM-yyyy" date="${data.bmiDate }" /> ]
								</span>
							</li>
						</g:each>
					</g:else>
				</ul>
			</div>

			<g:form action="saveBmi" class="form-hidden form-horizontal">
				<div id="bmi_add" class="add-section"
					style="position: absolute; top: 0; left: 0; display: none; z-index: 10; width: 100%; background-color: #EEF4FF;">

					<div
						class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userBmiInstance, field: 'weight', 'error')} required" style="margin-left:27%">
						<label class="control-label" for="weight">
							<g:message code="userConditions.weight.label" default="Weight (lbs)" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField class="span2" name="weight" value="${userBmiInstance?.weight}" style="margin-right:25%"/>

							<g:message code="userConditions.height.label" default="Height (inches)" />
							<span class="required-indicator">*</span>
							
							<g:textField class="span2" name="height" value="${userBmiInstance?.height}" />

						</div>
					</div>
					
						<div class="control-group control-group-narrow 	fieldcontain ${hasErrors(bean: userBmiInstance, field: 'bmiDate', 'error')} required" style="margin-left:27%">
						<label class="control-label" for="date">
							<g:message code="project.date.label" default="Date" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<calendar:datePicker name="bmiDate" value="${userBmiInstance?.bmiDate}" dateFormat="%d-%m-%Y"
							defaultValue="${new Date()}"/>
							<g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Save')}"  style="margin-left:23%"/>
							
						</div>

					</div>

					<div class="fieldcontain ${hasErrors(bean: userBmiInstance, field: 'user', 'error')} required hidden">
						<label for="user">
							<g:message code="project.user.label" default="User" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
							value="${userBmiInstance?.user?.id}" class="many-to-one" />
					</div>
				</div>
			</g:form>

		</div>
	</div>
</div>