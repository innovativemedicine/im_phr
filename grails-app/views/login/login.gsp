<%@ page import="im.Login" %>
<!doctype html>
<html>
    <head>
        <title><g:message code="Login" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
	        <div id="create-login" class="content scaffold-create" role="main">
	            <g:hasErrors bean="${loginInstance}">
	            <ul class="errors" role="alert">
	                <g:eachError bean="${loginInstance}" var="error">
	                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
	                </g:eachError>
	            </ul>
	            </g:hasErrors>
	            <g:form action="authenticate" >
	                <fieldset class="form">
	                    <div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'userName', 'error')} ">
	                        <label for="userName">
	                            <g:message code="login.userName.label" default="User Name" />
	                            
	                        </label>
	                        <g:textField name="userName" value="${loginInstance?.userName}"/>
	                    </div>
	                    
	                    <div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'password', 'error')} ">
	                        <label for="password">
	                            <g:message code="login.password.label" default="Password" />
	                            
	                        </label>
	                        <g:field type="password" name="password" value="${loginInstance?.password}"/>
	                    </div>
	                </fieldset>
	                <fieldset class="buttons">
	                    <g:submitButton name="login" class="save" value="Login" />
	                </fieldset>
	            </g:form>
	        </div>
        </div>
    </body>
</html>