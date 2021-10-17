<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sofía Castañeda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/eliminarproveedores.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/eliminarproveedores.css" rel="stylesheet" type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">


</head>


<body>

	<h5>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<div id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"> <i
							class="fas fa-house-user"></i> Inicio
					</a></li>
				</ul>
			</div>
		</div>
		</h5>


	<div class="container p-4">
		<div class="row justify-content-end">
			<div class="col-10">
				<div class="formulario">
					<center>

						<br> <i class="fas fa-user-circle titulo fa-4x"></i> <br>
						<br>
						<h1 class="titulo">SU TIENDA GENÉRICA</h1>
						<h4 class="titulo">Complete los datos del proveedor a
							eliminar</h4>
					</center>
					<br>
					<center>

						<br> <br>
					</center>
					<center>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="Cédula" aria-label="Username"
								aria-describedby="basic-addon1" required id="cedula_proveedor">
						</div>
						<br>
						<div class="d-grid gap-2 col-2 mx-auto">
							<button type="button" class="btn btn-danger" onclick="eliminar()">
								<i class="fas fa-user-plus"></i> ELIMINAR
							</button>
							<br>
						</div>
						<div id="error" class="alert alert-danger visually-hidden"
							role="alert">Error al eliminar el proveedor, verifique que
							exista un usuario con la cédula ingresada</div>

						<div id="correcto" class="alert alert-success visually-hidden"
							role="alert">Usuario eliminado con exito</div>
						<center>
				</div>
			</div>
		</div>
	</div>


	<script>
		function eliminar() {
			var y = document.getElementById("cedula_proveedor").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarproveedores', false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedores.length; i++) {

				console.log(proveedores[i].cedula_proveedor);
				if (proveedores[i].cedula_proveedor == y) {
					console.log(proveedores[i].cedula_proveedor + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var cedula = document.getElementById("cedula_proveedor").value;

				var xhr = new XMLHttpRequest();
				xhr.open("DELETE",
						"http://localhost:8080/eliminarproveedor?cedula_proveedor="
								+ cedula);

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_proveedor").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("cedula_proveedor").value = "";
				;
			}
		}
	</script>




</body>
</html>