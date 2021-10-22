
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sofía Castañeda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/actualizarcliente.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/actualizarcliente.css" rel="stylesheet" type="text/css" />

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
						<h4 class="titulo">Registre los datos del cliente</h4>
					</center>
					<br>
					<center>
						<br>
					</center>

					<center>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="Cédula" aria-label="Username"
								aria-describedby="basic-addon1" required id="cedula_cliente">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="far fa-user-circle"></i></span> <input type="text"
								class="form-control" placeholder="Nombre Completo"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="nombre_cliente">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-envelope"></i></i></span> <input type="text"
								class="form-control" placeholder="Email" aria-label="Username"
								aria-describedby="basic-addon1" required id="correo_cliente">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-map-marker-alt"></i></i></span> <input type="text"
								class="form-control" placeholder="Dirección"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="direccion_cliente">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-mobile-alt"></i></span> <input type="password"
								class="form-control" placeholder="Contacto"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="telefono_cliente">
						</div>
						<br>
						<div class="d-grid gap-2 col-3 mx-auto">
							<button type="button" class="btn btn-outline-info"
								onclick="actualizar()">
								</i> <i class="fas fa-sync"></i> ACTUALIZAR
							</button>
							<br>
							<div id="error" class="alert alert-danger visually-hidden"
								role="alert">Error al actualizar el cliente, verifique que
								la cedula y usuario dados sean validos</div>

							<div id="correcto" class="alert alert-success visually-hidden"
								role="alert">Usuario actualizado con exito</div>
					</center>
				</div>
			</div>
		</div>
	</div>
	</div>


	<script>
		function actualizar() {
			var x = document.getElementById("nombre_cliente").value;
			var y = document.getElementById("cedula_cliente").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarclientes', false);
			req.send(null);
			var clientes = null;
			if (req.status == 200)
				clientes = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < clientes.length; i++) {
				console.log(clientes[i].nombre_cliente);
				console.log(clientes[i].cedula_cliente);
				if (clientes[i].nombre_cliente === x) {
					console.log(clientes[i].cliente + " " + x);
					coincidencia = true
					break;
				}

				if (clientes[i].cedula_cliente == y) {
					console.log(clientes[i].cedula_cliente + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var formData = new FormData();
				formData.append("cedula_cliente", document
						.getElementById("cedula_cliente").value);
				formData.append("direccion_cliente", document
						.getElementById("direccion_cliente").value);
				formData.append("nombre_cliente", document
						.getElementById("nombre_cliente").value);
				formData.append("telefono_cliente", document
						.getElementById("telefono_cliente").value);
				formData.append("correo_cliente",
						document.getElementById("correo_cliente").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarcliente");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
				document.getElementById("correo_cliente").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
				document.getElementById("correo_cliente").value = "";
			}
		}
	</script>



</body>
</html>


