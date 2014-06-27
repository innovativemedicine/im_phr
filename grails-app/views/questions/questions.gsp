<!doctype html>
<html>
<head>

<title>Diary</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
                        
            <div class="span8" style="float: left;">
				<!-- // Main Part -->
				<g:each in="${QuestionsInstanceList }" var="data">
					<div class="row">
						<!-- // Articles Loop -->
						<div class="span7">
							<h2>Question #${data.question_id }</h2>
							<p>${data.question_text }</p>
							<%--<p><a class="btn" href="#">Edit »</a></p>--%>
							<g:link class="btn" action="edit" params='[id: "${data.question_id }"]' >Edit »</g:link>
						</div>
					</div>
				</g:each>
				<!-- // Articles Loop End -->
				
				<g:link class="btn form-button" action="create">
	                Add Entry
	            </g:link>
			</div>
			
			<div class="span4 " style="float: right; margin: 0px;">
				<!-- // Sidebar Part -->
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">About Me</li>
						<li>Author Data</li>
						<li class="divider"></li>
						<li class="nav-header">Recent Posts</li>
						<g:each in="${QuestionsInstanceList }" var="data">
							<li><a href="/diary/diary/${data.question_id }">Question #${data.question_id }</a></li>
						</g:each>
						<li class="divider"></li>
						<li class="nav-header">Categories</li>
						<li>ad1</li>
						<li>ad2</li>
					</ul>
				</div>
			</div>
            
            
        </div>
    </div>
</body>