<%@ page import="phr.Questions" %>



<div class="fieldcontain ${hasErrors(bean: questionsInstance, field: 'questionText', 'error')} ">
    <label for="questionText">
        <g:message code="questions.questionText.label" default="Question" />
    </label>
    <g:textArea name="questionText" rows="15" style="width: 650px" value="${questionsInstance?.questionText}"/>
</div>




