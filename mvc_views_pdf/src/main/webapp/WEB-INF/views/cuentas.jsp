<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mvc_views_pdf</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>
				Cuentas en formato HTML
			</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">Listado de cuentas</div>
			<div class="panel-body">

				<table class="table table-striped table-hover table-bordered">

					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Detalle</th>
					</tr>
					<c:forEach items="${cuentas}" var="cuenta">
						<tr>
							<td>${cuenta.id}</td>
							<td>${cuenta.nombre}</td>
							<td><a href="cuentas/${cuenta.id}">ver</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<a class="btn btn-default btn-lg" href="<%=request.getContextPath() %>/" role="button">Inicio</a>

	</div>

</body>
</html>