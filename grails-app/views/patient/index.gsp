<%--<%@ page import="phr.UserProfile"%>--%>

<!doctype html>
<html>
<head>

<title>Patient Summary</title>

</head>
<body>

	<div class="container home-body">

		<div class="row-fluid">
			<div class="block span12" style="height: 80px; margin-top: 0px;">
				<g:form class="form-inline" action="show">
					<label>Patient:</label>
					<g:textField value="Nderoo" name="firstName" class="input-medium" placeholder="First Name" />
					<g:textField value="Wonger"  name="lastName" class="input-medium" placeholder="Last Name" />
					
					<g:submitButton name="show" value="Search" class="btn" />
					
					Use: Nderoo Wonger
										
				</g:form>

			</div>
		</div>

</body>