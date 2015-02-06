<!doctype html>
<html>
<head>

<title>Wellness</title>
<calendar:resources lang="en" theme="aqua" />


</head>
<body>
	<content tag="header" style="display: none;"> <%--        <h1>Wellness</h1>--%> </content>

	<div class="container home-body">

		<div id="main-body" style="clear: both">


			<div class="row-fluid">

				<g:render template="formBmi" />

			</div>



			<div class="row-fluid">
				<g:render template="formBloodPressure" />
				<g:render template="formCholestrol" />
			</div>

			<div class="row-fluid">
				<g:render template="formCarbohydrates" />
				<g:render template="formCalories" />
			</div>


			<%--            --%>
			<%--            <div class="row-fluid">--%>
			<%--                --%>
			<%--                <g:render template="formExercise"/>--%>
			<%--                --%>
			<%--            </div>--%>


		</div>
	</div>
</body>