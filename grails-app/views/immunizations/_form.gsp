<%@ page import="im.UserImmunizations" %>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userImmunizations.name.label" default="Immunization Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userImmunizationsInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'dose', 'error')} ">
    <label for="dose">
        <g:message code="userImmunizations.dose.label" default="Dose" />
    </label>
    <g:textField name="dose" value="${userImmunizationsInstance?.dose}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="userImmunizations.type.label" default="Type" />
	</label>
	<%--<g:select name="type" from="${im.UserImmunizations.list()}" optionKey="type" value="${userImmunizationsInstance?.type}" noSelection="['null': 'N/A']"/>--%>
	<g:select name="type" from="${userImmunizationsInstance?.constraints?.type?.inList}" value="${userImmunizationsInstance?.type}" noSelection="['null': 'N/A']"/>	
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'manufacturer', 'error')} ">
    <label for="manufacturer">
        <g:message code="userImmunizations.manufacturer.label" default="Manufacturer" />
    </label>
    <g:textField name="manufacturer" value="${userImmunizationsInstance?.manufacturer}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userImmunizations.comments.label" default="Comments" />
    </label>
    <g:textField name="comments" value="${userImmunizationsInstance?.comments}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="project.date.label" default="Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day"  value="${userImmunizationsInstance?.date}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'nextDate', 'error')} required">
    <label for="nextDate">
        <g:message code="project.nextDate.label" default="Next Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="nextDate" precision="day"  value="${userImmunizationsInstance?.nextDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userImmunizationsInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByFirstName(session.user.firstName)}" optionKey="id" required="" value="${userImmunizationsInstance?.user?.id}" class="many-to-one"/>
</div>




