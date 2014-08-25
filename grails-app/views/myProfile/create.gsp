<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'Profile.label', default: 'Profile')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="tiger"/>
</head>
<%@ page import="im.UserProfile" %>

<body>
    
    <g:if test="${page == 'employment'}">
        <div id="create-userEmploymentInfo" class="content scaffold-create" role="main">
            <h1>Add Employment Info</h1>
            <g:hasErrors bean="${userEmploymentInfoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userEmploymentInfoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="saveEmployment" >
                <fieldset class="form">
                    <g:render template="formEmployment"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="saveEmployment" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </g:if>
    
    
    <g:if test="${page == 'contacts'}">
        <div id="create-userContactsInfo" class="content scaffold-create" role="main">
            <h1>Add Contacts Info</h1>
            <g:hasErrors bean="${userContactsInfoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userContactsInfoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="saveContacts" >
                <fieldset class="form">
                    <g:render template="formContacts"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="saveContacts" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </g:if>
    
    
    <g:if test="${page == 'physician'}">
	    <div id="create-userPhysicianInfo" class="content scaffold-create" role="main">
	        <h1>Add Physician Info</h1>
	        <g:hasErrors bean="${userPhysicianInfoInstance}">
	        <ul class="errors" role="alert">
	            <g:eachError bean="${userPhysicianInfoInstance}" var="error">
	            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
	            </g:eachError>
	        </ul>
	        </g:hasErrors>
	        <g:form action="savePhysician" >
	            <fieldset class="form">
	                <g:render template="formPhysician"/>
	            </fieldset>
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	            </fieldset>
	        </g:form>
	    </div>
    </g:if>
    
</body>
</html>
