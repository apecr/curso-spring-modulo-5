<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mvc_control_errores</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

	<div class="container">

		<div class="alert alert-danger">
			<p>La cuenta no existe, está tratando de acceder a una cuenta no
				registrada en nuestro sistema.</p>
		</div>

		<div class="panel panel-danger">
			<div class="panel-heading">
				La Cuenta NO Existe
			</div>
			<div class="panel-body">
				<p>Si ve esta página es porque el manejo y control de
					excepciones (errores) está funcionando perfectamente, tal cómo se
					esperaba</p>
				<br> El número de cuenta ${exception.recursoId} no existe!
				<fmt:formatDate value="${exception.fecha}" pattern="yyyy-MM-dd" />
			</div>
		</div>

	</div>

</body>
</html>
