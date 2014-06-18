<!doctype html>
<html>
<head>

<title>Allergies</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <g:link class="add-button btn btn-primary form-button" action="create">
                Add
            </g:link>
            
            
            <h1>Allergies</h1>
            <table class="table table-hover table-striped">
                <caption>Allergies sorted by severity.</caption>
                <thead>
                    <tr>
                        <th class="table-name">Allergy Name</th>
                        <th class="table-reason">Allergic Reaction</th>
                        <th>Severity</th>
                        <th class="table-date">Date of Onset</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserAllergiesInstanceList }" var="data">
                    <tr>
                        <td>${data.name }</td>
                        <td>${data.reaction }</td>
                        <td>${data.severity }</td>
                        <td>${data.onset_date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.allergy_id }"]' title="Edit">
                                <i class="icon-cog"></i>
                                <i class="icon-pencil"></i>
                                <i class="icon-wrench"></i>
                            </g:link>
                            <g:link class="icons-edit" action="delete" params='[id: "${data.allergy_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
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