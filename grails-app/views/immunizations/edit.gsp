<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'immunizations.label', default: 'Immunizations')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="aqua"/>
</head>
<%@ page import="phr.UserImmunizations" %>

<body>

	<div id="edit-userImmunizations" class="content scaffold-edit" role="main">
		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
		<g:hasErrors bean="${userImmunizationsInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userImmunizationsInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form method="post" >
			<g:hiddenField name="id" value="${userImmunizationsInstance?.id}" />
			<g:hiddenField name="version" value="${userImmunizationsInstance?.version}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
