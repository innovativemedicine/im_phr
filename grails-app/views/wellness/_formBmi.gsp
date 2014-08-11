
<div class="block span4">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        BMI&nbsp;
        <span id="bmi-tooltip" type="button" class="pointer" data-toggle="tooltip" data-placement="right" title="Body Mass Index - A relative measure of your mass and height. It is used to assess weight categories to check if it could lead to health problems.
        BMI Categories: 
		Underweight = <18.5
		Normal weight = 18.5–24.9 
		Overweight = 25–29.9 
		Obesity = BMI of 30 or greater
        "><i class="icon-question-sign"></i></span>
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul class="block-text-18">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span class="value-block">${data.bmi }</span> 
                        <span class="date-block">[ ${data.date } ]</span>
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
         
        <ul class="block-text-18">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span class="value-block">${data.weight } lbs</span> 
                        <span class="date-block">[ ${data.date } ]</span>
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
         
        <ul class="block-text-18">
            <g:if test="${UserBmiInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
                <g:each in="${UserBmiInstanceList }" var="data">
                    <li>
                        <span class="value-block">${data.height } in</span> 
                        <span class="date-block">[ ${data.date } ]</span>
                    </li>
                </g:each>
            </g:else>
        </ul>
        
    </div>
</div>


<script type="text/javascript">
$('#bmi-tooltip').tooltip()
</script>










