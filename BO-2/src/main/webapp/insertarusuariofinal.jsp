<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sofía Castañeda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/insertarusuario.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/insertarusuario.css" rel="stylesheet" type="text/css" />

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


						<i class="fas fa-user-circle titulo fa-4x"></i> <br> <br>
						<h1 class="titulo">SU TIENDA GENÉRICA</h1>
						<h4 class="titulo">Registre los datos del nuevo usuario</h4>
					</center>
					<br>
					<center>
						<br>
					</center>
					<center>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="Cédula" required
								id="cedula_usuario" aria-label="Username"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="far fa-user-circle"></i></span> <input type="text"
								class="form-control" placeholder="Nombre Completo" required
								id="nombre_usuario" aria-label="Username"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-map-marker-alt"></i></span> <input type="text"
								class="form-control" placeholder="Email usuario" required
								id="email_usuario" aria-label="Username"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-mobile-alt"></i></span> <input type="text"
								class="form-control" placeholder="Usuario" required id="user"
								aria-label="Username" aria-describedby="basic-addon1">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-globe-americas"></i></span> <input type="password"
								class="form-control" placeholder="Password" required
								id="password" aria-label="Username"
								aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="d-grid gap-2 col-6 mx-auto">
							<button class="btn btn-success" type="button" onclick="enviar()">
								<i class="fas fa-user-plus"></i> REGISTRAR
							</button>
							<br>
						</div>

						<center>
							<div id="error" class="alert alert-danger visually-hidden"
								role="alert">
								Archivo no valido, verifique e intente nuevamente (Archivo CSV)
								<i class="far fa-frown"></i>
							</div>
						</center>

						<center>
							<div id="correcto" class="alert alert-success visually-hidden"
								role="alert">
								Archivo cargado con exito <i class="far fa-laugh-wink"></i>
							</div>
						</center>
					</center>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* Usuarios */

		function enviar() {
			
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
			var x = document.getElementById("user").value;
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl+'/listarusuarios', false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].usuario);
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].usuario === x) {
					console.log(usuarios[i].usuario + " " + x);
					coincidencia = true
					break;
				}

				if (usuarios[i].cedula_usuario === y) {
					console.log(usuarios[i].cedula_usuario + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia == false) {
				var formData = new FormData();
				formData.append("cedula_usuario", document
						.getElementById("cedula_usuario").value);
				formData.append("email_usuario", document
						.getElementById("email_usuario").value);
				formData.append("nombre_usuario", document
						.getElementById("nombre_usuario").value);
				formData.append("password",
						document.getElementById("password").value);
				formData.append("usuario",
						document.getElementById("user").value);
				var xhr = new XMLHttpRequest();
				xhr.open("POST", baseUrl+"/registrarusuario");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}
	</script>




</body>
</html>