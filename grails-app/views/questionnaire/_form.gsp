<%@ page import="im.Questionnaire" %>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${questionnaireInstance?.user?.id}" class="many-to-one"/>
</div>


