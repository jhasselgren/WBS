<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		
		<title><g:meta name="app.name"/></title>
		
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jumbotron.css')}" type="text/css">
		
		<g:layoutHead/>
		<g:javascript library="application"/>		
		<r:layoutResources />
		
		<!-- Just for debugging purposes. Don't actually copy this line! -->
	    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	    <![endif]-->
		
		
	</head>
	<body>
	 	
    
		<g:layoutBody/>


		<hr>
		<div id="footer">
	      	<div class="container">
	        	<p class="text-muted">&copy; Company 2013</p>
      		</div>
	    </div>
		<r:layoutResources />


	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	    <!--script src="../../dist/js/bootstrap.min.js"></script-->

	    <g:javascript src="bootstrap.js" />
			
	</body>
</html>
