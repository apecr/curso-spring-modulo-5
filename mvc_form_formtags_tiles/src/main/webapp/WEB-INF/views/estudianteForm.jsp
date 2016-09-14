<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="panel panel-default">
	<div class="panel-heading">Crear Estudiante</div>
	<div class="panel-body">
		<div class="container">
			<div class="row">

				<form:form modelAttribute="estudianteCommand" method="post"
					cssClass="form-horizontal" role="form">
					<form:errors path="*" cssClass="alert alert-danger"
						cssStyle="width: 800px;" element="div" />

					<div class="form-group">
						<form:label for="userName" path="userName"
							cssClass="col-sm-2 control-label">User Name :</form:label>
						<div class="col-sm-10">
							<form:input path="userName" style="width: 300px;"
								cssClass="form-control"
								cssErrorClass="form-control alert-danger" />
							<form:errors path="userName" cssClass="error-campo" />
						</div>
					</div>
					<div class="form-group">
						<form:label for="direccion" path="direccion"
							cssClass="col-sm-2 control-label">Dirección :</form:label>
						<div class="col-sm-10">
							<form:input path="direccion" style="width: 300px;"
								cssClass="form-control"
								cssErrorClass="form-control alert-danger" />
							<form:errors path="direccion" cssClass="error-campo" />
						</div>
					</div>

					<div class="form-group">
						<form:label for="password" path="password"
							cssClass="col-sm-2 control-label">Password :</form:label>
						<div class="col-sm-10">
							<form:password path="password" style="width: 300px;"
								cssClass="form-control"
								cssErrorClass="form-control alert-danger" />
							<form:errors path="password" cssClass="error-campo" />
						</div>
					</div>
					<div class="form-group">
						<form:label for="confirmarPassword" path="confirmarPassword"
							cssClass="col-sm-2 control-label">Confirmar Password :</form:label>
						<div class="col-sm-10">
							<form:password path="confirmarPassword" style="width: 300px;"
								cssClass="form-control"
								cssErrorClass="form-control alert-danger" />
							<form:errors path="confirmarPassword" cssClass="error-campo" />
						</div>
					</div>
					<div class="form-group">
						<form:label for="recibeNewsletter" path="recibeNewsletter"
							cssClass="col-sm-2 control-label">Suscribirse al newsletter? :</form:label>
						<div class="col-sm-10">
							<form:checkbox path="recibeNewsletter" cssClass="form-control"
								style="width: 300px;" />
							<form:errors path="recibeNewsletter" />
						</div>
					</div>

					<div class="form-group">
						<form:label for="temas" path="temas"
							cssClass="col-sm-2 control-label">Temas favoritos :</form:label>
						<div class="col-sm-10">
							<form:checkboxes items="${listaTemas}" path="temas" />
							<form:errors path="temas" cssClass="error-campo" />
						</div>
					</div>
					<div class="form-group">
						<form:label for="genero" path="genero"
							cssClass="col-sm-2 control-label">Género :</form:label>
						<div class="col-sm-10">
							<form:radiobutton path="genero" value="H" />
							Hombre
							<form:radiobutton path="genero" value="F" />
							Mujer
							<form:errors path="genero" cssClass="error-campo" />
						</div>
					</div>

					<div class="form-group">
						<form:label for="numeroFavorito" path="numeroFavorito"
							cssClass="col-sm-2 control-label">Seleccione un número :</form:label>
						<div class="col-sm-10">
							<form:radiobuttons items="${listaNumeros}" path="numeroFavorito" />
							<form:errors path="numeroFavorito" cssClass="error-campo" />
						</div>
					</div>

					<div class="form-group">
						<form:label for="pais" path="pais"
							cssClass="col-sm-2 control-label">País :</form:label>
						<div class="col-sm-10">
							<form:select path="pais" cssClass="form-control"
								cssErrorClass="form-control alert-danger" style="width: 300px;">
								<form:option value="" label="--- Seleccione ---" />
								<form:options items="${listaPaises}" />
							</form:select>
							<form:errors path="pais" cssClass="error-campo" />
						</div>
					</div>

					<div class="form-group">
						<form:label for="experienciaSpring" path="experienciaSpring"
							cssClass="col-sm-2 control-label">Habilidades de Spring :</form:label>
						<div class="col-sm-10">
							<form:select path="experienciaSpring"
								items="${experienciaSpring}" multiple="true"
								cssClass="form-control"
								cssErrorClass="form-control alert-danger" style="width: 300px;" />
							<form:errors path="experienciaSpring" cssClass="error-campo" />
						</div>
					</div>

					<form:hidden path="valorSecreto" />


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" value="Crear Estudiante"
								class="btn btn-primary" role="button" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>