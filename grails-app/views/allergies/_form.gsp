<%@ page import="im.UserAllergies" %>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userAllergies.name.label" default="Allergy Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userAllergiesInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'reaction', 'error')} ">
    <label for="reaction">
        <g:message code="userAllergies.reaction.label" default="Reaction" />
    </label>
    <g:textField name="reaction" value="${userAllergiesInstance?.reaction}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'severity', 'error')} ">
	<label for="severity">
		<g:message code="userAllergies.severity.label" default="Severity" />
	</label>
	<%--<g:select name="severity" from="${im.UserAllergies.list()}" optionKey="severity" value="${userAllergiesInstance?.severity}" noSelection="['null': 'N/A']"/>--%>
	<%--<g:select name="severity" from="${userAllergiesInstance?.constraints?.severity?.inList}" value="${userAllergiesInstance?.severity}" noSelection="['null': 'N/A']"/>--%>
	<g:textField name="severity" value="${userAllergiesInstance?.severity}"/>	
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'onsetDate', 'error')} required">
    <label for="onsetDate">
        <g:message code="project.onsetDate.label" default="Onset Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="onsetDate" precision="day"  value="${userAllergiesInstance?.onsetDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userAllergiesInstance?.user?.id}" class="many-to-one"/>
</div>




