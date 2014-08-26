<%@ page import="im.UserProfile" %>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="userContacts.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${userContactsInstance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'addressOne', 'error')}">
    <label for="addressOne">
        <g:message code="userContacts.addressOne.label" default="Address One" />
    </label>
    <g:textField name="addressOne" value="${userContactsInstance?.addressOne}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'addressTwo', 'error')} required">
    <label for="addressTwo">
        <g:message code="userContacts.addressTwo.label" default="Address Two" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="addressTwo" value="${userContactsInstance?.addressTwo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="userContacts.city.label" default="City" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" value="${userContactsInstance?.city}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'province', 'error')} required">
    <label for="province">
        <g:message code="userContacts.province.label" default="Province" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="province" value="${userContactsInstance?.province}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="userContacts.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="country" value="${userContactsInstance?.country}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'phoneNumberOne', 'error')} required">
    <label for="phoneNumberOne">
        <g:message code="userContacts.phoneNumberOne.label" default="Phone Number One" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phoneNumberOne" value="${userContactsInstance?.phoneNumberOne}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'phoneNumberTwo', 'error')} required">
    <label for="phoneNumberTwo">
        <g:message code="userContacts.phoneNumberTwo.label" default="Phone Number Two" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phoneNumberTwo" value="${userContactsInstance?.phoneNumberTwo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'postalCode', 'error')} required">
    <label for="postalCode">
        <g:message code="userContacts.postalCode.label" default="Postal Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="postalCode" value="${userContactsInstance?.postalCode}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userContactsInstance, field: 'relationship', 'error')} required">
    <label for="relationship">
        <g:message code="userContacts.relationship.label" default="Relationship" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="relationship" value="${userContactsInstance?.relationship}"/>
</div>





<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required hidden">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${im.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userConditionsInstance?.user?.id}" class="many-to-one"/>
</div>


