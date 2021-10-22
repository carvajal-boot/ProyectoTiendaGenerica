<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>repl.it</title>
<link href="Style/home.css" rel="stylesheet" type="text/css" />
<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/home.css" rel="stylesheet" type="text/css" />
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


</head>
<!-- font awesome-->
<script src="https://kit.fontawesome.com/8e9e769e03.js"
	crossorigin="anonymous">
	
</script>

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
	<!-- <div class="col-4">
	    <a class="navbar-brand links" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</a>
	    </div> -->
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2018/09/21/17/04/grocery-3693521_960_720.jpg"
							alt="Card image cap" height="210">
					</div>
					<div class="card-body">
						<center>
							<h5 class="card-title">USUARIOS</h5>
							<p class="card-text">Modulo para gestionar los usuarios de la
								tienda generica</p>
					</div>
					</center>
					<ul class="list-group list-group-flush">
						<button type="button" class="btn btn-success"
							onclick="window.location.href='/insertarusuariofinal.jsp'">
							<i class="fas fa-user-plus"></i> Agregar
						</button>

						<button type="button" class="btn btn-warning"
							onclick="window.location.href='/actualizarusuario.jsp'">
							<i class="fas fa-redo"></i> Actualizar
						</button>

						<button type="button" class="btn btn-primary"
							onclick="window.location.href='/buscarusuario.jsp'">
							<i class="fas fa-search"></i> Buscar
						</button>


						<button type="button" class="btn btn-danger"
							onclick="window.location.href='/eliminarusuario.jsp'">
							<i class="far fa-trash-alt"></i> Eliminar
						</button>
						<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/listausuarios3.jsp'">
							<i class="fas fa-list-ol"></i> Enlistar
						</button>

					</ul>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2019/04/10/12/34/fruit-seller-4117006_960_720.png"
							alt="Card image cap" height="210">
					</div>
					<div class="card-body">
						<center>
							<h5 class="card-title">CLIENTES</h5>
							<p class="card-text">Modulo para gestionar los clientes de la
								tienda generica</p>
					</div>
					</center>
					<ul class="list-group list-group-flush">
						<button type="button" class="btn btn-success"
							onclick="window.location.href='/insertarcliente.jsp'">
							<i class="fas fa-user-plus"></i> Agregar
						</button>

						<button type="button" class="btn btn-warning"
							onclick="window.location.href='/actualizarcliente.jsp'">
							<i class="fas fa-redo"></i> Actualizar
						</button>

						<button type="button" class="btn btn-primary"
							onclick="window.location.href='/buscarcliente.jsp'">
							<i class="fas fa-search"></i> Buscar
						</button>


						<button type="button" class="btn btn-danger"
							onclick="window.location.href='/eliminarcliente.jsp'">
							<i class="far fa-trash-alt"></i> Eliminar
						</button>
						<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/listacliente3.jsp'">
							<i class="fas fa-list-ol"></i> Enlistar
						</button>

					</ul>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2019/03/13/13/25/grocery-4052896_960_720.jpg"
							alt="Card image cap" height="210">
					</div>

					<div class="card-body">
						<center>
							<h5 class="card-title">PROVEEDORES</h5>
							<p class="card-text">Modulo para gestionar los proveedores de
								la tienda generica</p>
					</div>
					</center>
					<ul class="list-group list-group-flush">
						<button type="button" class="btn btn-success"
							onclick="window.location.href='/insertarproveedor.jsp'">
							<i class="fas fa-user-plus"></i> Agregar
						</button>

						<button type="button" class="btn btn-warning"
							onclick="window.location.href='/actualizarproveedor.jsp'">
							<i class="fas fa-redo"></i> Actualizar
						</button>

						<button type="button" class="btn btn-primary"
							onclick="window.location.href='/buscarproveedor.jsp'">
							<i class="fas fa-search"></i> Buscar
						</button>


						<button type="button" class="btn btn-danger"
							onclick="window.location.href='/eliminarproveedor.jsp'">
							<i class="far fa-trash-alt"></i> Eliminar
						</button>
						<button type="button" class="btn btn-secondary"
							onclick="window.location.href='/listaproveedores.jsp'">
							<i class="fas fa-list-ol"></i> Enlistar
						</button>

					</ul>

				</div>
			</div>
		</div>

		<br> <br>

		<div class="row">

			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<button type="button" class="btn btn-info"
						onclick="window.location.href='/ingresarproductos.jsp'">

						<i class="fas fa-arrow-circle-up"></i> Ingresar
					</button>
					<div class="card-body">
						<center>
							<h5 class="card-title">PRODUCTOS</h5>
							<p class="card-text">Modulo para gestionar los productos de
								la tienda generica</p>
					</div>
					</center>


					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_960_720.png"
							alt="Card image cap" height="200">
					</div>




				</div>
			</div>

			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<button type="button" class="btn btn-info"
						onclick="window.location.href='/insertarventa.jsp'">

						<i class="fas fa-arrow-circle-up"></i> Ingresar
					</button>
					<div class="card-body">
						<center>
							<h5 class="card-title">VENTAS</h5>
							<p class="card-text">Modulo para gestionar sus ventas de
								la tienda generica</p>
					</div>
					</center>


					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2016/06/13/09/57/meeting-1453895_1280.png"
							alt="Card image cap" height="200">
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card shadow" style="width: 25rem;">
					<button type="button" class="btn btn-info"
						onclick="window.location.href='/reporteclientes.jsp'">

						<i class="fas fa-arrow-circle-up"></i> Ingresar
					</button>
					<div class="card-body">
						<center>
							<h5 class="card-title">REPORTES</h5>
							<p class="card-text">Modulo para gestionar reportes de
								la tienda generica</p>
					</div>
					</center>

					<div class="inner">
						<img class="card-img-top"
							src="https://cdn.pixabay.com/photo/2017/06/10/07/18/list-2389219_1280.png"
							alt="Card image cap" height="200">
					</div>
				</div>
			</div>



			<center>
				<div id="error" class="alert alert-danger visually-hidden"
					role="alert">
					Archivo no valido, verifique e intente nuevamente (Archivo CSV) <i
						class="far fa-frown"></i>
				</div>
			</center>

			<center>
				<div id="correcto" class="alert alert-success visually-hidden"
					role="alert">
					Archivo cargado con exito <i class="far fa-laugh-wink"></i>
				</div>
			</center>
		</div>

		<script>
			function subirArchivo() {

				try {

					var csvFile = document.getElementById("archivo");

					var input = csvFile.files[0];
					var reader = new FileReader();

					reader.onload = function(e) {

						var text = e.target.result;

						var arrayLineas = text.split("\n");

						var xhr = new XMLHttpRequest();
						xhr.open("DELETE",
								"http://localhost:8080/eliminartodoproducto",
								true);
						xhr.send();

						for (var i = 0; i < arrayLineas.length; i += 1) {
							var arraydatos = arrayLineas[i].split(",");

							if (arrayLineas[i] == "") {
								continue;
							}

							for (var j = 0; j < arraydatos.length; j += 1) {
								console.log(i + " " + j + "->" + arraydatos[j]);
							}

							var formData = new FormData();
							formData.append("codigo_producto", arraydatos[0]);
							formData.append("nombre_producto", arraydatos[1]);
							formData.append("nit_proveedor", arraydatos[2]);
							formData.append("precio_compra", arraydatos[3]);
							formData.append("iva_compra", arraydatos[4]);
							formData.append("precio_venta", arraydatos[5]);
							var xhr = new XMLHttpRequest();
							xhr.open("POST",
									"http://localhost:8080/registrarproducto");

							xhr.send(formData);
						}

						var element = document.getElementById("error");
						element.classList.add("visually-hidden");
						var element2 = document.getElementById("correcto");
						element2.classList.remove("visually-hidden");

						document.getElementById("archivo").value = "";

					};

					reader.readAsText(input);
				} catch (error) {
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					var element2 = document.getElementById("correcto");
					element2.classList.add("visually-hidden");

					document.getElementById("archivo").value = "";
				}
			}
		</script>
		<br> <br>
</body>
</html>