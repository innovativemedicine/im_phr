<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'Profile.label', default: 'Profile')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

</head>
<%@ page import="im.UserProfile" %>

<body>

	<div id="edit-userProfile" class="content scaffold-edit" role="main">
		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userProfileInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userProfileInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form method="post" >
			<g:hiddenField name="id" value="${userProfileInstance?.id}" />
			<g:hiddenField name="version" value="${userProfileInstance?.version}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
