<!doctype html>
<html>
<head>

<title>Immunizations</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <g:link class="add-button btn btn-primary form-button" action="create">
                Add
            </g:link>
            
            
            <h1>Current Immunizations</h1>
            <table class="table table-hover table-striped">
				<caption>Immunizations that is currently being given. Will automatically update when date expires.</caption>
				<thead>
					<tr>
                        <th class="table-name">Name</th>
                        <th>Comments</th>
                        <th class="table-date">Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
				</thead>
				<tbody>
					<g:each in="${UserImmunizationsInstanceList }" var="data">
					<tr>
					    <td>${data.name }</td>
                        <td>${data.comments }</td>
                        <td>${data.date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.immunization_id }"]' title="Edit">
				                <i class="icon-cog"></i>
	                            <i class="icon-pencil"></i>
	                            <i class="icon-wrench"></i>
				            </g:link>
				            <g:link class="icons-edit" action="delete" params='[id: "${data.immunization_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
				                <i class="icon-remove"></i>
				            </g:link>
                        </td>
					</tr>
					</g:each>
				</tbody>
            </table>
            
            
        </div>
    </div>
</body>