

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




<!-- 

<form name="f1"><br><p>
<span style="font-size:16px; font-weight:bold; margin:10px;">Please select the number that most closely corresponds to your condition:</span></p>
<table width="98%" style="font-size:12px; border-collapse:collapse; margin:10px;border-style:solid; border-width:1px; border-color:#c5dbec;" class="aclass">
<tbody><tr style="background-color:#eff6fa;"><td colspan="13" style="text-align:left;font-size:14px;"><b>1.</b> Putting on your socks or tights without help or aids (e.g., sock aids)
</td></tr>
<tr style="background-color:#eff6fa;">
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
</tr>
<tr style="background-color:#eff6fa;">
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
<tr style="background-color:#eff6fa; "><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="text-align:left;font-size:14px;"><b>2.</b>  Bending forward from the waist to pick up a pen from the floor without aid
</td></tr>
<tr>
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
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
 
</tr><tr><td>&nbsp;</td></tr>
<tr><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;"><b>3.</b>   Reaching up to a high shelf without help or aids (e.g., helping hand)
</td></tr>
<tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
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
<tr style="background-color:#eff6fa; border:none;"><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="text-align:left;font-size:14px;"><b>4.</b>  Getting up out of an armless dining room chair without using your hands or any other help
</td></tr>
<tr>
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
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
 
</tr><tr><td>&nbsp;</td></tr>
<tr><td colspan="13" style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;"><b>5.</b>   Getting up off the floor without help from lying on your back
</td></tr>
<tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
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
<tr style="background-color:#eff6fa; border:none;"><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="text-align:left;font-size:14px;"><b>6.</b>  Standing unsupported for 10 minutes without discomfort
</td></tr>
<tr>
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
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
 
</tr><tr><td colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;"><b>7.</b>   Climbing 12-15 steps without using a handrail or walking aid (one foot on each step)
</td></tr><tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
</tr>
<tr style="background-color:#eff6fa; border:none;"> 
<td><input type="radio" name="a6" value="0"></td>
<td><input type="radio" name="a6" value="1"></td>
<td><input type="radio" name="a6" value="2"></td>
<td><input type="radio" name="a6" value="3"></td>
<td><input type="radio" name="a6" value="4"></td>
<td><input type="radio" name="a6" value="5"></td>
<td><input type="radio" name="a6" value="6"></td>
<td><input type="radio" name="a6" value="7"></td>
<td><input type="radio" name="a6" value="8"></td>
<td><input type="radio" name="a6" value="9"></td>
<td><input type="radio" name="a6" value="10"></td>
 
</tr><tr style="background-color:#eff6fa; border:none;"><td colspan="13">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="text-align:left;font-size:14px;"><b>8.</b>  Looking over your shoulder without turning your body
</td></tr><tr>
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
</tr>
<tr> 
<td><input type="radio" name="a7" value="0"></td>
<td><input type="radio" name="a7" value="1"></td>
<td><input type="radio" name="a7" value="2"></td>
<td><input type="radio" name="a7" value="3"></td>
<td><input type="radio" name="a7" value="4"></td>
<td><input type="radio" name="a7" value="5"></td>
<td><input type="radio" name="a7" value="6"></td>
<td><input type="radio" name="a7" value="7"></td>
<td><input type="radio" name="a7" value="8"></td>
<td><input type="radio" name="a7" value="9"></td>
<td><input type="radio" name="a7" value="10"></td>
 
</tr><tr><td colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td colspan="13" style="text-align:left;font-size:14px;"><b>9.</b>   Doing physically demanding activities (e.g., physiotherapy exercises, gardening or sports)
</td></tr><tr style="background-color:#eff6fa; border:none;">
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
</tr>
<tr style="background-color:#eff6fa; border:none;"> 
<td><input type="radio" name="a8" value="0"></td>
<td><input type="radio" name="a8" value="1"></td>
<td><input type="radio" name="a8" value="2"></td>
<td><input type="radio" name="a8" value="3"></td>
<td><input type="radio" name="a8" value="4"></td>
<td><input type="radio" name="a8" value="5"></td>
<td><input type="radio" name="a8" value="6"></td>
<td><input type="radio" name="a8" value="7"></td>
<td><input type="radio" name="a8" value="8"></td>
<td><input type="radio" name="a8" value="9"></td>
<td><input type="radio" name="a8" value="10"></td>
 
</tr><tr style="background-color:#eff6fa; border:none;"><td colspan="13">&nbsp;</td></tr>
<tr style="background-color:#eff6fa; border:none;"><td style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#c5dbec;" colspan="13">&nbsp;</td></tr>
<tr><td colspan="13" style="text-align:left;font-size:14px;"><b>10.</b> Doing a full day<sup>,</sup>s activities whether it be at home or at work
</td></tr><tr>
<td rowspan="2">Easy</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td rowspan="2">Impossible</td>
</tr>
<tr> 
<td><input type="radio" name="a9" value="0"></td>
<td><input type="radio" name="a9" value="1"></td>
<td><input type="radio" name="a9" value="2"></td>
<td><input type="radio" name="a9" value="3"></td>
<td><input type="radio" name="a9" value="4"></td>
<td><input type="radio" name="a9" value="5"></td>
<td><input type="radio" name="a9" value="6"></td>
<td><input type="radio" name="a9" value="7"></td>
<td><input type="radio" name="a9" value="8"></td>
<td><input type="radio" name="a9" value="9"></td>
<td><input type="radio" name="a9" value="10"></td>
 
</tr>
<tr><td colspan="13">&nbsp;</td></tr><tr><td colspan="13">&nbsp;</td></tr>
</tbody></table>

<p></p>
<div align="center"><input type="button" name="butt" id="butt" value="Submit" onclick="chck();" class="bluebutt" style="font-weight:bold;font-size:14;"></div>
<input id="score" name="score" value="0" type="hidden">
<p></p>
</form>

 -->