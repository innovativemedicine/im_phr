<!doctype html>
<html>
<head>

<title>Home</title>

</head>
<body>
	<content tag="header">
	<div id="homehero" class="hero-unit" style="background-color: #fff;">
		<div style="float: left; width: 65%;">


			<h1 style="line-height: 1.1em; font-size: 28px;">
				<span
					style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">The
					Office of</span><br />Personalized Genomics &amp; Innovative Medicine</span><br />
				<span
					style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">at
					Mount&nbsp;Sinai&nbsp;Hospital</span>
			</h1>
				<p style="font-style: italic; padding-top: 15px; clear: both;">Using
				genomic information to customize disease prevention, detection, and
				treatment for each individual.</p>
		</div>
		<g:img dir="images/custom" file="red_pill_DNA.jpg"
			style="width: 30%; float:right; " />

	</div>

	</content>
	<div class="container">

		<div style="float: left; overflow: hidden; width: 65%;">

			<div id="myCarousel" class="carousel slide"
				style="border: 1px solid #ccc; float: left;">
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

		</div>
		<div style="float: right; overflow: hidden; width: 30%;">
		 <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
try
{
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
}
catch(e)
{

	}
</script>

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
