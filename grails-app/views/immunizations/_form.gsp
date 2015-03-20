<%@ page import="phr.UserImmunizations"%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'name', 'error')} required">
			<label for="name">
				<g:message code="userImmunizations.name.label" default="Immunization Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="name" value="${userImmunizationsInstance?.name}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'comments', 'error')} ">
			<label for="comments">
				<g:message code="userImmunizations.comments.label" default="Comments" />
			</label>
			<g:textField class="span2" name="comments" value="${userImmunizationsInstance?.comments}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'date', 'error')} required">
			<label for="date">
				<g:message code="project.date.label" default="Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="date" value="${userImmunizationsInstance?.date}" dateFormat="%d-%m-%Y" />
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'user', 'error')} required hidden">
	<label for="user">
		<g:message code="project.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
		value="${userImmunizationsInstance?.user?.id}" class="many-to-one" />
</div>




