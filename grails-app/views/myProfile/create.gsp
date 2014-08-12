<!doctype html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'Profile.label', default: 'Profile')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <calendar:resources lang="en" theme="tiger"/>
</head>
<%@ page import="im.UserProfile" %>

<body>

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
    
</body>
</html>
