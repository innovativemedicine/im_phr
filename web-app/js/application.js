if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(function() {

	$(".wellness-button").click(
			function() {
				$(this).siblings('.block-text').children('.form-hidden')
						.children('.add-section').slideToggle();
				$(this).siblings('.block-text').children('.wellness-info')
						.children('.block-text').slideToggle();
			});

	$('#bmi-tooltip').tooltip();

});

// <script type="text/javascript" src="https://www.google.com/jsapi"></script>
//
// // Load the Visualization API and the piechart package.
// google.load('visualization', '1.0', {'packages':['corechart']});
//	
// // Set a callback to run when the Google Visualization API is loaded.
// google.setOnLoadCallback(drawChart);
//	
//	
// function drawChart() {
//
// var userCalories = '${UserCalories}';
//	    
// var data = google.visualization.arrayToDataTable([
// ['Year', 'Sales', 'Expenses'],
// ['2004', 1000, 400],
// ['2005', 1170, 460],
// ['2006', 660, 1120],
// ['2007', 1030, 540]
// ]);
//	    
// var options = {
// title: 'Company Performance'
// };
//	    
// var chart = new
// google.visualization.LineChart(document.getElementById('chart_div'));
// chart.draw(data, options);
//	}
