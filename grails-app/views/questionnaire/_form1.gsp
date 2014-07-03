

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
<table width="98%" style="text-align:center; font-size:12px;  border-collapse:collapse; margin:10px;border-style:none; border-width:1px; border-color:#c5dbec; border-top-style:none;">
<tbody><tr><td colspan="7">&nbsp;</td></tr><tr><td width="100px">&nbsp;</td><td>0 hrs (=0)</td><td>1/2 hr (=2.5)</td><td>1 hr (=5)</td><td>1 1/2 hr (=7.5)</td><td>2 hrs (=10)</td><td width="100px">&nbsp;</td></tr>
<tr><td colspan="7">&nbsp;</td></tr><tr><td colspan="7">&nbsp;</td></tr>
</tbody></table>



<!-- 

<form name="f1"><br><br><p>
<span style="font-size:16px; font-weight:bold; margin:10px;">Please select the number that most closely corresponds to your condition during the <span style="font-size:18px; text-decoration: underline;background-color:#eff6fa;">past week</span>:</span></p>
<table width="98%" style="font-size:12px;border-collapse:collapse; margin:10px;border-style:none; border-width:1px; border-color:#c5dbec; border-bottom-style:none;" class="aclass">
<tbody>
<tr><td colspan="13" style="text-align:left;font-size:14px; background-color:#eff6fa; border:none;">1.   How would you describe the overall level of fatigue/tiredness you have experienced?
</td></tr>
<tr style="background-color:#eff6fa; border:none;">
    <td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr style="background-color:#eff6fa; border:none;">
	<td><input type="radio" name="a0" value="0"></td>
	<td><input type="radio" name="a0" value="1"></td>
	<td><input type="radio" name="a0" value="2"></td>
	<td><input type="radio" name="a0" value="3"></td>
	<td><input type="radio" name="a0" value="4"></td>
	<td><input type="radio" name="a0" value="5"></td>
	<td><input type="radio" name="a0" value="6"></td>
	<td><input type="radio" name="a0" value="7"></td>
	<td><input type="radio" name="a0" value="8"></td>
	<td><input type="radio" name="a0" value="9"></td>
	<td><input type="radio" name="a0" value="10"></td>
</tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13">&nbsp;</td></tr>



<tr><td colspan="13" style="text-align:left;font-size:14px;">2. How would you describe the overall level of inflammatory neck, back or hip pain you have had?
</td></tr>
<tr>
<td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr> 
<td><input type="radio" name="a1" value="0"></td>
<td><input type="radio" name="a1" value="1"></td>
<td><input type="radio" name="a1" value="2"></td>
<td><input type="radio" name="a1" value="3"></td>
<td><input type="radio" name="a1" value="4"></td>
<td><input type="radio" name="a1" value="5"></td>
<td><input type="radio" name="a1" value="6"></td>
<td><input type="radio" name="a1" value="7"></td>
<td><input type="radio" name="a1" value="8"></td>
<td><input type="radio" name="a1" value="9"></td>
<td><input type="radio" name="a1" value="10"></td>
 
</tr><tr><td colspan="13">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;background-color:#eff6fa; border:none;">3.    How would you describe the overall level of pain/swelling in joints other than neck, back or hips you have had?
</td></tr>
<tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr style="background-color:#eff6fa; border:none;"> 
<td><input type="radio" name="a2" value="0"></td>
<td><input type="radio" name="a2" value="1"></td>
<td><input type="radio" name="a2" value="2"></td>
<td><input type="radio" name="a2" value="3"></td>
<td><input type="radio" name="a2" value="4"></td>
<td><input type="radio" name="a2" value="5"></td>
<td><input type="radio" name="a2" value="6"></td>
<td><input type="radio" name="a2" value="7"></td>
<td><input type="radio" name="a2" value="8"></td>
<td><input type="radio" name="a2" value="9"></td>
<td><input type="radio" name="a2" value="10"></td>
 
</tr><tr style="background-color:#eff6fa; border:none;"><td colspan="13">&nbsp;</td></tr>

<tr><td colspan="13" style="text-align:left;font-size:14px;">4. How would you describe the overall level of discomfort you have had from any areas tender to touch or pressure?
</td></tr>
<tr>
<td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr> 
<td><input type="radio" name="a3" value="0"></td>
<td><input type="radio" name="a3" value="1"></td>
<td><input type="radio" name="a3" value="2"></td>
<td><input type="radio" name="a3" value="3"></td>
<td><input type="radio" name="a3" value="4"></td>
<td><input type="radio" name="a3" value="5"></td>
<td><input type="radio" name="a3" value="6"></td>
<td><input type="radio" name="a3" value="7"></td>
<td><input type="radio" name="a3" value="8"></td>
<td><input type="radio" name="a3" value="9"></td>
<td><input type="radio" name="a3" value="10"></td>
 
</tr><tr><td colspan="13">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;background-color:#eff6fa; border:none;">5.    How would you describe the overall level of morning stiffness you have had from the time you wake up?
</td></tr>
<tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr style="background-color:#eff6fa; border:none;"> 
<td><input type="radio" name="a4" value="0"></td>
<td><input type="radio" name="a4" value="1"></td>
<td><input type="radio" name="a4" value="2"></td>
<td><input type="radio" name="a4" value="3"></td>
<td><input type="radio" name="a4" value="4"></td>
<td><input type="radio" name="a4" value="5"></td>
<td><input type="radio" name="a4" value="6"></td>
<td><input type="radio" name="a4" value="7"></td>
<td><input type="radio" name="a4" value="8"></td>
<td><input type="radio" name="a4" value="9"></td>
<td><input type="radio" name="a4" value="10"></td>
 
</tr><tr style="background-color:#eff6fa; border:none;"><td colspan="13">&nbsp;</td></tr>

<tr><td colspan="13" style="text-align:left;font-size:14px;">6. How long does your morning stiffness last from the time you wake up?
</td></tr>
<tr>
<td rowspan="2">None</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Very severe</td>
</tr>
<tr> 
<td><input type="radio" name="a5" value="0"></td>
<td><input type="radio" name="a5" value="1"></td>
<td><input type="radio" name="a5" value="2"></td>
<td><input type="radio" name="a5" value="3"></td>
<td><input type="radio" name="a5" value="4"></td>
<td><input type="radio" name="a5" value="5"></td>
<td><input type="radio" name="a5" value="6"></td>
<td><input type="radio" name="a5" value="7"></td>
<td><input type="radio" name="a5" value="8"></td>
<td><input type="radio" name="a5" value="9"></td>
<td><input type="radio" name="a5" value="10"></td> 
</tr>
</tbody></table>
<table width="98%" style="text-align:center; font-size:12px;  border-collapse:collapse; margin:10px;border-style:none; border-width:1px; border-color:#c5dbec; border-top-style:none;">
<tbody><tr><td colspan="7">&nbsp;</td></tr><tr><td width="100px">&nbsp;</td><td>0 hrs (=0)</td><td>1/2 hr (=2.5)</td><td>1 hr (=5)</td><td>1 1/2 hr (=7.5)</td><td>2 hrs (=10)</td><td width="100px">&nbsp;</td></tr>
<tr><td colspan="7">&nbsp;</td></tr><tr><td colspan="7">&nbsp;</td></tr>
</tbody></table>
<p></p>
<div align="center"><input type="button" name="butt" id="butt" value="Submit" onclick="chck();" class="bluebutt" style="font-weight:bold;font-size:14;"></div>
<input id="score" name="score" value="0" type="hidden">
<p></p>
</form>

 -->