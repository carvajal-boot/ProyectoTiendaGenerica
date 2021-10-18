<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description"
	content="Proyecto de entrenamiento en desarrollo web" />
<meta name="author" content="Ing. Diego Rodriguez" />
<title>Lista de clientes</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
	
	<link href="Style/listacliente.css" rel="stylesheet" type="text/css" />
	
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

<script>
	
	window.addEventListener('DOMContentLoaded', event => {
	    // Simple-DataTables
	    // https://github.com/fiduswriter/Simple-DataTables/wiki
		let table=null;
	    if (datatablesclients) {
	        table=new simpleDatatables.DataTable("#datatablesclients", {
	            searchable: true,
	            labels: {
	                placeholder: "Buscar...",
	                perPage: "{select} registros por pagina",
	                noRows: "No hay registros",
	                info: "Mostrando {start} a {end} de {rows} registros",
	            }
	        });
	    }
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "http://localhost:8080/listarclientes", true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

					var usuarios = JSON.parse(xmlhttp.responseText);
					
					for (i = 0; i < usuarios.length; i++) {
						let fila = [
							usuarios[i].cedula_cliente.toString(), 
							usuarios[i].direccion_cliente, 
							usuarios[i].correo_cliente, 
							usuarios[i].nombre_cliente, 
							usuarios[i].telefono_cliente
						];

					    table.rows().add(fila);
					}
				}
			};
			
			xmlhttp.send();
	});
</script>

</head>


									<table id="datatablesclients">
									<div style="padding-left: 5px;">
									
	   </div>
	   <center>
		<h1 class="title"><i class="fas fa-list-ol"></i> Tabla de clientes</h1>
		
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="usuariosinfo">
					
					</div>
	
				</div>
			</div>
										<tbody id="clientesinfo">

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<div w3-include-html="snippets/footer.html"></div>


	</div>



	<script>
		includeHTML();
	</script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>

</body>
</html>