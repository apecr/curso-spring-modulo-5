<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<ul class="nav nav-tabs">
	<li role="presentation"
		<c:if test="${param.locale == 'en_us'}" >class="active"</c:if>><a
		href="?locale=en_us">us</a></li>
	<li role="presentation"
		<c:if test="${param.locale == 'es_es'}" >class="active"</c:if>><a
		href="?locale=es_es">es</a></li>
	<li role="presentation"
		<c:if test="${param.locale == 'de_de'}" >class="active"</c:if>><a
		href="?locale=de_de">de</a></li>
</ul>