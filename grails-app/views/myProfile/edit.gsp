<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'Profile.label', default: 'Profile')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="tiger"/>
</head>
<%@ page import="im.UserProfile" %>

<body>

	<div id="edit-userProfile" class="content scaffold-edit" role="main">
	    <g:set var="pageId" value="${0}" />
	    <g:set var="pageVersion" value="${0}" />
	    <g:if test="${page == 'profile'}">
	        <h1>Edit Profile</h1>
	        <g:set var="pageId" value="${session.user.id }" />
	        <g:set var="pageVersion" value="${userProfileInstance?.version }" />
	    </g:if>
        <g:if test="${page == 'employment'}">
            <h1>Edit Employment Info</h1>
            <g:set var="pageId" value="${userEmploymentInstance.id}" />
            <g:set var="pageVersion" value="${userEmploymentInstance?.version }" />
        </g:if>
        <g:if test="${page == 'contacts'}">
            <h1>Edit Emergency Contacts</h1>
            <g:set var="pageId" value="${userContactsInstance.id}" />
            <g:set var="pageVersion" value="${userContactsInstance?.version }" />
        </g:if>
        <g:if test="${page == 'physician'}">
            <h1>Edit Physician Info</h1>
            <g:set var="pageId" value="${userPhysicianInfoInstance.id}" />
            <g:set var="pageVersion" value="${userPhysicianInfoInstance?.version }" />
        </g:if>
        
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
			<g:hiddenField name="id" value="${pageId }" />
			<g:hiddenField name="version" value="${pageVersion}" />
			
			<g:if test="${page == 'profile'}">
                <fieldset class="form">
                    <g:render template="formProfile"/>
	            </fieldset>
	            <fieldset class="buttons">
	                <g:actionSubmit class="save" action="updateProfile" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            </fieldset>
            </g:if>
            <g:if test="${page == 'employment'}">
                <fieldset class="form">
                    <g:render template="formEmployment"/>
	            </fieldset>
	            <fieldset class="buttons">
	                <g:actionSubmit class="save" action="updateEmployment" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	                <g:actionSubmit class="delete" action="deleteEmployment" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
	            </fieldset>
            </g:if>
            <g:if test="${page == 'contacts'}">
                <fieldset class="form">
                    <g:render template="formContacts"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updateContacts" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="delete" action="deleteContacts" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:if>
            <g:if test="${page == 'physician'}">
                <fieldset class="form">
                    <g:render template="formPhysician"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updatePhysician" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="delete" action="deletePhysician" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:if>
		</g:form>
	</div>
</body>
</html>
