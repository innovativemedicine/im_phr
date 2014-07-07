

<div class="block span6">
    
    <a id="wellness-button" class="wellness-button">Add</a>
    
    <h1 class="block-header">
        Carbohydrates
    </h1>
    <div class="block-text">
        <g:if test="${UserCarbohydrates == null }">
        <h3>None</h3>
        </g:if>
        <g:else>
            <div id="holder"></div>
            <!--  <div id="chart_div"></div> -->
             
            <ul style="font-size: 18px;">
                <g:if test="${UserCarbohydrates.size == 0 }">
                    <li><h4>None</h4></li>
                </g:if>
                <g:else>
	                <g:each in="${UserCarbohydrates }" var="data">
	                    <li>
                            <span style="display: inline-block; width: 185px;">${data.amount } calories</span> 
                            <span style="display: inline-block; width: 85px;">(${data.previous_change })</span> 
	                        <span style="display: inline-block;">[ ${data.date } ]</span>
	                    </li>
	                </g:each>
                </g:else>
            </ul>
        </g:else>
        
        
        <g:form action="saveCarbohydrates" class="form-hidden" >
	        <div id="carbohydrates_add" class="add-section" style="display: none;">
	            <div class="fieldcontain ${hasErrors(bean: userCarbohydratesInstance, field: 'amount', 'error')} required">
	                <label for="amount">
	                    <g:message code="userConditions.amount.label" default="Amount (carbohydrates)" />
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
	                <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userCarbohydratesInstance?.user?.id}" class="many-to-one"/>
	            </div>
	            
	            
	            
	            <fieldset class="buttons">
	                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Save')}" />
	            </fieldset>
	            
	        </div>
        </g:form>
    </div>
</div>








