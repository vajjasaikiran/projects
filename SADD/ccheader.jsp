

<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>Cloud Client</title>
	<meta name="description" content="">
	<meta name="author" content=" Made by Keyners">
    <meta http-equiv="X-UA-Compatible" content="IE=9" />


	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- PT Sans -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

	<!-- Crete Roung -->
	<link href='http://fonts.googleapis.com/css?family=Crete+Round&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

	<!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/skeleton.css">
	<link rel="stylesheet" href="css/layout.css">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
	<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {
				$("a[rel=example_group]").fancybox({
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'titlePosition' 	: 'over',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});
		});
	</script>

</head>
<body>


	<header>			
		<nav>
			<div class='container'>
				<div class='five columns logo'>
						<a href='#'><img src="images/logo.png" width="150" height="70" border="0" alt=""></a>
				</div>

				<div class='eleven columns'>
					<ul class='mainMenu'>
						<li class="active"><a href="clienthome.jsp" data-hover="Home"><h1>Home</a></li>
					<li><a href="uploadto.jsp" data-hover="File Upload"><h1>File Upload</a></li>
					<li><a href="viewData.jsp" data-hover="ViewData"><h1>ViewData</a></li>
				<li><a href="ctverify.jsp" data-hover="DataIntegrity"><h1>DataIntegrity</a></li>
					<li><a href="index.html" data-hover="Logout"><h1>Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>


	<div class='orange'>

		<div class='container'>
				<h1><center>Secure Auditing and Deduplicating <br>Data in Cloud</center></font></h2>
		</div>

	</div>

		<div class='container'>

		</div>			</div>	
	</header>





	<section class='gray'>
		<div class='container'>
			
<%
String uname = session.getAttribute("uname").toString();
//System.out.println(uname);
%>
	<!-- <h3 class="banner-main">Welcom Cloud Client&nbsp;&nbsp;<font color="red"><b><%=uname%></b></font></h3> -->