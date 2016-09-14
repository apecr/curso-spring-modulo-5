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
<title>mvc_ajax_json_ok</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<link rel="stylesheet" href="<c:url value="/recursos/css/popup.css" />" type="text/css">
<!-- jquery -->
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>Ejemplo Ajax JSON</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">Crear Cuenta</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">
						<!-- El objeto del model "cuenta" se crea dentro del metodo "crearCuentaForm(Model model)"
			de la clase controladora "CuentaController". -->
						<form:form modelAttribute="cuenta" action="cuenta" method="post"
							cssClass="form-horizontal" role="form">
							<div class="form-group">
								<form:label for="nombre" path="nombre"
									cssClass="col-sm-2 control-label">Nombre</form:label>
								<div class="col-sm-10">
									<form:input path="nombre" style="width: 300px;"
										cssClass="form-control"
										cssErrorClass="form-control alert-danger" />
									<form:errors path="nombre" />
								</div>
							</div>

							<div class="form-group">
								<form:label for="saldo" path="saldo"
									cssClass="col-sm-2 control-label">Saldo</form:label>
								<div class="col-sm-10">
									<form:input path="saldo" style="width: 300px;"
										cssClass="form-control"
										cssErrorClass="form-control alert-danger" />
									<form:errors path="saldo" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="nivelEndeudamiento" path="nivelEndeudamiento"
									cssClass="col-sm-2 control-label">Nivel Endeudamiento</form:label>
								<div class="col-sm-10">
									<form:input path="nivelEndeudamiento" style="width: 300px;"
										cssClass="form-control"
										cssErrorClass="form-control alert-danger" />
									<form:errors path="nivelEndeudamiento" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="fechaRenovacion" path="fechaRenovacion"
									cssClass="col-sm-2 control-label">Fecha Renovación</form:label>
								<div class="col-sm-10">
									<form:input path="fechaRenovacion" style="width: 300px;"
										cssClass="form-control"
										cssErrorClass="form-control alert-danger" />
									<form:errors path="fechaRenovacion" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input id="create" type="submit" value="Crear Cuenta"
										class="btn btn-primary" role="button" />
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="mask" style="display: none;"></div>
	<div id="popup" style="display: none;">
		<div class="span-8 last">
			<div class="panel panel-primary">
				<div class="panel-heading">Cuenta creada con éxito</div>
				<div class="panel-body">

					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th>Cuenta Id</th>
								<th>Nombre</th>
								<th>Saldo</th>
								<th>Nivel Endeudamiento</th>
								<th>Fecha Renovación</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span id="idAsignado"></span></td>
								<td><span id="nombreConfirmado"></span></td>
								<td><span id="saldoConfirmado"></span></td>
								<td><span id="nivelEndeudamientoConfirmado"></span></td>
								<td><span id="fechaRenovacionConfirmado"></span></td>
							</tr>
						</tbody>
					</table>


				</div>
			</div>
			<a href="#" onclick="closePopup();">Cerrar</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			// check name availability on focus lost
			$('#nombre').blur(function() {
				if ($('#nombre').val()) {
					checkAvailability();
				}
			});

			$("#cuenta").submit(function() {
				var datos = {
					nombre : $('#nombre').val(),
					saldo : $('#saldo').val(),
					nivelEndeudamiento : $('#nivelEndeudamiento').val(),
					fechaRenovacion : $('#fechaRenovacion').val()
				};

				$.ajax({
					type : "post",
					url : "cuenta",
					data : JSON.stringify(datos),
					dataType : 'json',
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						$("#idAsignado").text(data.id);
						showPopup();
					},
					error: function(e) {
					    console.log(e);
					},
				});

				return false;
			});
		});

		function checkAvailability() {

			$.ajax({
				type : "get",
				url : "cuenta/obtener-disponibilidad",
				dataType : 'json',
				data : {
					nombre : $('#nombre').val()
				},
				success : function(availability) {

					if (availability.available) {
						fieldValidated("nombre", {
							valid : true
						});
					} else {
						fieldValidated("nombre", {
							valid : false,
							message : $('#nombre').val()
									+ " no está disponible, intente "
									+ availability.suggestions
						});
					}

				}
			});
		}

		function fieldValidated(field, result) {
			if (result.valid) {
				$("#" + field + "Label").removeClass("error");
				$("#" + field + "\\.errors").remove();
				$('#create').attr("disabled", false);
			} else {
				$("#" + field + "Label").addClass("error");
				if ($("#" + field + "\\.errors").length == 0) {
					$("#" + field).after(
							"<span id='" + field + ".errors'>" + result.message
									+ "</span>");
				} else {
					$("#" + field + "\\.errors").html(
							"<span id='" + field + ".errors'>" + result.message
									+ "</span>");
				}
				
				$('#create').attr("disabled", true);
			}
		}

		function showPopup() {

			$.ajax({
						type : "get",
						url : "cuenta/" + $("#idAsignado").text(),
						dataType : 'json',
						success : function(cuenta) {
							$("#nombreConfirmado").text(cuenta.nombre);
							$("#saldoConfirmado").text(cuenta.saldo);
							$("#nivelEndeudamientoConfirmado").text(
									cuenta.nivelEndeudamiento);
							$("#fechaRenovacionConfirmado").text(
									cuenta.fechaRenovacion);
						}
					});

			$('body').css('overflow', 'hidden');
			$('#popup').fadeIn('fast');
			$('#mask').fadeIn('fast');
		}

		function closePopup() {
			$('#popup').fadeOut('fast');
			$('#mask').fadeOut('fast');
			$('body').css('overflow', 'auto');
			resetForm();
		}

		function resetForm() {
			$('#cuenta')[0].reset();
		}
	</script>
</body>
</html>