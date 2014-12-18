<%@ page import="phr.UserAllergies" %>


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
    <g:select name="severity" from="${UserAllergies?.constraints.severity.inList}" keys="${UserAllergies?.constraints.severity.inList}" 
        noSelection="['null':'Select a Resource']" optionKey="severity" value="${userAllergiesInstance?.severity}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'severityValue', 'error')} ">
    <label for="severityValue">
        <g:message code="userAllergies.severityValue.label" default="Severity Value" />
    </label>
    <g:select name="severityValue" from="${UserAllergies?.constraints.severityValue.inList}" keys="${UserAllergies?.constraints.severityValue.inList}" 
        noSelection="['null':'Select a Resource']" optionKey="severityValue" value="${userAllergiesInstance?.severityValue}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'onsetDate', 'error')} required">
    <label for="onsetDate">
        <g:message code="project.onsetDate.label" default="Onset Date" />
        <span class="required-indicator">*</span>
    </label>
    <calendar:datePicker name="onsetDate" value="${userAllergiesInstance?.onsetDate}" dateFormat="%d-%m-%Y" />
</div>


<div class="fieldcontain ${hasErrors(bean: userAllergiesInstance, field: 'user', 'error')} required hidden">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userAllergiesInstance?.user?.id}" class="many-to-one"/>
</div>



<script type="text/javascript">
// Setting the drop-down menu for the severity value
$("#severity").change(function () {
    var end = this.value;
    if (end == "Minor") {
        $("#severityValue").val("1");
    } else if (end == "Moderate") {
        $("#severityValue").val("2");
    } else if (end == "Serious") {
        $("#severityValue").val("3");
    } else if (end == "Severe") {
        $("#severityValue").val("4");
    } else if (end == "Critical") {
        $("#severityValue").val("5");
    }
});
</script>