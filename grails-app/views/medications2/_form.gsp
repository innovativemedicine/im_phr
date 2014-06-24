<%@ page import="im.UserMedications2" %>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userMedications2.name.label" default="Medication Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userMedications2Instance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'dose', 'error')} ">
    <label for="dose">
        <g:message code="userMedications2.dose.label" default="Dose" />
    </label>
    <g:textField name="dose" value="${userMedications2Instance?.dose}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'frequency', 'error')} ">
    <label for="frequency">
        <g:message code="userMedications2.frequency.label" default="Frequency" />
    </label>
    <g:textField name="frequency" value="${userMedications2Instance?.frequency}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'form', 'error')} ">
    <label for="form">
        <g:message code="userMedications2.form.label" default="Form" />
    </label>
    <g:textField name="form" value="${userMedications2Instance?.form}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'strength', 'error')} ">
    <label for="strength">
        <g:message code="userMedications2.strength.label" default="Strength" />
    </label>
    <g:textField name="strength" value="${userMedications2Instance?.strength}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'startDate', 'error')} required">
    <label for="startDate">
        <g:message code="project.startDate.label" default="Start Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="startDate" precision="day"  value="${userMedications2Instance?.startDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'stopDate', 'error')} required">
    <label for="stopDate">
        <g:message code="project.stopDate.label" default="Stop Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="stopDate" precision="day"  value="${userMedications2Instance?.stopDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'refillDate', 'error')} required">
    <label for="refillDate">
        <g:message code="project.refillDate.label" default="Refill Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="refillDate" precision="day"  value="${userMedications2Instance?.refillDate}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userMedications2.comments.label" default="Reasons for taking" />
    </label>
    <g:textField name="comments" value="${userMedications2Instance?.comments}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedications2Instance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userMedications2Instance?.user?.id}" class="many-to-one"/>
</div>




