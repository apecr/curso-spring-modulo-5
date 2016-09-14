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
<title><fmt:message key="text.vercuenta"/></title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<jsp:include page="../menu_locale.jsp" />
		<div class="page-header">
			<h1>
				<fmt:message key="text.vercuenta"/>
			</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading"><fmt:message key="text.cuenta"/></div>
			<div class="panel-body">

				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th><fmt:message key="text.nombre"/></th>
							<th><fmt:message key="text.email"/></th>
							<th><fmt:message key="text.saldo"/></th>
							<th><fmt:message key="text.endeudamiento"/></th>
							<th><fmt:message key="text.fechaRenovacion"/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${cuenta.id}</td>
							<td>${cuenta.email}</td>
							<td>${cuenta.nombre}</td>
							<td>${cuenta.saldo}</td>
							<td>${cuenta.nivelEndeudamiento}</td>
							<td>${cuenta.fechaRenovacion}</td>
						</tr>
					</tbody>
				</table>

				<a class="btn btn-default" href="<%=request.getContextPath() %>/" role="button"><fmt:message key="text.home"/></a>
			</div>
		</div>

	</div>

</body>
</html>