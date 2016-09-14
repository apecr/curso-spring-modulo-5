<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="geoLocalizacionForm">
	<form:select path="ciudad" style="width: 300px;"
		cssClass="form-control">
		<form:option value="0" label="seleccione una ciudad -->" />
		<form:options items="${ciudades}" itemLabel="nombre" itemValue="id" />
	</form:select>
</form:form>