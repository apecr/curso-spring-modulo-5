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
				<div class="container">
					<div class="row">
						<form:form modelAttribute="cuenta" action="${cuenta.id}"
							method="get" cssClass="form-horizontal" role="form">
							<div class="form-group">
								<form:label for="nombre" path="nombre"
									cssClass="col-sm-2 control-label"><fmt:message key="text.nombre"/></form:label>
								<div class="col-sm-10">
									<form:input path="nombre" style="width: 300px;" readonly="true"
										cssClass="form-control" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="email" path="email"
									cssClass="col-sm-2 control-label"><fmt:message key="text.email"/></form:label>
								<div class="col-sm-10">
									<form:input path="email" style="width: 300px;" readonly="true"
										cssClass="form-control" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="saldo" path="saldo"
									cssClass="col-sm-2 control-label"><fmt:message key="text.saldo"/></form:label>
								<div class="col-sm-10">
									<form:input path="saldo" style="width: 300px;"
										cssClass="form-control" readonly="true" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="nivelEndeudamiento" path="nivelEndeudamiento"
									cssClass="col-sm-2 control-label"><fmt:message key="text.endeudamiento"/><</form:label>
								<div class="col-sm-10">
									<form:input path="nivelEndeudamiento" style="width: 300px;"
										cssClass="form-control" readonly="true" />
								</div>
							</div>
							<div class="form-group">
								<form:label for="fechaRenovacion" path="fechaRenovacion"
									cssClass="col-sm-2 control-label"><fmt:message key="text.fechaRenovacion"/></form:label>
								<div class="col-sm-10">
									<form:input path="fechaRenovacion" style="width: 300px;"
										cssClass="form-control" readonly="true" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<a class="btn btn-default" href="<%=request.getContextPath() %>/" role="button"><fmt:message key="text.home"/></a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>