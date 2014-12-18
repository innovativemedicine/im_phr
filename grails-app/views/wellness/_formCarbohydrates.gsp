

<div class="block span6">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        Carbohydrates
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul class="block-text-18">
            <g:if test="${UserCarbohydratesInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
				<g:each in="${UserCarbohydratesInstanceList }" var="data">
				    <li>
			            <span class="value-block">${data.amount } grams</span> 
			            <span class="difference-block">(${data.previous_change })</span> 
				        <span class="date-block">[ ${data.date } ]</span>
				    </li>
				</g:each>
            </g:else>
        </ul>
        
        
        <g:form action="saveCarbohydrates" class="form-hidden" >
	        <div id="carbohydrates_add" class="add-section" style="display: none;">
	            <div class="fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'amount', 'error')} required">
	                <label for="amount">
	                    <g:message code="userConditions.amount.label" default="Amount (grams)" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:textField name="amount" value="${userCarbohydratesInstance?.amount}"/>
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'date', 'error')} required">
	                <label for="date">
	                    <g:message code="project.date.label" default="Date" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:datePicker name="date" precision="day"  value="${userCarbohydratesInstance?.date}"  />
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'user', 'error')} required hidden">
	                <label for="user">
	                    <g:message code="project.user.label" default="User" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userCarbohydratesInstance?.user?.id}" class="many-to-one"/>
	            </div>
	            
	            
	            
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
	            </fieldset>
	            
	        </div>
        </g:form>
    </div>
</div>








