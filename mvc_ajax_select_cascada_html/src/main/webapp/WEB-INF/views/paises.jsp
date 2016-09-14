<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mvc_ajax_select_cascada_html</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jquery -->
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>Ejemplo Ajax HTML: Listas Desplegables en Cascada</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">Paises/Ciudades</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">

						<form:form modelAttribute="geoLocalizacionForm" method="post"
							cssClass="form-horizontal" role="form">

							<div class="form-group">
								<form:label for="pais" path="pais"
									cssClass="col-sm-2 control-label">Paises</form:label>
								<div class="col-sm-10">
									<form:select onchange="javascript:cargarSelectPaises()"
										path="pais" style="width: 300px;" cssClass="form-control">
										<form:option value="0" label="seleccione un pais -->" />
										<form:options items="${paises}" itemLabel="nombre"
											itemValue="id" />
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<form:label for="ciudad" path="ciudad"
									cssClass="col-sm-2 control-label">Ciudades</form:label>
								<div class="col-sm-10" id="lista-ciudades">
									<form:select path="ciudad" style="width: 300px;"
										cssClass="form-control">
									</form:select>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function cargarSelectPaises() {

			$.ajax({
				type : "post",
				url : "paises/cascada",
				data : {
					pais : $('#pais').val(),
				},
				success : function(html) {
					$("#lista-ciudades").html(html);
				},
				error : function(e) {
					console.log(e);
				},
			});

			return false;
		}
	</script>
</body>
</html>