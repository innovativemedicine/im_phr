<%@ page import="phr.UserProfile" %>


<div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'userName', 'error')} required">
    <label for="userName">
        <g:message code="login.userName.label" default="Username" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="userName" value="${loginInstance?.userName}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="login.password.label" default="Password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" value="${loginInstance?.password}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="login.password.label" default="Retype password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password2" value="${loginInstance?.password}"/>
</div>


