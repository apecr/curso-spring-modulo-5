<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
.error-campo {
	color: #ff0000;
}
</style>
</head>
<body>
<tiles:insertAttribute name="header" />
	<div class="container">
		<tiles:insertAttribute name="body" />
		<hr>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>