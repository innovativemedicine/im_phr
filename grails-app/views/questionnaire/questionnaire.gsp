<!doctype html>
<html>
<head>

<title>Questionnaires</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <div class="span9" style="float: left;">
                
				<g:form action="save" >
                    <fieldset class="form">
				        
						<g:each in="${QuestionsInstanceList }" var="data">
							<div class="row">
								<!-- // Articles Loop -->
								<div >
									<%--<h2>Question #${data.question_id }</h2>--%>
									<div>${data.question_id }.&nbsp;&nbsp;${data.question_text }</div>
									
						            <div class="btn-group q_buttons_row" data-toggle="buttons">
						                <% def count=10 %>
						                <div class="q_buttons_values">None</div>
		                                <g:each in="${0..count}" var="c">
							                <label class="btn q_buttons_spacing">
			                                    ${c }<br />
			                                    <input type="radio" name="Q${data.question_id }" id="answer${data.question_id }_${c }" value="${c }" >
			                                </label>
						                </g:each>
						                <div class="q_buttons_values">Very severe</div>
						            </div>
								</div>
							</div>
							<br /><br />
						</g:each>
					    
					    <div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'user', 'error')} required">
						    <label for="user">
						        <g:message code="project.user.label" default="User" />
						        <span class="required-indicator">*</span>
						    </label>
						    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${questionnaireInstance?.user?.id}" class="many-to-one"/>
						</div>
	                </fieldset>
	                
	                <fieldset class="buttons">
	                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
	                </fieldset>
	            </g:form>
	            
			</div>
			
			
			
			<div class="span3 " style="float: right; margin: 0px;">
				<!-- // Sidebar Part -->
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">Questionnaires</li>
						<li><a href="/questionnaire/questionnaire/BASDAI">BASDAI</a></li>
						<li><a href="/questionnaire/questionnaire/BASFI">BASFI</a></li>
						<li><a href="/questionnaire/questionnaire/Health Assessment Questionnaire">Health Assessment Questionnaire</a></li>
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