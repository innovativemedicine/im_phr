<!doctype html>
<html>
<head>

<title>Immunizations</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <button type="button" class="add-button btn btn-primary">Add</button>
            
            <h1>Current Immunizations</h1>
            <table class="table table-hover table-striped">
				<caption>Immunizations that is currently being given. Will automatically update when date expires.</caption>
				<thead>
					<tr>
                        <th class="table-name">Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th class="table-date">Start Date</th>
                        <th class="table-date">Stop Date</th>
                        <th class="table-date">Refill Date</th>
                        <th class="table-reason">Reason for taking</th>
                        <th class="table-editdelete">Edit/Delete</th>
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
                        <td class="table-editdelete">
                            <i class="icon-cog"></i>
                            <i class="icon-pencil"></i>
                            <i class="icon-wrench"></i>
                            <i class="icon-search"></i>
                        </td>
					</tr>
					</g:each>
				</tbody>
            </table>
            
            
            <h1>Previous Immunizations</h1>
            <table class="table table-hover table-striped">
                <caption>Immunizations that was given prior to current date.</caption>
                <thead>
                    <tr>
                        <th class="table-name">Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th class="table-date">Start Date</th>
                        <th class="table-date">Stop Date</th>
                        <th class="table-date">Refill Date</th>
                        <th class="table-reason">Reason for taking</th>
                        <th class="table-editdelete">Edit/Delete</th>
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
                        <td class="table-editdelete">
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