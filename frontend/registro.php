<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width-device-width, initial-scale=1.0" />
        <title>Registro</title>
        <link rel="shorthcut icon" href="images/logo1.png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/main.css">
         <!-- Google Fonts -->
         <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      
         <!-- Vendor CSS Files -->
         <link href="css/css/vendor/aos/aos.css" rel="stylesheet">
         <link href="css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
         <link href="css/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
         <link href="css/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
         <link href="css/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
         <link href="css/vendor/remixicon/remixicon.css" rel="stylesheet">
         <link href="css/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
       
         <!-- Template Main CSS File -->
         <link href="css/css/style.css" rel="stylesheet">
      
      </head>
      
      <body onload="redireccion()">
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top  align-items-center">
          <div class="container-fluid">
            <div class="header-container d-flex align-items-center justify-content-between">
              <div class="logo">
               <!--Modificacion Se quita h1 del nav-->
                <a href="index.html"><img src="images/logo.png" alt=""class="img-fluid" width="150px"></a>
              </div>
      
              <nav id="navbar" class="navbar">
                <ul>
                  <li><a class="nav-link scrollto active" href="/index.html">Inicio</a></li>
                  <li><a class="nav-link scrollto " href="/recluting.html">Cursos y reclutamiento</a></li>
                  <li><a class="nav-link scrollto" href="/contacto.html">Contacto</a></li>
                  <li><a class="nav-link scrollto" href="/login.html">Ingresar</a></li>
                  <li><a class="nav-link scrollto" href="/registro.html">Registro</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
              </nav><!-- .navbar -->
      
            </div><!-- End Header Container -->
          </div>
          
        </header><!-- End Header -->

        <br><br><br>
    <main>
        <div class="container w-50 my-3 p-4 main-container">
          <div class="container2">
            
<h1>Datos de Registro</h1>
<br>
<?php

$servername = "fdb32.awardspace.net";
$username = "3938129_bdtf2";
$password = "qvXWR9qdpB";
$base_datos = "3938129_bdtf2";

$conex =  mysqli_connect($servername, $username, $password, $base_datos); 
if (!$conex) 
{
	die("No hay conexión: ".mysqli_connect_error());
}

		$usuario = $_POST["usuario"];
		$contrasena = $_POST["contrasena"];
		$nombre = $_POST["nombre"];
		$apellido = $_POST["apellido"];
		$telefono = $_POST["telefono"];
		$fechadenacimiento = $_POST["fechanacimiento"];
		$provincia = $_POST["provincia"];
		$pais = $_POST["pais"];
		$email = $_POST["email"];
		$fechareg = date("d/m/y");
		
	
		print "<p><b> Fecha De Registro: $fechareg </b></p>\n";
		print "\n";


	$consulta = "INSERT INTO REGISTRADOS(usuario, contrasena, email, fechadenacimiento, pais, provincia, telefono, nombre, apellido, fechareg) VALUES ('$usuario','$contrasena','$email','$fechadenacimiento','$pais','$provincia','$telefono','$nombre','$apellido','$fechareg')";


if ($conex ){
    echo "<p><b>Conexión Exitosa</b></p>";
} else{
echo "<p><b>Falla en Conexión</b></p>";
}

if ($consulta ){
    echo "<p><b>Registro Exitoso</b></p>";
} else{
echo "<p><b>Falla Registro<b></p>";
}

if (mysqli_query($conex, $consulta)) {
      echo "<b>Registro Nuevo Exitoso</b>";
} else {
      echo "Error: " . $consulta . "<br>" . mysqli_error($conex);
}

mysqli_close($conex);
	
?>
<br>

<br>
<div id="datosDelUsuario">
  <p></p>
</div>
<div id="usuario">
<br>
 </div>
        </div>
    </main>
    <footer>
        <div class="container p-3">
            <div class="row text-center text-white">
                <div class="col ml-auto">
                    <p>Author: Equipo TeamFire</p>
                    <p>practicasispc@gmail.com</p>
                    <p>Copyright © 2021-2022 , todos los derechos reservados.</p>
                </div>
            </div>
        </div>
    </footer>
   
	

  <!-- Template Main JS File -->
  <script src="css/js/main.js"></script>

  <!-- JavaScript Bundle with Popper -->
 
     <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
		
    <script src="js/funciones-a3-g8.js" ></script>
	
	</body>
</html>