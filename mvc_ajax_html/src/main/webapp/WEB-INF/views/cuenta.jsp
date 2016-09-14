<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mvc_ajax_html</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jquery -->
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>Ejemplo Ajax HTML</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">Buscador Cuentas Ajax</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">

						<form id="cuenta" class="form-horizontal" role="form" style="width: 600px;">
							<div class="form-group">
								<label for="buscarTexto" class="col-sm-2 control-label">Buscar :</label>
								<div class="col-sm-10">
									<input id="buscarTexto" name="buscarTexto" onkeyup="javascript:buscarNombreAjax()" style="width: 400px;" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" value="Buscar"	class="btn btn-primary" role="button" />
								</div>
							</div>
						</form>
						
						<div id="lista-cuentas">

							<table style="width: 700px;" class="table table-striped table-hover table-bordered">
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
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function buscarNombreAjax() {
			$.ajax({
				type : "post",
				url : "cuenta/buscar",
				data : {buscarTexto: $('#buscarTexto').val()},
				success : function(html) {
					$("#lista-cuentas").html(html);
				},
				error : function(e) {
					console.log(e);
				},
			});

			return false;
		}
		
		$(document).ready(function() {
			$("#cuenta").submit(function() {
				buscarNombreAjax();
				return false;
			});
		});
	</script>
</body>
</html>