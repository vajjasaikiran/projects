			
		</div>
	</section>



	<footer>
		<div class='container'>
			
			<div class='eight columns'>
				<h5>IEEE Projects Development</h5>
				<p>Paper Publishing</p>
				<p>M.Tech Projects</p>
				<p>B.Tech Projects</p>
			</div>

			<div class='four columns social'>
				<h5>Social media</h5>

		<a href='https://www.facebook.com/cloudtechnologiespro?ref=hl' target="_blank"><img src='images/social/facebook.png' ></a>
				<a href='https://twitter.com/cloudtechpro' target="_blank"><img src='images/social/twitter.png'></a>

			</div>

			<div class='four columns'>
				<h5>Get in touch</h5>
									 <font  face="Comic Sans MS"><p>Cloud Technologies,#304, <br>
   <p> Siri Towers, <br>
   <p> Beside Prime Hospital, <br>
    Maitrivanam, <br>
    Ameerpet, Hyderabad.</font>
			</div>


		<a id='top' href='#'>&uarr;</a>	
		</div>
	</footer>
	<script type="text/javascript">	
		var form = $('form');
	
		$(document).ready(function(){
		    form.validate({
		    	ignore: "",
	            rules: {
	            	'message': {
	                    required: true,	                 
	                },
	            	'name': {
	                    required: true,	                 
	                },
	                'mail': {
	                    required: true,
	                    email: true
	                }			                
	            },
	            errorPlacement: function(error, element){}

		    });
		  });     
	</script>


	<script type="text/javascript">
		var toper = $('a#top');


		$(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                toper.fadeIn( 200 );
            } else {
                toper.fadeOut( 200 );
            }
        });

         toper.click(function(){
        	$('html, body').animate({scrollTop:0}, 500);	        	
        	return false;
    	}); 
	</script>


</body>
</html>