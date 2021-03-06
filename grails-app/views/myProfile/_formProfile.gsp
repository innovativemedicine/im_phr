<%@ page import="phr.UserProfile"%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'firstName', 'error')} required">
			<label for="firstName">
				<g:message code="userProfile.firstName.label" default="First Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="firstName" value="${userProfileInstance?.firstName}" />
		</div>
	</div>

	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'middleName', 'error')}">
			<label for="middleName">
				<g:message code="userProfile.middleName.label" default="Middle Name" />
			</label>
			<g:textField class="span2" name="middleName" value="${userProfileInstance?.middleName}" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'lastName', 'error')} required">
			<label for="lastName">
				<g:message code="userProfile.lastName.label" default="Last Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="lastName" value="${userProfileInstance?.lastName}" />
		</div>
	</div>
</div>
<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'homePhone', 'error')} required">
			<label for="homePhone">
				<g:message code="userProfile.homePhone.label" default="Home Phone" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="homePhone" value="${userProfileInstance?.homePhone}" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'cellPhone', 'error')} required">
			<label for="cellPhone">
				<g:message code="userProfile.cellPhone.label" default="Cell Phone" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="cellPhone" value="${userProfileInstance?.cellPhone}" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'email', 'error')} required">
			<label for="email">
				<g:message code="userProfile.email.label" default="Email" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="email" value="${userProfileInstance?.email}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span6">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'addressOne', 'error')} required">
			<label for="addressOne">
				<g:message code="userProfile.addressOne.label" default="Address" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span5" name="addressOne" value="${userProfileInstance?.addressOne}" />
		</div>
	</div>
</div>

<%--<div class="row">--%>
<%--	<div class="span6">--%>
<%--		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'addressTwo', 'error')} required">--%>
<%--			<label for="addressTwo">--%>
<%--				<g:message code="userProfile.addressTwo.label" default="Address 2" />--%>
<%--				<span class="required-indicator">*</span>--%>
<%--			</label>--%>
<%--			<g:textField class="span5" name="addressTwo" value="${userProfileInstance?.addressTwo}" />--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>

<div class="row">
	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'city', 'error')} required">
			<label for="city">
				<g:message code="userProfile.city.label" default="City" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="city" value="${userProfileInstance?.city}" />
		</div>
	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'province', 'error')} required">
			<label for="province">
				<g:message code="userProfile.province.label" default="Province" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="province" value="${userProfileInstance?.province}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'country', 'error')} required">
			<label for="country">
				<g:message code="userProfile.country.label" default="Country" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="country" value="${userProfileInstance?.country}" />
		</div>
	</div>
	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'postalCode', 'error')} required">
			<label for="postalCode">
				<g:message code="userProfile.postalCode.label" default="Postal Code" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="postalCode" value="${userProfileInstance?.postalCode}" />
		</div>
	</div>
</div>





<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'birthday', 'error')} required">
			<label for="birthday">
				<g:message code="project.birthday.label" default="Birthday" />
				<span class="required-indicator">*</span>
			</label>
			<calendar:datePicker class="span2" name="birthday" value="${userProfileInstance?.birthday}" dateFormat="%d-%m-%Y" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'gender', 'error')} required">
			<label for="gender">
				<g:message code="userProfile.gender.label" default="Gender" />
				<span class="required-indicator">*</span>
			</label>
			<g:select class="span2" name="gender" from="${UserProfile?.constraints.gender.inList}"
				keys="${UserProfile?.constraints.gender.inList}" noSelection="['null':'Select a value']" optionKey="gender"
				value="${userProfileInstance?.gender}" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'maritalStatus', 'error')} required">
			<label for="maritalStatus">
				<g:message code="userProfile.maritalStatus.label" default="Marital Status" />
				<span class="required-indicator">*</span>
			</label>
			<g:select class="span2" name="maritalStatus" from="${UserProfile?.constraints.maritalStatus.inList}"
				keys="${UserProfile?.constraints.maritalStatus.inList}" noSelection="['null':'Select a value']" optionKey="maritalStatus"
				value="${userProfileInstance?.maritalStatus}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">

		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'bloodType', 'error')} required">
			<label for="bloodType">
				<g:message code="userProfile.bloodType.label" default="Blood Type" />
				<span class="required-indicator">*</span>
			</label>
			<g:select class="span2" name="bloodType" from="${UserProfile?.constraints.bloodType.inList}"
				keys="${UserProfile?.constraints.bloodType.inList}" noSelection="['null':'Select a value']" optionKey="bloodType"
				value="${userProfileInstance?.bloodType}" />
		</div>

	</div>

	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'primaryLanguage', 'error')} required">
			<label for="primaryLanguage">
				<g:message code="userProfile.primaryLanguage.label" default="Primary Language" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="primaryLanguage" value="${userProfileInstance?.primaryLanguage}" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'race', 'error')} required">
			<label for="race">
				<g:message code="userProfile.race.label" default="Race" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="race" value="${userProfileInstance?.race}" />
		</div>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: userConditionsInstance, field: 'user', 'error')} required hidden">
	<label for="user">
		<g:message code="project.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required=""
		value="${userConditionsInstance?.user?.id}" class="many-to-one" />
</div>


