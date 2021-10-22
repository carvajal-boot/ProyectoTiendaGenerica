<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Sofía Castañeda</title>

<!-- LLamando librerias y estilos de Bootstarp -->
<link href="Style/ingresarproductos.css" rel="stylesheet"
	type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="Style/ingresarproductos.css" rel="stylesheet"
	type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<body>


	<div style="padding-left: 5px">
		<br>
		<h1>
			<center>
				<br> <br>
				<div class="formulario">
					<i class="fas fa-file-csv"></i> ACTUALIZACIÓN DE INVENTARIO
				</div>
				<br>
		</h1>
		</center>
		<div class="container">
			<br> <br> <br>
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

			<form id="form1">
				<div>
					<center>
						<h4>
							<label for="formFileLg" class="form-label">
						</h4>
						<br> <br> </label> <input class="form-control form-control-lg"
							id="archivo" type="file" accept=".csv">
					</center>
					<br>
					<center>
						<br> <br>
						<div class="d-grid gap-2 col-3 mx-auto">
							<button type="button" class="btn btn-success"
								onclick="subirArchivo()">
								<i class="fas fa-arrow-circle-up"></i> CARGAR
							</button>
						</div>
						<br>
						<div class="d-grid gap-2 col-3 mx-auto">
							<button type="button" class="btn btn-secondary">
								<i class="far fa-window-close"></i> CANCELAR
							</button>
						</div>
						<br> <br> <br> <br> <br>
						<h6 class="titulo">---¿Necesitas Ayuda?---</h6>
						<h6 class="titulo">
							<i class="fab fa-whatsapp"></i> Escribenos 321 520 7896
						</h6>
					</center>
				</div>

			</form>

		</div>

	</div>

	<script>
		function subirArchivo() {
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

			try {

				var csvFile = document.getElementById("archivo");

				var input = csvFile.files[0];
				var reader = new FileReader();

				reader.onload = function(e) {

					var text = e.target.result;

					var arrayLineas = text.split("\n");

					var xhr = new XMLHttpRequest();
					xhr.open("DELETE",
							baseUrl+"/eliminartodoproducto", true);
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
								baseUrl+"/registrarproducto");

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

</body>
</html>