<%@ page import="im.UserProfile" %>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="userPhysicianInfo.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${userPhysicianInfoInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'addressOne', 'error')}">
    <label for="addressOne">
        <g:message code="userPhysicianInfo.addressOne.label" default="Address One" />
    </label>
    <g:textField name="addressOne" value="${userPhysicianInfoInstance?.addressOne}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'addressTwo', 'error')} required">
    <label for="addressTwo">
        <g:message code="userPhysicianInfo.addressTwo.label" default="Address Two" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="addressTwo" value="${userPhysicianInfoInstance?.addressTwo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="userPhysicianInfo.city.label" default="City" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" value="${userPhysicianInfoInstance?.city}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'province', 'error')} required">
    <label for="province">
        <g:message code="userPhysicianInfo.province.label" default="Province" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="province" value="${userPhysicianInfoInstance?.province}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="userPhysicianInfo.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="country" value="${userPhysicianInfoInstance?.country}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'phoneNumberOne', 'error')} required">
    <label for="phoneNumberOne">
        <g:message code="userPhysicianInfo.phoneNumberOne.label" default="Phone Number One" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phoneNumberOne" value="${userPhysicianInfoInstance?.phoneNumberOne}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'phoneNumberTwo', 'error')} required">
    <label for="phoneNumberTwo">
        <g:message code="userPhysicianInfo.phoneNumberTwo.label" default="Phone Number Two" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phoneNumberTwo" value="${userPhysicianInfoInstance?.phoneNumberTwo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'postalCode', 'error')} required">
    <label for="postalCode">
        <g:message code="userPhysicianInfo.postalCode.label" default="Postal Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="postalCode" value="${userPhysicianInfoInstance?.postalCode}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'occupation', 'error')} required">
    <label for="occupation">
        <g:message code="userPhysicianInfo.occupation.label" default="Occupation" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="occupation" value="${userPhysicianInfoInstance?.occupation}"/>
</div>





<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userConditionsInstance?.user?.id}" class="many-to-one"/>
</div>


