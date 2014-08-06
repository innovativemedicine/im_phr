<!doctype html>
<html>
<head>

<title>Health Information</title>


</head>
<body>
    
    <div class="container home-body">
        
        <div id="main-body" style="clear: both">
            
            <g:include controller="medications2" action="medications" />
            <hr>
            <g:include controller="immunizations" action="immunizations" />
            <hr>
            <g:include controller="allergies" action="allergies" />
            <hr>
            <g:include controller="medications2" action="medicationsPrevious" />
            
            
        </div>
    </div>
</body>