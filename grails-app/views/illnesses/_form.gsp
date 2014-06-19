<%@ page import="im.UserIllnesses" %>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userIllnesses.name.label" default="Illness Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userIllnessesInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'symptoms', 'error')} ">
    <label for="symptoms">
        <g:message code="userIllnesses.symptoms.label" default="Symptoms" />
    </label>
    <g:textField name="symptoms" value="${userIllnessesInstance?.symptoms}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'treatment', 'error')} ">
	<label for="treatment">
		<g:message code="userIllnesses.treatment.label" default="Treatment" />
	</label>
	<g:textField name="treatment" value="${userIllnessesInstance?.treatment}"/>	
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'onsetDate', 'error')} required">
    <label for="onsetDate">
        <g:message code="project.onsetDate.label" default="Onset Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="onsetDate" precision="day"  value="${userIllnessesInstance?.onsetDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'endDate', 'error')} required">
    <label for="endDate">
        <g:message code="project.endDate.label" default="End Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="endDate" precision="day"  value="${userIllnessesInstance?.endDate}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="userIllnesses.comments.label" default="Comments" />
    </label>
    <g:textField name="comments" value="${userIllnessesInstance?.comments}"/> 
</div>


<div class="fieldcontain ${hasErrors(bean: userIllnessesInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByFirstName(session.user.firstName)}" optionKey="id" required="" value="${userIllnessesInstance?.user?.id}" class="many-to-one"/>
</div>



