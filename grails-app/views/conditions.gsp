<!doctype html>
<html>
<head>

<title>Conditions</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <button type="button" class="add-button btn btn-primary">Add</button>
            
            <h1>Current Conditions</h1>
            <table class="table table-hover table-striped">
				<caption>Will automatically update when date expires.</caption>
				<thead>
					<tr>
                        <th class="table-name2">Name</th>
                        <th class="table-comments">Commends</th>
                        <th class="table-date2">Onset Date</th>
                        <th class="table-date2"></th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
				</thead>
				<tbody>
				    <% def count=5 %>
					<g:each in="${1..count}" var="c">
					<tr>
                        <td>Cholera</td>
                        <td>Very contagious</td>
                        <td>0${c}-29-2014</td>
                        <td></td>
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
            
            
            <h1>Previous Conditions</h1>
            <table class="table table-hover table-striped">
                <caption>Conditions prior to current date.</caption>
                <thead>
                    <tr>
                        <th class="table-name2">Name</th>
                        <th class="table-comments">Commends</th>
                        <th class="table-date2">Onset Date</th>
                        <th class="table-date2">End Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${1..count}" var="c">
                    <tr>
                        <td>Cholera</td>
                        <td>Very contagious</td>
                        <td>0${c}-29-2014</td>
                        <td>0${c+1}-29-2014</td>
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