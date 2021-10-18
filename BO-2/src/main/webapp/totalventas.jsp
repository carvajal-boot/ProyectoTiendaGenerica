<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>repl.it</title>
<link href="style.css" rel="stylesheet" type="text/css" />
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
<link href="style.css" rel="stylesheet" type="text/css" />
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
		/* var baseurl = "http://localhost:8080/listarclientesreportes";
		function loadproveedores() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseurl, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var proveedores = JSON.parse(xmlhttp.responseText);
					var tbltop = "<table class='table table-dark table-striped'><tr><th>codigo_venta</th><th>cedula_usuario</th><th>cedula_cliente</th><th>iva_venta</th><th>total_venta</th></tr>valor_venta</th></tr>";
					var main = "";
					for (i = 0; i < proveedores.length; i++) {
						main += "<tr><td>" + proveedores[i].codigo_venta
								+ "</td><td>" + proveedores[i].cedula_usuario
								+ "</td><td>" + proveedores[i].cedula_cliente
								+ "</td><td>" + proveedores[i].iva_venta
								+ "</td><td>" + proveedores[i].total_venta
								+ "</td></tr>" + proveedores[i].valor_venta
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
		 */

		function enviar() {

			var req = new XMLHttpRequest();
			var coincidencia = false;
			var user = document.getElementById("usersearch").value;
			req.open('GET', 'http://localhost:8080/listarreportes?cliente='
					+ user, false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				var proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));
			var tbltop = "<table class='table table-dark table-striped'><tr><th>codigo_venta</th><th>cedula_usuario</th><th>cedula_cliente</th><th>iva_venta</th><th>total_venta</th><th>valor_venta</th></tr>";
			var main = "";
			for (i = 0; i < proveedores.length; i++) {
				main += "<tr><td>" + proveedores[i].codigo_venta + "</td><td>"
						+ proveedores[i].cedula_usuario + "</td><td>"
						+ proveedores[i].cedula_cliente + "</td><td>"
						+ proveedores[i].iva_venta + "</td><td>"
						+ proveedores[i].total_venta + "</td><td>"
						+ proveedores[i].valor_venta + "</td></tr>";
			}
			var tblbottom = "</table>";
			var tbl = tbltop + main + tblbottom;
			document.getElementById("proveedoresinfo").innerHTML = tbl;

			document.getElementById("usersearch").value = "";

		}

		function total() {

			var req = new XMLHttpRequest();
			var coincidencia = false;
			var user = document.getElementById("usersearch").value;
			req.open('GET', 'http://localhost:8080/listarreportes?cliente='
					+ user, false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				var proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (var i = 0; i <= proveedores.length; i++) {
				numero = proveedores[i].valor_venta;
				suma += numero;
			}
			document.getElementById("nit_cliente").value = proveedores[0].valor_venta;
		}
	</script>



	</script>
	<center>
		<h1 class= "title">
			<i class="fas fa-list-ol"></i> Tabla de Ventas
		</h1>
	</center>
	<div class="container">
		<div class="row">
			<!--  Aqui es donde se autogenera la tabla basado en el script -->
			<div class="col align-self-center" id="proveedoresinfo"></div>

		</div>


	</div>
	<div class="input-group">
		<span class="input-group-text" id="basic-addon1"><i
			class="fas fa-id-card-alt"></i></span> <input type="text"
			class="form-control" placeholder="cedula cliente"
			aria-label="Username" aria-describedby="basic-addon1" required
			id="usersearch">
	</div>
	<button type="button" class="btn btn-warning" onclick="enviar()">
		<i class="fas fa-search"></i> BUSCAR
	</button>
	<div class="input-group">
		<span class="input-group-text" id="usersearch"><i
			class="fas fa-id-card-alt"></i></span> <input type="text"
			class="form-control" placeholder="Total" aria-label="Username"
			aria-describedby="basic-addon1" required id="nit_cliente"
			disabled="disabled">
	</div>
</body>
</html>