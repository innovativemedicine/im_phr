

<div class="block span6">

	<a id="wellness-button" class="wellness-button btn btn-primary">Add</a>

	<h1 class="block-header">Carbohydrates</h1>
	<div class="block-text" style="height: 85px; position: relative">

		<div class="wellness-info">
			<ul class="block-text">
				<g:if test="${UserCarbohydratesInstanceList.size == 0 }">
					<li>
						<h4>None</h4>
					</li>
				</g:if>
				<g:else>
					<g:each in="${UserCarbohydratesInstanceList }" var="data">
						<li>
							<span class="value-block"> ${data.amount } grams
							</span> <span class="date-block">[ <g:formatDate format="dd-MM-yyyy" date="${data.carbDate }" /> ]
							</span>
						</li>
					</g:each>
				</g:else>
			</ul>
		</div>

		<g:form action="saveCarbohydrates" class="form-hidden form-horizontal">
			<div id="carbohydrates_add" class="add-section"
				style="position: absolute; top: 0; left: 0; display: none; z-index: 10; width: 100%; background-color: #EEF4FF;">

				<div
					class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'carbDate', 'error')} required">

					<label class="control-label" for="date">
						<g:message code="project.date.label" default="Date" />
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
						<calendar:datePicker name="carbDate" value="${userCarbohydratesInstance?.carbDate}" dateFormat="%d-%m-%Y"
							defaultValue="${new Date()}" />
					</div>
				</div>

				<div
					class="control-group control-group-narrow fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'amount', 'error')} required">
					<label class="control-label" for="amount">
						<g:message code="userConditions.amount.label" default="Amount (grams)" />
						<span class="required-indicator">*</span>
					</label>
					<div class="controls">
						<g:textField class="span6" name="amount" value="${userCarbohydratesInstance?.amount}" />
						<g:submitButton name="create" class="btn save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
					</div>
				</div>




				<div class="fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'user', 'error')} required hidden">
					<label for="user">
						<g:message code="project.user.label" default="User" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
						value="${userCarbohydratesInstance?.user?.id}" class="many-to-one" />
				</div>


			</div>

		</g:form>
	</div>
</div>








