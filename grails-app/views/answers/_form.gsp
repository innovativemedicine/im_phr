<%@ page import="phr.Answers" %>



<div class="fieldcontain ${hasErrors(bean: answersInstance, field: 'answerText', 'error')} ">
    <label for="answerText">
        <g:message code="answers.answerText.label" default="Answer" />
    </label>
    <g:textArea name="answerText" rows="3" style="width: 650px" value="${answersInstance?.answerText}"/>
</div>




