<!doctype html>
<html>
<head>

<title>Wellness</title>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {'packages':['corechart']});
	
	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);
	
	
	function drawChart() {

	    var userCalories = '${UserCalories}';
	    
	    var data = google.visualization.arrayToDataTable([
			['Year', 'Sales', 'Expenses'],
			['2004',  1000,      400],
			['2005',  1170,      460],
			['2006',  660,       1120],
			['2007',  1030,      540]
	    ]);
	    
	    var options = {
	        title: 'Company Performance'
	    };
	    
	    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
	}
	
	
	$(document).ready(function() {
		$( ".wellness-button" ).click(function() {
			$(this).siblings('.block-text').children('.form-hidden').children('.add-section').slideToggle();
	    });
	});
	
	
	
	
</script>

</head>
<body>
    <content tag="header" style="display: none;">
        <h1>Wellness</h1>
    </content>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <div class="row-fluid">
                
                <g:render template="formCalories"/>
                
                
                <div class="block span6">
                    <h1 class="block-header">
                        Wellness
                    </h1>
                    <div class="block-text">
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                        <br /><br />
                        Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
                        </p>
                    </div>
                </div>
            </div>
            
            
            
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        Current Conditions
                    </h1>
                    <div class="block-text-18">
                        <g:if test="${UserConditionsInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserConditionsInstanceList }" var="data">
                                    <li>${data.name }</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
                
                <div class="block span6">
                    <h1 class="block-header">
                        Upcoming Appointments
                    </h1>
                    <div class="block-text">
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipisi cing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                        <br /><br />
                        Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
                        </p>
                    </div>
                </div>
            </div>
            
            
            
            
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        Current Medications
                    </h1>
                    <div class="block-text-18">
                        <g:if test="${UserMedicationsInstanceList == null }">
                            <h3>None</h3>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserMedicationsInstanceList }" var="data">
                                    <li>${data.name } ( ${data.dose } ) - ${data.form }, ${data.frequency }</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
                
                
                <div class="block span6">
                    <h1 class="block-header">
                        Current Illnesses
                    </h1>
                    <div class="block-text-18">
                        <g:if test="${UserIllnessesInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserIllnessesInstanceList }" var="data">
                                    <li>${data.name }, ${data.symptoms } (${data.onset_date })</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
            </div>
            
            
            
            
            
            <div class="row-fluid">
                <div class="block span6">
                    <h1 class="block-header">
                        Immunization
                    </h1>
                    <div class="block-text-18">
                        <g:if test="${UserImmunizationsInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserImmunizationsInstanceList }" var="data">
                                <li>${data.name } - ${data.type } (${data.date })</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
                
                <div class="block span6">
                    <h1 class="block-header">
                        Allergies
                    </h1>
                    <div class="block-text">
                        <g:if test="${UserAllergiesInstanceList.size == 0 }">
                            <h4>None</h4>
                        </g:if>
                        <g:else>
                            <ul>
                                <g:each in="${UserAllergiesInstanceList }" var="data">
                                    <li>${data.name } ( ${data.reaction } ) - ${data.severity }</li>
                                </g:each>
                            </ul>
                        </g:else>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
</body>