<%@ page import="phr.Login" %>
<!doctype html>
<html>
    <head>
        <title><g:message code="Login" /></title>
    </head>
    <body>
        
        <div id="edit-userProfile" class="content scaffold-edit" role="main">
            <h1>Add new user</h1>
            
            <g:hasErrors bean="${userProfileInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userProfileInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form method="post" >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="btn save" action="saveNewUser" value="Create User" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>