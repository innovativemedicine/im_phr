<%@ page import="im.UserConditions" %>


<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userConditions.name.label" default="Condition Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userConditionsInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userConditions.comments.label" default="Comments" />
    </label>
    <g:textField name="comments" value="${userConditionsInstance?.comments}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'onsetDate', 'error')} required">
    <label for="onsetDate">
        <g:message code="project.onsetDate.label" default="Onset Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="onsetDate" precision="day"  value="${userConditionsInstance?.onsetDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'endDate', 'error')} required">
    <label for="endDate">
        <g:message code="project.endDate.label" default="End Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="endDate" precision="day"  value="${userConditionsInstance?.endDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByFirstName(session.user.firstName)}" optionKey="id" required="" value="${userConditionsInstance?.user?.id}" class="many-to-one"/>
</div>




