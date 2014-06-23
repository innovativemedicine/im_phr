<%@ page import="im.Login" %>
<!doctype html>
<html>
    <head>
        <title><g:message code="Welcome ${userName}" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <div id="welcome-div" class="content scaffold-create" role="main">
                <div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'userName', 'error')} ">
                    <%--<h1>${allData.email}</h1>--%>
                </div>
                <g:message code="Welcome ${userName}" />
            </div>
        </div>
    </body>
</html>