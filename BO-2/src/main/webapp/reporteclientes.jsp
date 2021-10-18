<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>repl.it</title>
<link href="Style/reporteclientes.css" rel="stylesheet"
	type="text/css" />
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
			<div class="col-md-3">
				<div class="card shadow" style="width: 20rem;">
					<img class="card-img-top"
						src="https://cdn.pixabay.com/photo/2016/06/13/15/07/presentation-1454403_960_720.png"
						alt="Card image cap" height="210">
					<div class="card-body">
						<center>
							<h5 class="card-title">CONSULTA REPORTES</h5>
					</div>
					     </center>
					     
					<ul class="list-group list-group-flush">
						<button type="button" class="btn btn-success"
							onclick="window.location.href='/listausuarios3.jsp'">
							<i class="fas fa-user-plus"></i> Listado de usuarios
						</button>

						<button type="button" class="btn btn-warning"
							onclick="window.location.href='/listacliente.jsp'">
							<i class="fas fa-redo"></i> Listado de clientes
						</button>

						<button type="button" class="btn btn-primary"
							onclick="window.location.href='/totalventas.jsp'">
							<i class="fas fa-search"></i> Listado de ventas
						</button>

</ul>

				</div>
			</div>
			</center>
			</body>
			</html>