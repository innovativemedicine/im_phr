<!doctype html>
<html>
<head>

<title>Diary</title>


</head>
<body>

	<div class="container home-body">

		<div id="main-body" style="clear: both">

			<div class="row-fluid">
				<div class="span2">


					<g:link class="btn btn-block btn-primary" action="create" style="margin-bottom: 5px;">
	                New Entry
	            </g:link>

					<!-- // Sidebar Part -->
					<div class="well sidebar-nav">
						<ul class="nav nav-list">
							<li class="nav-header">Recent Posts</li>
							<g:each in="${UserDiaryInstanceList }" var="data">
								<li>
									<a href="/phr/diary/diary/${data.diary_id }"> ${data.topic }
									</a>
								</li>
							</g:each>
						</ul>
					</div>
				</div>

				<div class="span8" style="margin-top: 15px;">
					<!-- // Main Part -->
					<hr>
					<g:each in="${UserDiaryInstanceList }" var="data">
						<!-- // Articles Loop -->
						<div>

							<h3 style="margin: 0px; display: inline;">
								${data.topic }
							</h3>

							<g:link class="btn form-button inline" action="edit" params='[id: "${data.diary_id }"]' style="margin-top: 4px;">Edit »</g:link>

							<p style="margin-top: 5px;">
								${data.entry }
							</p>
							<p>
								${data.date }
							</p>
						</div>
						<hr style="margin-top: 10px;">


					</g:each>
					<!-- // Articles Loop End -->

				</div>

			</div>

		</div>
	</div>
</body>