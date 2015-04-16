

<p><span style="font-size:16px; font-weight:bold; margin:10px;">Please select the number that most closely corresponds to your condition:</span></p>
<g:each in="${QuestionsInstanceList }" var="data">
    <div id="${counter }" class="row">
        <div>${data.question_text }</div>
        
            <% def count=10 %>
            
            
            
            <table>
	           
	            <tr>
	                <td colspan="5">
	                    <table class="reg1">
	                        <tbody>
	                            <tr>
	                                <td colspan="3" id="ce" style="font-weight: bold;" align="center">0</td>
	                            </tr>
	                            <tr>
	                                <td align="left" style="font-size: 12px; font-weight: bold; width: 100px;">No Pain</td>
	                                <td>
	                                    <div id="ddi" 
	                                        style="width: 400px; height: 20px; overflow: auto;">
	                                        <input id="question${data.question_id }" type="range" name="Q${data.question_id }" value="0" min="0" max="10" step="0.1" style="width: 85%">
	                                    </div>
	                                </td>
	                                <td align="right" style="font-weight: bold">Severe Pain</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </td>
	            </tr>
            </table>
            
            
            
    </div>
    <br /><br />
    <g:set var="counter" value="${counter + 1}" />
</g:each>

<script type="text/javascript">
    document.getElementById('question62').addEventListener('change', function() {
        var ss = 0;
        var x = document.getElementById("question62").value;
        if (x != ss) {
            ss = x;
            document.getElementById('ce').innerText = ss;
            //document.forms["f1"].a45.value = ss;
        }
    });
</script>
