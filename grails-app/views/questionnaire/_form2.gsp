

<p><span style="font-size:16px; font-weight:bold; margin:10px;">Please select the number that most closely corresponds to your condition:</span></p>
<g:each in="${QuestionsInstanceList }" var="data">
    <div id="${counter }" class="row">
        <div>${counter }.&nbsp;&nbsp;${data.question_text }</div>
        
        <div class="btn-group q_buttons_row" data-toggle="buttons">
            <% def count=10 %>
            <div class="q_buttons_values">Easy</div>
            <g:each in="${0..count}" var="c">
                <label class="btn q_buttons_spacing">
                    ${c }<br />
                    <input type="radio" name="Q${data.question_id }" id="answer${data.question_id }_${c }" value="${c }" >
                </label>
            </g:each>
            <div class="q_buttons_values">Impossible</div>
        </div>
    </div>
    <br /><br />
    <g:set var="counter" value="${counter + 1}" />
</g:each>
