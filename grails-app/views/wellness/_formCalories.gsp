

<div class="block span6">

	<a id="wellness-button" class="wellness-button btn btn-primary">Add</a>

	<h1 class="block-header">Calories</h1>
	<div class="block-text" style="height: 90px; position: relative">
		<div class="wellness-info">
			<ul class="block-text">
				<g:if test="${UserCaloriesInstanceList.size == 0 }">
					<li>
						<h4>None</h4>
					</li>
				</g:if>
				<g:else>
					<g:each in="${UserCaloriesInstanceList }" var="data">
						<li>
							<span class="value-block"> ${data.amount } calories
							</span>
							<%--				        <span class="difference-block">(${data.previous_change })</span> --%>
							<span class="date-block">[ <g:formatDate format="dd-MM-yyyy" date="${data.calDate }" /> ]
							</span>
						</li>
					</g:each>
				</g:else>
			</ul>
		</div>

		<g:form action="saveCalories" class="form-hidden form-horizontal">
			<div id="calories_add" class="add-section"
				style="position: absolute; top: 0; left: 0; display: none; z-index: 10; width: 100%; height: 100%; background-color: #EEF4FF;">


				<div
					class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'calDate', 'error')} required">
					<label class="control-label" for="date">
						<g:message code="project.date.label" default="Date" />
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
						<calendar:datePicker name="calDate" value="${userCarbohydratesInstance?.calDate}" dateFormat="%d-%m-%Y"
							defaultValue="${new Date()}" />
					</div>
				</div>

				<div
					class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'amount', 'error')} required">
					<label class="control-label" for="amount">
						<g:message code="userConditions.amount.label" default="Amount (calories)" />
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
						<g:textField class="span6" name="amount" value="${userCaloriesInstance?.amount}" />
						<g:submitButton name="create" class="btn save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
					</div>
				</div>

				<div class="fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'user', 'error')} required hidden">
					<label for="user">
						<g:message code="project.user.label" default="User" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
						value="${userCaloriesInstance?.user?.id}" class="many-to-one" />
				</div>

			</div>
		</g:form>
	</div>
</div>








