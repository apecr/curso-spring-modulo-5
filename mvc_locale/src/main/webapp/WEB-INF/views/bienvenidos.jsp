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
<title><fmt:message key="welcome.title" /></title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

	<div class="container">

		<jsp:include page="menu_locale.jsp" />
		
		<div class="page-header">
			<h1>
				<fmt:message key="welcome.title" />
			</h1>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">Locale =
				${pageContext.response.locale}</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">
						<ul>
							<li><a href="cuenta"><fmt:message key="text.ejemplo" />
									@Controller</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>