<div class="navbar navbar-static-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="/">Personal Health Record</a>

			<ul class="nav">


				<li class="${g.activePageClass(pageTitle:'Summary') }">
					<g:link mapping="summary">Summary</g:link>
				</li>
				
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
				<li class="${g.activePageClass(pageTitle:'Conditions') }">
					<g:link mapping="conditions">Conditions</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Wellness') }">
					<g:link mapping="wellness">Wellness</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Calendar') }">
                    <g:link mapping="calendar">Calendar</g:link>
                </li>
				<li class="${g.activePageClass(pageTitle:'profile') }">
                    <g:link mapping="profile">My Profile</g:link>
                </li>
                
                <!-- 
				<g:if test="${session.user == null}">
                <li class="${g.activePageClass(pageTitle:'Login') }">
                    <g:link mapping="login">Login</g:link>
                </li>
                </g:if>
                <g:if test="${session.user != null}">
                <li class="${g.activePageClass(pageTitle:'Logout') }">
                    <g:link mapping="logout">Logout</g:link>
                </li>
                </g:if>
                 -->
                
			</ul>
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
