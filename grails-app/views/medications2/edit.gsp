<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'medications.label', default: 'Medications')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="aqua"/>
</head>
<%@ page import="phr.UserMedications2" %>

<body>

	<div id="edit-userMedications" class="content scaffold-edit" role="main">
		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
		<g:hasErrors bean="${userMedicationsInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userMedicationsInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form method="post" >
			<g:hiddenField name="id" value="${userMedicationsInstance?.id}" />
			<g:hiddenField name="version" value="${userMedicationsInstance?.version}" />
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
