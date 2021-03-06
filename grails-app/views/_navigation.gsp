<div class="navbar navbar-static-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="#">myHealth</a>

			<ul class="nav">

				<g:if test="${session.userRole == 'PATIENT'}">
				<li class="${g.activePageClass(pageTitle:'Summary') }">
					<g:link mapping="summary">Summary</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Health Information') }">
					<g:link mapping="information">Medications</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Conditions') }">
					<g:link mapping="conditions">Conditions</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Wellness') }">
					<g:link mapping="wellness">Wellness</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Questionnaires') }">
					<g:link mapping="questionnaire">Questionnaire</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Diary') }">
					<g:link mapping="diary">Diary</g:link>
				</li>


				<!-- 
                <li class="old-links">
                    <a href="#">Old Links</a>
                    <ul>
                        <li class="${g.activePageClass(pageTitle:'Medications') }">
	                        <g:link mapping="medications">Medications</g:link>
		                </li>
		                <li class="${g.activePageClass(pageTitle:'Immunizations') }">
		                    <g:link mapping="immunizations">Immunizations</g:link>
		                </li>
		                <li class="${g.activePageClass(pageTitle:'Allergies') }">
		                    <g:link mapping="allergies">Allergies</g:link>
		                </li>
		                <li class="${g.activePageClass(pageTitle:'Illnesses') }">
		                    <g:link mapping="illnesses">Illnesses</g:link>
		                </li>
		                <li class="${g.activePageClass(pageTitle:'Calendar') }">
		                    <g:link mapping="calendar">Calendar</g:link>
		                </li>
                    </ul>
                </li>
                -->
			</g:if>
			<g:if test="${session.userRole == 'DOCTOR'}">
				<li class="${g.activePageClass(pageTitle:'Patient') }">
					<g:link controller="patient" action="index">Patient</g:link>
				</li>
			</g:if>
			</ul>
			
			<g:if test="${session.user != null}">

				<g:img dir="images/custom" file="mshlogo_new.gif" style="width: 13%; float: right;" />

				<ul class="nav pull-right">
					<li class="${g.activePageClass(pageTitle:'My Profile') }">
						<g:link mapping="profile">My Profile</g:link>
					</li>
					<li>
						<a href="${createLink(action: 'logout', controller: 'login')}">Logout</a>
					</li>


				</ul>


			</g:if>



		</div>
	</div>

	<g:if test="${flash.message}">
		<div class="page-alert">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</div>
	</g:if>

</div>
