<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>repl.it</title>
<link href="Style/listacliente.css" rel="stylesheet" type="text/css" />
<!--Llamando librerias y estilos Boostrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>

<link href="Style/listacliente.css" rel="stylesheet" type="text/css" />
<!-- font awesome-->
<script src="https://kit.fontawesome.com/8e9e769e03.js"
	crossorigin="anonymous">
	
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<div id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login.jsp"> <i
							class="fas fa-house-user"></i> Inicio
					</a></li>
				</ul>
			</div>
		</div>
		<!-- <div class="col-4">
	    <a class="navbar-brand links" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</a>
	    </div> -->
	</nav>
	<br>
	<!-- <div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="button" onclick="window.location.href='/insertarusuario.jsp'">Agregar</button>
  <button class="btn btn-primary" type="button">Actualizar</button>
  <button class="btn btn-primary" type="button">Eliminar</button>
</div> -->

	<script>
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
		var baseurld = baseUrl+"/listarclientes";
		function loadproveedores() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseurld, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var proveedores = JSON.parse(xmlhttp.responseText);
					var tbltop = "<table class='table table-dark table-striped'><tr><th>cedula_proveedor</th><th>ciudad_proveedor</th><th>direccion_proveedor</th><th>nombre_proveedor</th><th>telefono_proveedor</th></tr>";
					var main = "";
					for (i = 0; i < proveedores.length; i++) {
						main += "<tr><td>" + proveedores[i].cedula_cliente
								+ "</td><td>" + proveedores[i].direccion_cliente
								+ "</td><td>"
								+ proveedores[i].nombre_cliente
								+ "</td><td>" + proveedores[i].telefono_cliente
								+ "</td><td>"
								+ proveedores[i].correo_cliente
								+ "</td></tr>";
					}
					var tblbottom = "</table>";
					var tbl = tbltop + main + tblbottom;
					document.getElementById("proveedoresinfo").innerHTML = tbl;
				}
			};
			xmlhttp.send();
		}
		window.onload = function() {
			loadproveedores();
		}
	</script>
	<center>
		<h1 class="title">
			<i class="fas fa-list-ol"></i> Tabla de Clientes
		</h1>
	</center>
	<div class="container">
		<div class="row">
			<!--  Aqui es donde se autogenera la tabla basado en el script -->
			<div class="col align-self-center" id="proveedoresinfo"></div>

		</div>
	</div>
</body>
</html>