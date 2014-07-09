<%@ page import="im.UserMedications2" %>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userMedications2.name.label" default="Medication Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userMedicationsInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'dose', 'error')} ">
    <label for="dose">
        <g:message code="userMedications2.dose.label" default="Dose" />
    </label>
    <g:textField name="dose" value="${userMedicationsInstance?.dose}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'frequency', 'error')} ">
    <label for="frequency">
        <g:message code="userMedications2.frequency.label" default="Frequency" />
    </label>
    <g:textField name="frequency" value="${userMedicationsInstance?.frequency}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'form', 'error')} ">
    <label for="form">
        <g:message code="userMedications2.form.label" default="Form" />
    </label>
    <g:textField name="form" value="${userMedicationsInstance?.form}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'strength', 'error')} ">
    <label for="strength">
        <g:message code="userMedications2.strength.label" default="Strength" />
    </label>
    <g:select name="strength" from="${UserMedications2?.constraints.strength.inList}" keys="${UserMedications2?.constraints.strength.inList}" 
        noSelection="['null':'Select a value']" optionKey="strength" value="${userAllergiesInstance?.strength}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userMedications2.comments.label" default="Reasons for taking" />
    </label>
    <g:textField name="comments" value="${userMedicationsInstance?.comments}"/>
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


<div class="fieldcontain ${hasErrors(bean: userMedicationsInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userMedicationsInstance?.user?.id}" class="many-to-one"/>
</div>




