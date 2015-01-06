

<div class="block span6">
    
    <a id="wellness-button" class="wellness-button btn btn-primary">Add</a>
    
    <h1 class="block-header">
        Blood Pressure
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul class="block-text-18">
            <g:if test="${UserBloodPressureInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
				<g:each in="${UserBloodPressureInstanceList }" var="data">
				    <li>
				        <span>${data.systolic }/${data.diastolic } mm Hg</span>  
				        <span class="date-block">[ ${data.date } ]</span>
				    </li>
				</g:each>
            </g:else>
        </ul>
        
        
        <g:form action="saveBloodPressure" class="form-hidden" >
	        <div id="bloodpressure_add" class="add-section" style="display: none;">
	            
	            <div class="fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'systolic', 'error')} required">
                    <label for="systolic">
                        <g:message code="userConditions.systolic.label" default="Systolic" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="systolic" value="${userBloodPressureInstance?.systolic}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'diastolic', 'error')} required">
                    <label for="diastolic">
                        <g:message code="userConditions.diastolic.label" default="Diastolic" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="diastolic" value="${userBloodPressureInstance?.diastolic}"/>
                </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'date', 'error')} required">
	                <label for="date">
	                    <g:message code="project.date.label" default="Date" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:datePicker name="date" precision="day"  value="${userBloodPressureInstance?.date}"  />
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userBloodPressureInstance, field: 'user', 'error')} required hidden">
	                <label for="user">
	                    <g:message code="project.user.label" default="User" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userBloodPressureInstance?.user?.id}" class="many-to-one"/>
	            </div>
	            
	            
	            
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
	            </fieldset>
	            
	        </div>
        </g:form>
    </div>
</div>








