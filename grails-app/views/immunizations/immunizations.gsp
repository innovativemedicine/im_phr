
            
            <g:link class="add-button btn btn-primary form-button" action="create">
                Add Immunization
            </g:link>
            
            
            <h1>Immunizations</h1>
            <table class="table table-hover table-striped">
				<caption>Immunizations that have been taken.</caption>
				<thead>
					<tr>
                        <th class="table-name">Name</th>
                        <th class="table-comments">Comments</th>
                        <th class="table-date2">Date Immunized</th>
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
				            </g:link>
				            <g:link class="icons-edit" action="delete" params='[id: "${data.immunization_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
				                <i class="icon-remove"></i>
				            </g:link>
                        </td>
					</tr>
					</g:each>
				</tbody>
            </table>
            
            