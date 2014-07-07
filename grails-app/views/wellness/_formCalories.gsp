

<div class="block span6">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        Calories
    </h1>
    <div class="block-text">
        <g:if test="${UserCalories == null }">
        <h3>None</h3>
        </g:if>
        <g:else>
            <div id="holder"></div>
            <!--  <div id="chart_div"></div> -->
             
            <ul style="font-size: 18px;">
                <g:if test="${UserConditionsInstanceList.size == 0 }">
                    <li><h4>None</h4></li>
                </g:if>
                <g:else>
	                <g:each in="${UserCalories }" var="data">
	                    <li>
	                        <span style="display: inline-block; width: 120px;">${data.amount } calories</span> 
	                        <span style="display: inline-block; width: 150px;">(${data.previous_change })</span> 
	                        <span style="display: inline-block;">[ ${data.date } ]</span>
	                    </li>
	                </g:each>
                </g:else>
            </ul>
        </g:else>
        
        
        <g:form action="save" >
	        <div id="calories_add" class="" style="display: none;">
	            <div class="fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'amount', 'error')} required">
	                <label for="amount">
	                    <g:message code="userConditions.amount.label" default="Amount (calories)" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:textField name="amount" value="${userCaloriesInstance?.amount}"/>
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'date', 'error')} required">
	                <label for="date">
	                    <g:message code="project.date.label" default="Date" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:datePicker name="date" precision="day"  value="${userCaloriesInstance?.date}"  />
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCaloriesInstance, field: 'user', 'error')} required hidden">
	                <label for="user">
	                    <g:message code="project.user.label" default="User" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userCaloriesInstance?.user?.id}" class="many-to-one"/>
	            </div>
	            
	            
	            
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
	            </fieldset>
	            
	        </div>
        </g:form>
    </div>
</div>








