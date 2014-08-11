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
	    <g:if test="${page == 'profile'}">
	        <h1>Edit Profile</h1>
	    </g:if>
        <g:if test="${page == 'employment'}">
            <h1>Edit Employment Info</h1>
        </g:if>
        <g:if test="${page == 'contacts'}">
            <h1>Edit Emergency Contacts</h1>
        </g:if>
        <g:if test="${page == 'physician'}">
            <h1>Edit Physician Info</h1>
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
			<g:hiddenField name="id" value="${userProfileInstance?.id}" />
			<g:hiddenField name="version" value="${userProfileInstance?.version}" />
			
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
	            </fieldset>
            </g:if>
            <g:if test="${page == 'contacts'}">
                <fieldset class="form">
                    <g:render template="formContacts"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updateContacts" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:if>
            <g:if test="${page == 'physician'}">
                <fieldset class="form">
                    <g:render template="formPhysician"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updatePhysician" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:if>
            
		</g:form>
	</div>
</body>
</html>
