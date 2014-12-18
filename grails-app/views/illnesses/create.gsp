<!doctype html>
<html>
<head>

	<g:set var="entityName" value="${message(code: 'illnesses.label', default: 'Illnesses')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="tiger"/>
</head>
<%@ page import="phr.UserIllnesses" %>

<body>

	<div id="create-userIllnesses" class="content scaffold-create" role="main">
		<h1><g:message code="default.create.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userIllnessesInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userIllnessesInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form action="save" >
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
