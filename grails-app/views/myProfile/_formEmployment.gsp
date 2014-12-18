<%@ page import="phr.UserProfile" %>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="userEmployment.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${userEmploymentInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'occupation', 'error')} required">
    <label for="occupation">
        <g:message code="userEmployment.occupation.label" default="Occupation" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="occupation" value="${userEmploymentInstance?.occupation}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'addressOne', 'error')}">
    <label for="addressOne">
        <g:message code="userEmployment.addressOne.label" default="Address One" />
    </label>
    <g:textField name="addressOne" value="${userEmploymentInstance?.addressOne}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'addressTwo', 'error')} required">
    <label for="addressTwo">
        <g:message code="userEmployment.addressTwo.label" default="Address Two" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="addressTwo" value="${userEmploymentInstance?.addressTwo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="userEmployment.city.label" default="City" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" value="${userEmploymentInstance?.city}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'province', 'error')} required">
    <label for="province">
        <g:message code="userEmployment.province.label" default="Province" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="province" value="${userEmploymentInstance?.province}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="userEmployment.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="country" value="${userEmploymentInstance?.country}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'phoneNumber', 'error')} required">
    <label for="phoneNumber">
        <g:message code="userEmployment.phoneNumber.label" default="Phone Number" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phoneNumber" value="${userEmploymentInstance?.phoneNumber}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userEmploymentInstance, field: 'postalCode', 'error')} required">
    <label for="postalCode">
        <g:message code="userEmployment.postalCode.label" default="Postal Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="postalCode" value="${userEmploymentInstance?.postalCode}"/>
</div>







<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required hidden">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userConditionsInstance?.user?.id}" class="many-to-one"/>
</div>


