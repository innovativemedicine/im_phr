<!doctype html>
<html>
<head>

<title>Illnesses</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <g:link class="add-button btn btn-primary form-button" action="create">
                Add
            </g:link>
            
            
            <h1>Current Illnesses</h1>
            <table class="table table-hover table-striped">
                <caption>Will automatically update when date expires.</caption>
                <thead>
                    <tr>
                        <th class="table-name">Illness Name</th>
                        <th class="table-symptoms">Symptoms</th>
                        <th class="table-treatment">Treatment</th>
                        <th>Comments</th>
                        <th class="table-date">Onset Date</th>
                        <th class="table-date">End Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserCurrentIllnessesInstanceList }" var="data">
                    <tr>
                        <td>${data.name }</td>
                        <td>${data.symptoms }</td>
                        <td>${data.treatment }</td>
                        <td>${data.comments }</td>
                        <td>${data.onset_date }</td>
                        <td>${data.end_date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.illness_id }"]' title="Edit">
                                <i class="icon-cog"></i>
                            </g:link>
                            <g:link class="icons-edit" action="delete" params='[id: "${data.illness_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
                                <i class="icon-remove"></i>
                            </g:link>
                        </td>
                    </tr>
                    </g:each>
                </tbody>
            </table>
            
            
            <h1>Previous Illnesses</h1>
            <table class="table table-hover table-striped">
                <caption>Illnesses prior to current data.</caption>
                <thead>
                    <tr>
                        <th class="table-name">Illness Name</th>
                        <th class="table-symptoms">Symptoms</th>
                        <th class="table-treatment">Treatment</th>
                        <th>Comments</th>
                        <th class="table-date">Onset Date</th>
                        <th class="table-date">End Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserPreviousIllnessesInstanceList }" var="data">
                    <tr>
                        <td>${data.name }</td>
                        <td>${data.symptoms }</td>
                        <td>${data.treatment }</td>
                        <td>${data.comments }</td>
                        <td>${data.onset_date }</td>
                        <td>${data.end_date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.illness_id }"]' title="Edit">
                                <i class="icon-cog"></i>
                            </g:link>
                            <g:link class="icons-edit" action="delete" params='[id: "${data.illness_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
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