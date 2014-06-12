<!doctype html>
<html>
<head>

<title>Medications</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <h1>Current Medications</h1>
            <table class="table table-hover table-striped">
				<caption>Medication that is currently being taken. Will automatically update when date expires.</caption>
				<thead>
					<tr>
						<th>Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th>Start Date</th>
                        <th>Stop Date</th>
                        <th>Refill Date</th>
                        <th>Reason for taking</th>
                        <th>Edit/Delete</th>
					</tr>
				</thead>
				<tbody>
				    <% def count=5 %>
					<g:each in="${1..count}" var="c">
					<tr>
						<td>Ether ${c}</td>
						<td>15 mL</td>
                        <td>3 times/day</td>
                        <td>Liquid</td>
                        <td>Potent</td>
                        <td>02-1${c}-2014</td>
                        <td>02-18-2014</td>
                        <td>02-29-2014</td>
                        <td>Tired very easily</td>
                        <td style="text-align: center;">
                            <i class="icon-cog"></i>
                            <i class="icon-pencil"></i>
                            <i class="icon-wrench"></i>
                            <i class="icon-search"></i>
                        </td>
					</tr>
					</g:each>
				</tbody>
            </table>
            
            
            <h1>Previous Medications</h1>
            <table class="table table-hover table-striped">
                <caption>Medication that was taken prior to current date.</caption>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th>Start Date</th>
                        <th>Stop Date</th>
                        <th>Refill Date</th>
                        <th>Reason for taking</th>
                        <th>Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${1..count}" var="c">
                    <tr>
                        <td>Ether ${c}</td>
                        <td>15 mL</td>
                        <td>3 times/day</td>
                        <td>Liquid</td>
                        <td>Potent</td>
                        <td>02-1${c}-2014</td>
                        <td>02-18-2014</td>
                        <td>02-29-2014</td>
                        <td>Tired very easily</td>
                        <td style="text-align: center;">
                            <i class="icon-cog"></i>
                            <i class="icon-pencil"></i>
                            <i class="icon-wrench"></i>
                            <i class="icon-search"></i>
                        </td>
                    </tr>
                    </g:each>
                </tbody>
            </table>
            
        </div>
    </div>
</body>