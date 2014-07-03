<!doctype html>
<html>
<head>

<title>Calendar</title>

<link rel='stylesheet' href='../fullcalendar/lib/cupertino/jquery-ui.min.css' />
<link rel='stylesheet' href='../fullcalendar/fullcalendar.css' />
<link rel='stylesheet' href='../fullcalendar/fullcalendar.print.css' media='print' />
<script src='../fullcalendar/lib/moment.min.js'></script>
<script src='../fullcalendar/lib/jquery.min.js'></script>
<script src='../fullcalendar/lib/jquery-ui.custom.min.js'></script>
<script src='../fullcalendar/fullcalendar.js'></script>

<script>

    $(document).ready(function() {
        
        $('#calendar').fullCalendar({
            theme: true,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: '2014-06-12',
            editable: true,
            events: [
                {
                    title: 'All Day Event',
                    start: '2014-06-01'
                },
                {
                    title: 'Long Event',
                    start: '2014-06-07',
                    end: '2014-06-10'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2014-06-09T16:00:00'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2014-06-16T16:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2014-06-12T10:30:00',
                    end: '2014-06-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2014-06-12T12:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2014-06-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2014-06-28'
                }
            ]
        });
        
    });

</script>



</head>
<body>
    <content tag="header" style="display: none;">
        <h1>Calendar</h1>
    </content>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            
            <div id='calendar'></div>
        </div>
    </div>
</body>