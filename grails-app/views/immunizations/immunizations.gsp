<!doctype html>
<html>
<head>

<title>Immunizations</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <g:link class="add-button btn btn-primary form-button" action="create">
<%--                <g:message code="default.new.label" args="[entityName]" />--%>
                Add
            </g:link>
            
            
            <h1>Current Immunizations</h1>
            <table class="table table-hover table-striped">
				<caption>Immunizations that is currently being given. Will automatically update when date expires.</caption>
				<thead>
					<tr>
                        <th class="table-name">Name</th>
                        <th>Dose</th>
                        <th>Type</th>
                        <th>Manufacturer</th>
                        <th>Dose</th>
                        <th class="table-date">Date</th>
                        <th class="table-date">Next Date</th>
                        <th class="table-reason">Comments</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
				</thead>
				<tbody>
					<g:each in="${UserImmunizationsInstanceList }" var="data">
					<tr>
					    <td>${data.name }</td>
                        <td>${data.dose }</td>
                        <td>${data.type }</td>
                        <td>${data.manufacturer }</td>
                        <td>${data.dose }</td>
                        <td>${data.date }</td>
                        <td>${data.next_date }</td>
                        <td>${data.comments }</td>
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