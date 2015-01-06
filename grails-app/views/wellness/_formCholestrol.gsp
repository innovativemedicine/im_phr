

<div class="block span6">
    
    <a id="wellness-button" class="wellness-button btn btn-primary">Add</a>
    
    <h1 class="block-header">
        Cholestrol
    </h1>
    <div class="block-text">
        <div id="holder"></div>
        <!--  <div id="chart_div"></div> -->
         
        <ul class="block-text-18">
            <g:if test="${UserCholestrolInstanceList.size == 0 }">
                <li><h4>None</h4></li>
            </g:if>
            <g:else>
				<g:each in="${UserCholestrolInstanceList }" var="data">
				    <li>
				        <span class="value-block">${data.amount } mg/dl</span> 
				        <span class="difference-block">(${data.previous_change })</span> 
				        <span class="date-block">[ ${data.date } ]</span>
				    </li>
				</g:each>
            </g:else>
        </ul>
        
        
        <g:form action="saveCholestrol" class="form-hidden" >
	        <div id="cholestrol_add" class="add-section" style="display: none;">
	            <div class="fieldcontain ${hasErrors(bean: userCholestrolInstance, field: 'amount', 'error')} required">
	                <label for="amount">
	                    <g:message code="userConditions.amount.label" default="Amount (mg/dl)" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:textField name="amount" value="${userCholestrolInstance?.amount}"/>
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCholestrolInstance, field: 'date', 'error')} required">
	                <label for="date">
	                    <g:message code="project.date.label" default="Date" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:datePicker name="date" precision="day"  value="${userCholestrolInstance?.date}"  />
	            </div>
	            
	            
	            <div class="fieldcontain ${hasErrors(bean: userCholestrolInstance, field: 'user', 'error')} required hidden">
	                <label for="user">
	                    <g:message code="project.user.label" default="User" />
	                    <span class="required-indicator">*</span>
	                </label>
	                <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userCholestrolInstance?.user?.id}" class="many-to-one"/>
	            </div>
	            
	            
	            
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
	            </fieldset>
	            
	        </div>
        </g:form>
    </div>
</div>








