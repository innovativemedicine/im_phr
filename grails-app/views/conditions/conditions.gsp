<!doctype html>
<html>
<head>

<title>Conditions</title>


</head>
<body>

	<div class="container home-body">

		<div id="main-body" style="clear: both">


			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="${flash.tab == 'conditions' ? 'active' : '' }">
						<a href="#conditions" data-toggle="tab">Conditions</a>
					</li>
					<li class="${flash.tab == 'allergies' ? 'active' : ''}">
						<a href="#allergies" data-toggle="tab">Allergies</a>
					</li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane ${flash.tab == 'conditions' ? 'active' : '' }" id="conditions">
						<g:link class="add-button btn btn-primary form-button" action="create">Add Condition</g:link>

						<h1>Current Conditions</h1>
						<table class="table table-hover table-striped">
							<caption>Lists both Chronic (e.g. arthritis) and Acute (e.g. cold, flu) conditions. Will automatically
								update when date expires.</caption>
							<thead>
								<tr>
									<th class="table-name">Name</th>
									<th class="table-symptoms">Symptoms</th>
									<th class="table-comments">Comments</th>
									<th class="table-date2">Onset Date</th>
									<th class="table-date2">End Date</th>
									<th class="table-editdelete">Edit/Delete</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${UserCurrentConditionsInstanceList }" var="data">
									<tr>
										<td>
											${data.name }
										</td>
										<td>
											${data.symptoms }
										</td>
										<td>
											${data.comments }
										</td>
										<td>
											${data.onset_date }
										</td>
										<td>
											${data.end_date }
										</td>
										<td class="table-editdelete">
											<g:link class="icons-edit" action="edit" params='[id: "${data.condition_id }"]' title="Edit">
												<i class="icon-cog"></i>
											</g:link>
											<g:link class="icons-edit" action="delete" params='[id: "${data.condition_id }"]'
												onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
												title="Delete">
												<i class="icon-remove"></i>
											</g:link>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>

						<hr>

						<h1>Previous Conditions</h1>
						<table class="table table-hover table-striped">
							<caption>Conditions prior to current date.</caption>
							<thead>
								<tr>
									<th class="table-name">Name</th>
									<th class="table-symptoms">Symptoms</th>
									<th class="table-comments">Comments</th>
									<th class="table-date2">Onset Date</th>
									<th class="table-date2">End Date</th>
									<th class="table-editdelete">Edit/Delete</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${UserPreviousConditionsInstanceList }" var="data">
									<tr>
										<td>
											${data.name }
										</td>
										<td>
											${data.symptoms }
										</td>
										<td>
											${data.comments }
										</td>
										<td>
											${data.onset_date }
										</td>
										<td>
											${data.end_date }
										</td>
										<td class="table-editdelete">
											<g:link class="icons-edit" action="edit" params='[id: "${data.condition_id }"]' title="Edit">
												<i class="icon-cog"></i>
											</g:link>
											<g:link class="icons-edit" action="delete" params='[id: "${data.condition_id }"]'
												onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
												title="Delete">
												<i class="icon-remove"></i>
											</g:link>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>

					<div class="tab-pane ${flash.tab == 'allergies' ? 'active' : '' }" id="allergies">
						<g:include controller="allergies" action="allergies" />
					</div>

				</div>
			</div>





		</div>
	</div>
</body>