<!doctype html>
<html>
<head>

<title>Home</title>
<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
    try {
        new TWTR.Widget({
          version: 2,
          type: 'profile',
          rpp: 3,
          interval: 30000,
          width: 'auto',
          height: 300,
          theme: {
            shell: {
              background: '#f7f7f7',
              color: '#050005'
            },
            tweets: {
              background: '#fafafa',
              color: '#030003',
              links: '#0726eb'
            }
          },
          features: {
            scrollbar: false,
            loop: false,
            live: false,
            behavior: 'all'
          }
        }).render().setUser('innovative_med').start();
    } catch(e) {
    }
</script>
</head>

<body>
    <content tag="header">
    <div id="homehero" style="background-color: #fff;">
    
        <div style="float: left; width: 65%;">
            <h1 style="line-height: 1.1em; font-size: 28px;">
                <span class="home-header">
                    <g:if test="${session.user != null}">
                    Welcome, ${session.user }!
                    </g:if>
                    
                    <g:if test="${session.user == null}">
                    Welcome, Test User!
                    </g:if>
                </span>
            </h1>
        </div>
        
    </div>
    </content>
    
    <div class="container home-body">
    
        <div class="">
            <div class="home-header-text">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et 
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.
            </div>
            <img class="home-header-img" src="/static/images/custom/red_pill_DNA.jpg">
        </div>
        
        <div id="main-body" style="clear: both">
            <div class="horizontal-block-3 block">
                <h1 class="block-header">
                    What is PHR
                </h1>
                <span class="block-text">
                    <p>
                    Lorem ipsum dolor sit amet, consectetur adipisi
                    cing elit, sed do eiusmod tempor incididunt ut 
                    labore et dolore magna aliqua. Ut enim ad minim, 
                    quis nostrud exercitation ullamco laboris nisi:
                    </p>
                    
                    <ul>
                        <li>Blood Glucose Screening (06-03-2014)</li>
                        <li>Blood Pressure Screening (06-03-2014)
                        <li>bone density study (06-03-2014)</li>
                        <li>Eye Exam (05-05-2014)</li>
                    </ul>
                </span>
            </div>
            
            <div class="horizontal-block-3 block">
                <h1 class="block-header">
                    Why should you use it?
                </h1>
                <span class="block-text">
                    <p>
                    Lorem ipsum dolor sit amet, consectetur adipisi
                    cing elit, sed do eiusmod tempor incididunt ut 
                    labore et dolore magna aliqua. Ut enim ad minim.
                    <br /><br />
                    Quis nostrud exercitation ullamco laboris nisi 
                    ut aliquip ex ea commodo . Duis aute irure dolor 
                    in reprehenderit in voluptate velit esse cillum.
                    </p>
                </span>
            </div>
            
            <div class="horizontal-block-3 block">
                <h1 class="block-header">
                    Our vision
                </h1>
                <span class="block-text">
                    <p>
                    Lorem ipsum dolor sit amet, consectetur adipisi
                    cing elit, sed do eiusmod tempor incididunt ut 
                    labore et dolore magna aliqua. Ut enim ad.
                    <br /><br />
                    Minim, quis nostrud exercitation ullamco nisi 
                    ut aliquip ex ea commodo. Duis aute irure dolor 
                    in reprehenderit in voluptate velit esse cillum.
                    <br /><br />
                    Dolore eu fugiat nulla pariatur. Excepteur sinboru.
                    </p>
                </span>
            </div>
            
            <div class="wide-block block" style="clear: both;">
                <span class="">
	                <h1 class="block-header">
	                    How to use your PHR
	                </h1>
	                <span class="block-text half-text-width">
	                    <p>
	                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
	                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	                    , quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
	                    . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore 
	                    eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
	                    sunt in culpa qui officia deserunt mollit anim id est laborum
	                    </p>
	                </span>
	            </span>
                <span class="video-small">
                    <iframe width="420" height="315" src="//www.youtube.com/embed/77r5p8IBwJk" frameborder="0" allowfullscreen></iframe>
                </span>
            </div>
        </div>
            

        <div id="myCarousel" class="carousel slide" style="border: 1px solid #ccc; float: left;">
            <div class="carousel-inner">
                <div class="active item">
                    <g:img dir='images/custom/home/' file='one.png' />
                </div>
                <div class="item">
                    <g:img dir='images/custom/home/' file='two.png' />
                </div>
                <div class="item">
                    <g:img dir='images/custom/home/' file='three.png' />
                </div>
                <div class="item">
                    <g:img dir='images/custom/home/' file='four.png' />
                </div>
                <div class="item">
                    <g:img dir='images/custom/home/' file='five.png' />
                </div>
            </div>
        </div>
        
        <div style="float: right; overflow: hidden; width: 30%;">
            <div style="margin-top: 40px; font-style: italic;">
                Innovative Medicine supports the<br/><a class="external" href="http://torbug.org">Toronto Bioinformatics Users Group</a> (TorBUG).
            </div>

            <div style="margin-top: 40px; font-style: italic; background: yellow; padding: 10px">
                We have posted a new position on our Careers page! <g:link mapping="careers">See available positions. </g:link>
            </div>
        </div>
    </div>
    <r:script>
    $('#myCarousel').carousel({
      interval: 4000
    })
    </r:script>
    
</body>
</html>
