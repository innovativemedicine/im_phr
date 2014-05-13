<%@ page import="im.Login" %>
<!doctype html>
<html>
    <head>
        <title><g:message code="Welcome ${fullName}" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <div id="welcome-div" class="content scaffold-create" role="main">
	            <div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'userName', 'error')} ">
	                <%--<h1>Hello ${fullName}!</h1>--%>
	                <h1>${allData.email }</h1>
	            </div>
            </div>
        </div>
    </body>
</html>