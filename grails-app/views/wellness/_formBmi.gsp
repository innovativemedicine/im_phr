

<div class="block span4">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        BMI
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul style="font-size: 18px;">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span style="display: inline-block; width: 120px;">${data.bmi } kg/m2</span> 
                        <span style="display: inline-block;">[ ${data.date } ]</span>
                    </li>
                </g:each>
            </g:else>
        </ul>
        
        
        <g:form action="saveBmi" class="form-hidden" >
		    <div id="bmi_add" class="add-section" style="display: none;">
		        <div class="fieldcontain ${hasErrors(bean: userBmiInstance, field: 'weight', 'error')} required">
                    <label for="weight">
                        <g:message code="userConditions.weight.label" default="Weight (lbs)" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="weight" value="${userBmiInstance?.weight}"/>
                </div>
                
                <div class="fieldcontain ${hasErrors(bean: userBmiInstance, field: 'height', 'error')} required">
                    <label for="height">
                        <g:message code="userConditions.height.label" default="Height (inches)" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="height" value="${userBmiInstance?.height}"/>
                </div>
                
		        <div class="fieldcontain ${hasErrors(bean: userBmiInstance, field: 'date', 'error')} required">
		            <label for="date">
		                <g:message code="project.date.label" default="Date" />
		                <span class="required-indicator">*</span>
		            </label>
		            <g:datePicker name="date" precision="day"  value="${userBmiInstance?.date}"  />
		        </div>
		        
		        
		        <div class="fieldcontain ${hasErrors(bean: userBmiInstance, field: 'user', 'error')} required hidden">
		            <label for="user">
		                <g:message code="project.user.label" default="User" />
		                <span class="required-indicator">*</span>
		            </label>
		            <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userBmiInstance?.user?.id}" class="many-to-one"/>
		        </div>
		        
		        
		        
		        <fieldset class="buttons">
		            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
		        </fieldset>
		        
		    </div>
		</g:form>
        
        
    </div>
</div>

<div class="block span4">
    
    <h1 class="block-header">
        Weight
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul style="font-size: 18px;">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span style="display: inline-block; width: 120px;">${data.weight } lbs</span> 
                        <span style="display: inline-block;">[ ${data.date } ]</span>
                    </li>
                </g:each>
            </g:else>
        </ul>
        
    </div>
</div>

<div class="block span4">
    
    <h1 class="block-header">
        Height
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul style="font-size: 18px;">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span style="display: inline-block; width: 120px;">${data.height } in</span> 
                        <span style="display: inline-block;">[ ${data.date } ]</span>
                    </li>
                </g:each>
            </g:else>
        </ul>
        
    </div>
</div>












