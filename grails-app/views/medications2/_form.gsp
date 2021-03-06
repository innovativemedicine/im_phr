<%@ page import="phr.UserMedications2"%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'name', 'error')} required">
			<label for="name">
				<g:message code="userMedications2.name.label" default="Medication Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="name" value="${userMedicationsInstance?.name}" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'form', 'error')} ">
			<label for="form">
				<g:message code="userMedications2.form.label" default="Form" />
			</label>
			<g:textField class="span2" name="form" value="${userMedicationsInstance?.form}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'dose', 'error')} ">
			<label for="dose">
				<g:message code="userMedications2.dose.label" default="Dose" />
			</label>
			<g:textField class="span2" name="dose" value="${userMedicationsInstance?.dose}" />
		</div>
	</div>

	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'strength', 'error')} ">
			<label for="strength">
				<g:message code="userMedications2.strength.label" default="Strength" />
			</label>
			<g:select class="span2" name="strength" from="${UserMedications2?.constraints.strength.inList}"
				keys="${UserMedications2?.constraints.strength.inList}" noSelection="['null':'Select a value']" optionKey="strength"
				value="${userMedicationsInstance?.strength}" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'frequency', 'error')} ">
			<label for="frequency">
				<g:message code="userMedications2.frequency.label" default="Frequency" />
			</label>
			<g:textField class="span2" name="frequency" value="${userMedicationsInstance?.frequency}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span6">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'comments', 'error')} ">
			<label for="comments">
				<g:message code="userMedications2.comments.label" default="Reasons for taking" />
			</label>
			<g:textField class="span5" name="comments" value="${userMedicationsInstance?.comments}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'startDate', 'error')} required">
			<label for="startDate">
				<g:message code="project.startDate.label" default="Start Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="startDate" value="${userMedicationsInstance?.startDate}" dateFormat="%d-%m-%Y" />
		</div>
	</div>
	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'stopDate', 'error')} required">
			<label for="stopDate">
				<g:message code="project.stopDate.label" default="Stop Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="stopDate" value="${userMedicationsInstance?.stopDate}" dateFormat="%d-%m-%Y" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'refillDate', 'error')} required">
			<label for="refillDate">
				<g:message code="project.refillDate.label" default="Refill Date" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="refillDate" value="${userMedicationsInstance?.refillDate}" dateFormat="%d-%m-%Y" />
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'user', 'error')} required hidden">
	<label for="user">
		<g:message code="project.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
		value="${userMedicationsInstance?.user?.id}" class="many-to-one" />
</div>




