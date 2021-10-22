<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sof�a Casta�eda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/buscarproveedor.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/buscarproveedor.css" rel="stylesheet" type="text/css" />

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
						<h1 class="titulo">SU TIENDA GEN�RICA</h1>
						<h4 class="titulo">Ingrese el dato del proveedor a buscar</h4>
						<br>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="cedula proveedor"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="usersearch">
						</div>

					</center>
					<br>
					<center>

						<br> <br>
					</center>

					<center>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-id-card-alt"></i></span> <input type="text"
								class="form-control" placeholder="C�dula" aria-label="Username"
								aria-describedby="basic-addon1" required id="cedula_proveedor"
								disabled="disabled">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="far fa-user-circle"></i></span> <input type="text"
								class="form-control" placeholder="Nombre Completo"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="nombre_proveedor" disabled="disabled">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-envelope"></i></i></span> <input type="text"
								class="form-control" placeholder="Ciudad" aria-label="Username"
								aria-describedby="basic-addon1" required id="ciudad_proveedor"
								disabled="disabled">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-map-marker-alt"></i></span> <input type="text"
								class="form-control" placeholder="Direcci�n"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="direccion_proveedor" disabled="disabled">
						</div>

						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i
								class="fas fa-mobile-alt"></i></span> <input type="password"
								class="form-control" placeholder="Contacto"
								aria-label="Username" aria-describedby="basic-addon1" required
								id="telefono_proveedor" disabled="disabled">
						</div>
						<br>
						<div class="d-grid gap-2 col-4 mx-auto">
							<button type="button" class="btn btn-warning" onclick="enviar()"">
								<i class="fas fa-search"></i> BUSCAR
							</button>
							<br>

							<div id="error" class="alert alert-danger visually-hidden"
								role="alert">Error al buscar el cliente, el cliente no
								existe</div>

							<div id="correcto" class="alert alert-success visually-hidden"
								role="alert">Proveedor encontrado con exito</div>
					</center>
				</div>
			</div>
		</div>
	</div>
	</div>


	 	<script>
		function enviar() {
				
				var getUrl = window.location;
				var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var user=   document.getElementById("usersearch").value;
				//req.open('GET', 'http://localhost:8080/consultarproveedor?proveedor='+user, false);
				req.open('GET',baseUrl+'/consultarproveedor?nit='+ user, false);
				req.send(null);
				var cedula_proveedor = null;
				if (req.status == 200)
					cedula_proveedor = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));
				
			

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				console.log(cedula_proveedor.toString());
				
			if (cedula_proveedor.toString()!=""){

				document.getElementById("cedula_proveedor").value = cedula_proveedor[0].cedula_proveedor;
				document.getElementById("ciudad_proveedor").value = cedula_proveedor[0].ciudad_proveedor;
				document.getElementById("direccion_proveedor").value = cedula_proveedor[0].direccion_proveedor;
				document.getElementById("nombre_proveedor").value = cedula_proveedor[0].nombre_proveedor;
				document.getElementById("telefono_proveedor").value = cedula_proveedor[0].telefono_proveedor;
				
				document.getElementById("usersearch").value = "";
			

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