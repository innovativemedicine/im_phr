<%@ page import="phr.UserProfile"%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'name', 'error')} required">
			<label for="name">
				<g:message code="userPhysicianInfo.name.label" default="Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="name" value="${userPhysicianInfoInstance?.name}" />
		</div>
	</div>
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'occupation', 'error')} required">
			<label for="occupation">
				<g:message code="userPhysicianInfo.occupation.label" default="Occupation" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="occupation" value="${userPhysicianInfoInstance?.occupation}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'phoneNumberOne', 'error')} required">
			<label for="phoneNumberOne">
				<g:message code="userPhysicianInfo.phoneNumberOne.label" default="Phone Number One" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="phoneNumberOne" value="${userPhysicianInfoInstance?.phoneNumberOne}" />
		</div>
	</div>
<%--	<div class="span3">--%>
<%--		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'phoneNumberTwo', 'error')} required">--%>
<%--			<label for="phoneNumberTwo">--%>
<%--				<g:message code="userPhysicianInfo.phoneNumberTwo.label" default="Phone Number Two" />--%>
<%--				<span class="required-indicator">*</span>--%>
<%--			</label>--%>
<%--			<g:textField class="span2" name="phoneNumberTwo" value="${userPhysicianInfoInstance?.phoneNumberTwo}" />--%>
<%--		</div>--%>
<%----%>
<%--	</div>--%>
</div>
<div class="row">
	<div class="span6">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'addressOne', 'error')}">
			<label for="addressOne">
				<g:message code="userPhysicianInfo.addressOne.label" default="Address One" />
			</label>
			<g:textField class="span5" name="addressOne" value="${userPhysicianInfoInstance?.addressOne}" />
		</div>
	</div>
</div>

<%--<div class="row">--%>
<%--	<div class="span6">--%>
<%--		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'addressTwo', 'error')} required">--%>
<%--			<label for="addressTwo">--%>
<%--				<g:message code="userPhysicianInfo.addressTwo.label" default="Address Two" />--%>
<%--				<span class="required-indicator">*</span>--%>
<%--			</label>--%>
<%--			<g:textField class="span5" name="addressTwo" value="${userPhysicianInfoInstance?.addressTwo}" />--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'city', 'error')} required">
			<label for="city">
				<g:message code="userPhysicianInfo.city.label" default="City" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="city" value="${userPhysicianInfoInstance?.city}" />
		</div>
	</div>
	<div class="span6">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'province', 'error')} required">
			<label for="province">
				<g:message code="userPhysicianInfo.province.label" default="Province" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="province" value="${userPhysicianInfoInstance?.province}" />
		</div>
	</div>

</div>

<div class="row">
	<div class="span3">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'country', 'error')} required">
			<label for="country">
				<g:message code="userPhysicianInfo.country.label" default="Country" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="country" value="${userPhysicianInfoInstance?.country}" />
		</div>
	</div>

	<div class="span2">
		<div class="fieldcontain ${hasErrors(bean: userPhysicianInfoInstance, field: 'postalCode', 'error')} required">
			<label for="postalCode">
				<g:message code="userPhysicianInfo.postalCode.label" default="Postal Code" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="span2" name="postalCode" value="${userPhysicianInfoInstance?.postalCode}" />
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