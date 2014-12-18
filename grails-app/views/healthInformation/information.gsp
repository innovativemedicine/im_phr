<!doctype html>
<html>
<head>

<title>Health Information</title>


</head>
<body>

	<div class="container home-body">

		<div id="main-body" style="clear: both">

			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="${flash.tab == 'medications' ? 'active' : '' }">
						<a href="#medications" data-toggle="tab">Medications</a>
					</li>
					<li class="${flash.tab == 'immunizations' ? 'active' : '' }">
						<a href="#immunizations" data-toggle="tab">Immunizations</a>
					</li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane ${flash.tab == 'medications' ? 'active' : '' }" id="medications">
						<g:include controller="medications2" action="medications" />
						<hr>
						<g:include controller="medications2" action="medicationsPrevious" />
					</div>
					<div class="tab-pane ${flash.tab == 'immunizations' ? 'active' : '' }" id="immunizations">
						<g:include controller="immunizations" action="immunizations" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>