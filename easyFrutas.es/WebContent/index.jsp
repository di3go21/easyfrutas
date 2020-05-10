<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>EasyFrutas.es</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
</head>

<body>

	<div class="container">

		<!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
		<div class="masthead">
			<h3 class="text-muted">Bienvenido a EASYFRUTAS.ES</h3>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="HOME">Inicio</a></li>
					<li><a href="admin?action=login">Administración</a></li>

					<li><a href="Login?">Log In</a></li>

					<li><a href="Registro?action=nuevoReg">REGÍSTRATE!!</a></li>
				</ul>
			</nav>
		</div>

		<!-- Formulario para la busqueda. El formulario es enviado por POST al BusquedaController -->
		<form method="post" action="buscar" class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" name="query" required
					placeholder="Buscar servidor..." class="form-control">
			</div>
			<button type="submit" class="btn btn-success">Buscar</button>
		</form>

		<!-- Jumbotron -->
		<div class="jumbotron">
			<h2>¡PIDE TU FRUTITA BUENA!</h2>
			<!--
        <h4>ESTAMOS CONTRATANDO</h4>
        -->
			<p class="lead text-justify">
				Bienvenido, aquí podrás encontrar la mejor frutita para el consumo
				diario. Haz clic en una fruta para ver sus características. No dudes
				en preparar tu pedido para tener tu fruta lista en la puerta de tu
				casa! Cualquier duda no dudes en ponerte en contacto con nosotros!<br>
				<br>
			<p>
				<a class="btn btn-lg btn-success" href="servidor?action=lista"
					role="button">Conoce los beneficios de cada fruta!</a>
			</p>
		</div>

		<h1 class="text-center">FRUTAS</h1>

		<!-- Example row of columns -->
		<div class="row">

			<c:forEach items="${listaProductos}" var="producto"
				varStatus="status">

				<div class="col-lg-4">
					<h3 class="text-center">${producto.nombre}</h3>
					<p class="text-center">Precio ${producto.precio} €/Kg</p>
					<p class="text-center">Stock: ${producto.stock} Kg</p>
					<div class="btn-group btn-group-justified" role="group"	aria-label="Justified button group">
						<a type="button" class="btn btn-info" href="servidor?action=ver&id=${producto.k}">Ver
							Detalles&raquo;</a>
					</div>
					<p></p>
				</div>

			</c:forEach>

		</div>

		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; 2017 JASR.</p>
		</footer>

	</div>
	<!-- /container -->

</body>
</html>