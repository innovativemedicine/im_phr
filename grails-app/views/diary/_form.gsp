<%@ page import="phr.UserDiary" %>


<div class="fieldcontain ${hasErrors(bean: userDiaryInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="userDiary.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topic" value="${userDiaryInstance?.topic}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userDiaryInstance, field: 'entry', 'error')} ">
    <label for="entry">
        <g:message code="userDiary.entry.label" default="Entry" />
    </label>
    <g:textArea name="entry" rows="15" style="width: 650px" value="${userDiaryInstance?.entry}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userDiaryInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="project.date.label" default="Date" />
        <span class="required-indicator">*</span>
    </label>
    <calendar:datePicker name="date" value="${userDiaryInstance?.date}" dateFormat="%d-%m-%Y" />
</div>


<div class="fieldcontain ${hasErrors(bean: userDiaryInstance, field: 'user', 'error')} required hidden">
    <label for="user">
        <g:message code="project.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${phr.Login.findByUserName(session.user.userName)}" optionKey="id" required="" value="${userDiaryInstance?.user?.id}" class="many-to-one"/>
</div>




