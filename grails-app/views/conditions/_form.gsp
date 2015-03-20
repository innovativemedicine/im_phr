<%@ page import="phr.UserConditions"%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'name', 'error')} required">
			<label for="name">
				<g:message code="userConditions.name.label" default="Condition Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="name" value="${userConditionsInstance?.name}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'symptoms', 'error')} ">
			<label for="symptoms">
				<g:message code="userConditions.symptoms.label" default="Symptoms" />
			</label>
			<g:textField class="span2" name="symptoms" value="${userConditionsInstance?.symptoms}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'comments', 'error')} ">
			<label for="comments">
				<g:message code="userConditions.comments.label" default="Comments" />
			</label>
			<g:textField class="span2" name="comments" value="${userConditionsInstance?.comments}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'onsetDate', 'error')} required">
			<label for="onsetDate">
				<g:message code="project.onsetDate.label" default="Onset Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="onsetDate" value="${userConditionsInstance?.onsetDate}" dateFormat="%d-%m-%Y" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'endDate', 'error')} required">
			<label for="endDate">
				<g:message code="project.endDate.label" default="End Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="endDate" value="${userConditionsInstance?.endDate}" dateFormat="%d-%m-%Y" />
		</div>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required hidden">
	<label for="user">
		<g:message code="project.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
		value="${userConditionsInstance?.user?.id}" class="many-to-one" />
</div>




