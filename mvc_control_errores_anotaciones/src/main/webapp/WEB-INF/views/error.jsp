<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Página de Error</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="alert alert-danger">
			<p>Ha ocurrido un error. Por favor, póngase en contacto con
				nuestro administrador para obtener más detalles.</p>
			<p>(Estamos en la página o vista error.jsp.)</p>

		</div>

		<div class="panel panel-danger">
			<div class="panel-heading">Página de Error</div>
			<div class="panel-body">

				<p>Exception: ${exception.message}<p>
				<c:forEach items="${exception.stackTrace}" var="ste">
				    <p>${ste}<p>
                </c:forEach>
			</div>
		</div>
	</div>

</body>
</html>
