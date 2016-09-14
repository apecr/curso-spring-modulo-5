<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="width: 800px;" class="table table-striped table-hover table-bordered">
	<thead>
		<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>Saldo</th>
			<th>Endeudamiento</th>
			<th>Fecha</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${cuentas}" var="cuenta">
			<tr>
				<td>${cuenta.id}</td>
				<td>${cuenta.nombre}</td>
				<td>${cuenta.saldo}</td>
				<td>${cuenta.nivelEndeudamiento}</td>
				<td>${cuenta.fechaRenovacion}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
