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
                
                
                <g:render template="formCarbohydrates"/>
                
            </div>
            
            
            
            <div class="row-fluid">
                
                <g:render template="formCholestrol"/>
                
                
                <g:render template="formBloodPressure"/>
                
            </div>
            
            
            
            
            <div class="row-fluid">
                
                <g:render template="formBmi"/>
                
            </div>
            
            
            
            
            <div class="row-fluid">
                
                <g:render template="formExercise"/>
                
            </div>
            
            
        </div>
    </div>
</body>