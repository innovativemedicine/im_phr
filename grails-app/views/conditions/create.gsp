<!doctype html>
<html>
<head>

	<g:set var="entityName" value="${message(code: 'conditions.label', default: 'Conditions')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="tiger"/>
</head>
<%@ page import="phr.UserConditions" %>

<body>

	<div id="create-userConditions" class="content scaffold-create" role="main">
		<h1><g:message code="default.create.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userConditionsInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userConditionsInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form action="save" >
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="btn btn-primary save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
