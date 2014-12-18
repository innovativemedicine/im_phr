

<div class="block span12">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        Exercise
    </h1>
    
    <div class="span12">
	    
	    <h1 class="block-header">
	        Steps taken
	    </h1>
	    <div class="block-text">
	        <div id="holder"></div>
	        <!--  <div id="chart_div"></div> -->
	        
	        <ul style="font-size: 18px;">
	            <g:if test="${UserStepsInstanceList.size == 0 }">
	                <li><h4>None</h4></li>
	            </g:if>
	            <g:else>
	                <g:each in="${UserStepsInstanceList }" var="data">
	                    <li>
	                        <span style="display: inline-block; width: 120px;">${data.steps }</span> 
	                        <span style="display: inline-block;">[ ${data.date } ]</span>
	                    </li>
	                </g:each>
	            </g:else>
	        </ul>
	        
	    </div>
	</div>
	
	<div class="row-fluid">
		<div class="block span4">
		    
		    <h1 class="block-header">
		        Push-ups
		    </h1>
		    <div class="block-text">
		        <div id="holder"></div>
		        <!--  <div id="chart_div"></div> -->
		         
		        <ul style="font-size: 18px;">
		            <g:if test="${UserPushupsInstanceList.size == 0 }">
		                <li><h4>None</h4></li>
		            </g:if>
		            <g:else>
		                <g:each in="${UserPushupsInstanceList }" var="data">
		                    <li>
		                        <span style="display: inline-block; width: 120px;">${data.pushups }</span> 
		                        <span style="display: inline-block;">[ ${data.date } ]</span>
		                    </li>
		                </g:each>
		            </g:else>
		        </ul>
		        
		    </div>
		</div>
		
		<div class="block span4">
	        
	        <h1 class="block-header">
	            Sit-ups
	        </h1>
	        <div class="block-text">
	            <div id="holder"></div>
	            <!--  <div id="chart_div"></div> -->
	             
	            <ul style="font-size: 18px;">
	                <g:if test="${UserSitupsInstanceList.size == 0 }">
	                    <li><h4>None</h4></li>
	                </g:if>
	                <g:else>
	                    <g:each in="${UserSitupsInstanceList }" var="data">
	                        <li>
	                            <span style="display: inline-block; width: 120px;">${data.situps }</span> 
	                            <span style="display: inline-block;">[ ${data.date } ]</span>
	                        </li>
	                    </g:each>
	                </g:else>
	            </ul>
	            
	        </div>
	    </div>
	    
	    <div class="block span4">
	        
	        <h1 class="block-header">
	            Squats
	        </h1>
	        <div class="block-text">
	            <div id="holder"></div>
	            <!--  <div id="chart_div"></div> -->
	             
	            <ul style="font-size: 18px;">
	                <g:if test="${UserSquatsInstanceList.size == 0 }">
	                    <li><h4>None</h4></li>
	                </g:if>
	                <g:else>
	                    <g:each in="${UserSquatsInstanceList }" var="data">
	                        <li>
	                            <span style="display: inline-block; width: 120px;">${data.squats }</span> 
	                            <span style="display: inline-block;">[ ${data.date } ]</span>
	                        </li>
	                    </g:each>
	                </g:else>
	            </ul>
	            
	        </div>
	    </div>
	</div>
	
	
    <div class="block-text">
        <g:form action="saveExercise" class="form-hidden" >
            <div id="exercise_add" class="add-section" style="display: none;">
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'steps', 'error')} required">
                    <label for="steps">
                        <g:message code="userConditions.steps.label" default="Steps taken" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="steps" value="${userExerciseInstance?.steps}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'pushups', 'error')} required">
                    <label for="pushups">
                        <g:message code="userConditions.pushups.label" default="Push-ups" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="pushups" value="${userExerciseInstance?.pushups}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'situps', 'error')} required">
                    <label for="situps">
                        <g:message code="userConditions.situps.label" default="Sit-ups" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="situps" value="${userExerciseInstance?.situps}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'squats', 'error')} required">
                    <label for="squats">
                        <g:message code="userConditions.squats.label" default="Squats" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="squats" value="${userExerciseInstance?.squats}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'date', 'error')} required">
                    <label for="date">
                        <g:message code="project.date.label" default="Date" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:datePicker name="date" precision="day"  value="${userExerciseInstance?.date}"  />
                </div>
                
                
                <div class="fieldcontain ${hasErrors(bean: userExerciseInstance, field: 'user', 'error')} required hidden">
                    <label for="user">
                        <g:message code="project.user.label" default="User" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userExerciseInstance?.user?.id}" class="many-to-one"/>
                </div>
                
                
                
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
                </fieldset>
                
            </div>
        </g:form>
    </div>
</div>










