<div class="navbar navbar-static-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="/pts">Innovative Medicine</a>

			<ul class="nav">


				<li class="${g.activePageClass(pageTitle:'Home') }">
					<g:link mapping="home">Home</g:link>
				</li>
				
				<li class="${g.activePageClass(pageTitle:'About') }">
					<g:link mapping="about">About</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Team') }">
					<g:link mapping="team">Team</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Carrers') }">
					<g:link mapping="careers">Careers</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Contact') }">
					<g:link mapping="contact">Contact</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'Tools') }">
					<g:link mapping="tools">Tools</g:link>
				</li>
				<li class="${g.activePageClass(pageTitle:'SLRI') }">
					<g:link mapping="symposium">Symposium: Personalized Health Care</g:link>
				</li>
				
				
                <li class="${g.activePageClass(pageTitle:'tissues') }">
                    <g:link mapping="tissues">Tissues</g:link>
                </li>
				
                <li class="${g.activePageClass(pageTitle:'Login') } floatRight">
                    <g:link mapping="login">Login</g:link>
                </li>
                
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
