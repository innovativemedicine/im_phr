<!doctype html>
<html>
<head>

<title>Medications</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <g:link class="add-button btn btn-primary form-button" action="create">
                Add
            </g:link>
            
            
            <h1>Current Medications</h1>
            <table class="table table-hover table-striped">
                <caption>Medication that is currently being taken. Will automatically update when date expires.</caption>
                <thead>
                    <tr>
                        <th class="table-name">Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th class="table-reason">Reason for taking</th>
                        <th class="table-date">Start Date</th>
                        <th class="table-date">Stop Date</th>
                        <th class="table-date">Refill Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserCurrentMedicationsInstanceList }" var="data">
                    <tr>
                        <td>${data.name }</td>
                        <td>${data.dose }</td>
                        <td>${data.frequency }</td>
                        <td>${data.form }</td>
                        <td>${data.strength }</td>
                        <td>${data.comments }</td>
                        <td>${data.start_date }</td>
                        <td>${data.stop_date }</td>
                        <td>${data.refill_date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.medication_id }"]' title="Edit">
                                <i class="icon-cog"></i>
                                <i class="icon-pencil"></i>
                                <i class="icon-wrench"></i>
                            </g:link>
                            <g:link class="icons-edit" action="delete" params='[id: "${data.medication_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
                                <i class="icon-remove"></i>
                            </g:link>
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
                        <th class="table-name">Name</th>
                        <th>Dose</th>
                        <th>Frequency</th>
                        <th>Form</th>
                        <th>Strength</th>
                        <th class="table-reason">Reason for taking</th>
                        <th class="table-date">Start Date</th>
                        <th class="table-date">Stop Date</th>
                        <th class="table-date">Refill Date</th>
                        <th class="table-editdelete">Edit/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserPreviousMedicationsInstanceList }" var="data">
                    <tr>
                        <td>${data.name }</td>
                        <td>${data.dose }</td>
                        <td>${data.frequency }</td>
                        <td>${data.form }</td>
                        <td>${data.strength }</td>
                        <td>${data.comments }</td>
                        <td>${data.start_date }</td>
                        <td>${data.stop_date }</td>
                        <td>${data.refill_date }</td>
                        <td class="table-editdelete">
                            <g:link class="icons-edit" action="edit" params='[id: "${data.medication_id }"]' title="Edit">
                                <i class="icon-cog"></i>
                                <i class="icon-pencil"></i>
                                <i class="icon-wrench"></i>
                            </g:link>
                            <g:link class="icons-edit" action="delete" params='[id: "${data.medication_id }"]' onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="Delete">
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