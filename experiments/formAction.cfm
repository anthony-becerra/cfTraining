<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!-- Adding cfoutput tag to print to screen and passing in form data -->
	<cfoutput >
		<p>Welcome #form.fld_firstName# #form.fld_lastName#</p>
		<p>You are #form.fld_age# years old</p>
	</cfoutput>
</body>
</html>