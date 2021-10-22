<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sofía Castañeda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/insertarproveedor.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/insertarproveedor.css" rel="stylesheet" type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">


</head>


<body>

	<!-- Barra de Navegación -->
	<!--nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<div id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="index.html"> <i class="fas fa-home fa 5x"></i> Inicio</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav-->



	<div class="container p-4">
		<div class="row justify-content-end">
			<div class="col-10">
				<div class="formulario">
					<center>

						<br> <i class="fas fa-user-circle titulo fa-4x"></i> <br>
						<br>
						<h1 class="titulo">SU TIENDA GENERICA</h1>
						<h4 class="titulo">Registre los datos del nuevo proveedor</h4>
					</center>
					<br>
					<center>
						<br>
					</center>
					<center>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="Nit" aria-label="Username"
								aria-describedby="basic-addon1" required id="cedula_proveedor">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="far fa-user-circle"></i></span> <input type="text"
								class="form-control" placeholder="Nombre Completo"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="nombre_proveedor">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-map-marker-alt"></i></span> <input type="text"
								class="form-control" placeholder="Direccion"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="direccion_proveedor">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-mobile-alt"></i></span> <input type="text"
								class="form-control" placeholder="Telefono"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="telefono_proveedor">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-globe-americas"></i></span> <input type="text"
								class="form-control" placeholder="Ciudad" aria-label="Username"
								aria-describedby="basic-addon1" required id="ciudad_proveedor">
						</div>
						<br>
						<div class="d-grid gap-2 col-4 mx-auto">
							<button class="btn btn-dark" type="button"
								onclick="enviarproveedor()">
								<i class="fas fa-user-plus"></i> REGISTRAR
							</button>
							<br>
						</div>

						<div id="error" class="alert alert-danger visually-hidden"
							role="alert">Error al crear el usuario, verifique que no
							exista un usuario con la cedula y usuario dados</div>

						<div id="correcto" class="alert alert-success visually-hidden"
							role="alert">Usuario creado con exito</div>
					</center>
				</div>
			</div>
		</div>
	</div>

	<script>
		function enviarproveedor() {
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
			var x = document.getElementById("nombre_proveedor").value;
			var y = document.getElementById("cedula_proveedor").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl+'/listarproveedores', false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedores.length; i++) {
				console.log(proveedores[i].nombre_proveedor);
				console.log(proveedores[i].nombre_proveedor);
				if (proveedores[i].cedula_proveedor == x) {
					console.log(proveedores[i].cedula_proveedor + " " + x);
					coincidencia = true
					break;
				}

				if (proveedores[i].nombre_proveedor === y) {
					console.log(proveedores[i].nombre_proveedor + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia == false) {
				var formData = new FormData();
				formData.append("cedula_proveedor", document
						.getElementById("cedula_proveedor").value);
				formData.append("ciudad_proveedor", document
						.getElementById("ciudad_proveedor").value);
				formData.append("direccion_proveedor", document
						.getElementById("direccion_proveedor").value);
				formData.append("nombre_proveedor", document
						.getElementById("nombre_proveedor").value);
				formData.append("telefono_proveedor", document
						.getElementById("telefono_proveedor").value);
				var xhr = new XMLHttpRequest();
				xhr.open("POST", baseUrl+"/registrarproveedor");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_proveedor").value = "";
				document.getElementById("ciudad_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_proveedor").value = "";
				document.getElementById("ciudad_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
			}
		}
	</script>
</body>
</html>