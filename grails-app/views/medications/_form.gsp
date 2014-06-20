<%@ page import="im.UserMedications" %>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userMedications.name.label" default="Medication Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userMedicationsInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'dose', 'error')} ">
    <label for="dose">
        <g:message code="userMedications.dose.label" default="Dose" />
    </label>
    <g:textField name="dose" value="${userMedicationsInstance?.dose}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'frequency', 'error')} ">
    <label for="frequency">
        <g:message code="userMedications.frequency.label" default="Frequency" />
    </label>
    <g:textField name="frequency" value="${userMedicationsInstance?.frequency}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'form', 'error')} ">
    <label for="form">
        <g:message code="userMedications.form.label" default="Form" />
    </label>
    <g:textField name="form" value="${userMedicationsInstance?.form}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'strength', 'error')} ">
    <label for="strength">
        <g:message code="userMedications.strength.label" default="Strength" />
    </label>
    <g:textField name="strength" value="${userMedicationsInstance?.strength}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'startDate', 'error')} required">
    <label for="startDate">
        <g:message code="project.startDate.label" default="Start Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="startDate" precision="day"  value="${userMedicationsInstance?.startDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'stopDate', 'error')} required">
    <label for="stopDate">
        <g:message code="project.stopDate.label" default="Stop Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="stopDate" precision="day"  value="${userMedicationsInstance?.stopDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'refillDate', 'error')} required">
    <label for="refillDate">
        <g:message code="project.refillDate.label" default="Refill Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="refillDate" precision="day"  value="${userMedicationsInstance?.refillDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userMedications.comments.label" default="Reasons for taking" />
    </label>
    <g:textField name="comments" value="${userMedicationsInstance?.comments}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userMedicationsInstance?.user?.id}" class="many-to-one"/>
</div>




