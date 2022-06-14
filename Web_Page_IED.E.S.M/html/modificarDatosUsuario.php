<?php include('../PHP/datos.php');
include "../PHP/actualizar.php";
include "../PHP/conexion.php";

session_start();
$usuario = $_SESSION["usuario"];
$userM =  $_GET['user'];

$rol = array('Administrador');

if (!isset($usuario)) {
  header("Location: ./login.html");
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="../css/generalStyles.css">
  <link rel="stylesheet" href="../css/menu.css">
  <link rel="stylesheet" href="../css/table.css">
  <link rel="stylesheet" href="../css/formMDU.css">
  <title>Modificar Datos de Usurio</title>
</head>

<body>

  <!-- <?php include "./header.php" ?> -->

  <main>
    <article id="tab1" class="articulo-login">
      <div class="login-titulo">
        <h3>Actualiza Datos</h3>
      </div>

      <form action="" method="POST" class="form-login">


        <label for="userName" class="short short-1">
          <span>Nombre de Usuario</span>
          <input type="text" name="userName" id="userName" placeholder="UserName" value=""  required />
        </label>
        
        <label for="typeDoc">
          <span>Tipo de Documento</span>
          <select name="typeDoc" id="typeDoc">
            <option selected value="NN">No definida</option>
            <option value="CC">Cedula de Ciudadania</option>
            <option value="TI">Tarjeta de Identidad</option>
            <option value="CI">Certicado de Extranjería</option>
          </select>
        </label>
        <label for="nDoc">
          <span>Documento</span>
          <input type="text" name="nDoc" id="nDoc" placeholder="N° Documento" />
        </label>
        <label for="p_nombre">
          <span>Primer Nombre</span>
          <input type="text" name="p_nombre" placeholder="p_nombre" id="p_nombre" required />
        </label>
        <label for="s_nombre">
          <span>Segundo Nombre</span>
          <input type="text" name="s_nombre" placeholder="s_nombre" id="s_nombre" />
        </label>
        <label for="p_apellido">
          <span>Primer Apellido</span>
          <input type="text" name="p_apellido" placeholder="p_apellido" id="p_apellido" required />
        </label>
        <label for="s_apellido">
          <span>Segundo Apellido</span>
          <input type="text" name="s_apellido" placeholder="s_apellido" id="s_apellido" />
        </label>
        <label for="edad">
          <span>Edad</span>
          <input type="number" name="edad" placeholder="edad" id="edad" required />
        </label>
        <label for="sexo">
          <span>Sexo</span>
          <select name="sexo" id="sexo">
            <option value="F">Femenino</option>
            <option value="M">Masculino</option>
          </select>
        </label>
        <label for="telefono">
          <span>Telefono</span>
          <input type="number" name="telefono" placeholder="telefono" id="telefono" required />
        </label>
        <label for="email" class="short short-2">
          <span>Correo Electronico</span>
          <input type="email" name="email" placeholder="user@email.com" id="email" autocompe="email" required />
        </label>
        <label for="id_rol">
          <span>Rol</span>
          <select name="id_rol" id="id_rol" disabled>
            <option value="E">Estudiante</option>
            <option value="D">Docente</option>
            <option value="A">Administrador</option>
          </select>
        </label>

        <div class="acciones">
          <input type="submit" class="boton_envio" name="form_update" id="update" value="Actualizar" />
          <a href="./verDatosUsuario.php"><button class="boton" type="button">Regresar</button></a>
        </div>

        <div class="mensaje-error"></div>

      </form>

      <?php

      if (isset($_POST['form_update'])) {
        $datos = array(
          "nombre_perfil" => (isset($_POST['userName'])) ? $_POST['userName'] : " ",
          "tipo_documento" => (isset($_POST['typeDoc'])) ? $_POST['typeDoc'] : " ",
          "documento" => (isset($_POST['nDoc'])) ? $_POST['nDoc'] : " ",
          "p_nombre" => (isset($_POST['p_nombre'])) ? $_POST['p_nombre'] : " ",
          "s_nombre" => (isset($_POST['s_nombre'])) ? $_POST['s_nombre'] : " ",
          "p_apellido" => (isset($_POST['p_apellido'])) ? $_POST['p_apellido'] : " ",
          "s_apellido" => (isset($_POST['s_apellido'])) ? $_POST['s_apellido'] : " ",
          "edad" => (isset($_POST['edad'])) ? $_POST['edad'] : " ",
          "sexo" => (isset($_POST['sexo'])) ? $_POST['sexo'] : " ",
          "telefono" => (isset($_POST['telefono'])) ? $_POST['telefono'] : " ",
          "correo" => (isset($_POST['email'])) ? $_POST['email'] : " ",
          "id_rol" => (isset($_POST['id_rol'])) ? $_POST['id_rol'] : " "
        );

        modificarDatosUsuario($datos, $conx, $userM);
      }
      ?>

    </article>
  </main>

  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
  <script src="../js/menu.js"></script>
  
  <script>
    const inputs = { 
      "userName" : document.getElementById('userName'),
      "tipo_Documento" : document.getElementById('typeDoc'),
      "documento" : document.getElementById('nDoc'),
      "p_nombre" : document.getElementById('p_nombre'),
      "s_nombre" : document.getElementById('s_nombre'),
      "p_apellido" : document.getElementById('p_apellido'),
      "s_apellido" : document.getElementById('s_apellido'),
      "edad" : document.getElementById('edad'),
      "sexo" : document.getElementById('sexo'),
      "telefono" : document.getElementById('telefono'),
      "email" : document.getElementById('email'),
      "id_rol" : document.getElementById('id_rol'),
      "mensaje_error" : document.getElementById('mensaje-error')
    }


  </script>
    <?php
      $sql = "SELECT * FROM usuario u INNER JOIN  datos_adicionales da
      ON u.id_datos_adicionales = da.id_datos_adicionales AND u.nombre_perfil = '$userM'";

      if ($resultado = $conx -> query($sql)) {

        if(!$rlt = $resultado -> fetch_array()){
          echo "Ha ocurrido un error, no aparecen registros del usuario";
          echo "<script> userName.value = '$userM'; </script>";
        }else{
          echo "
          <script> 
            inputs.userName.value = '$rlt[nombre_perfil]'; 
            inputs.tipo_Documento.value = '$rlt[tipo_documento]';
            inputs.documento.value = '$rlt[documento]';
            inputs.p_nombre.value = '$rlt[p_nombre]'; 
            inputs.s_nombre.value = '$rlt[s_nombre]'; 
            inputs.p_apellido.value = '$rlt[p_apellido]'; 
            inputs.s_apellido.value = '$rlt[s_apellido]'; 
            inputs.edad.value = '$rlt[edad]'; 
            inputs.sexo.value = '$rlt[sexo]'; 
            inputs.telefono.value = '$rlt[Telefono]'; 
            inputs.email.value = '$rlt[correo]'; 
            inputs.id_rol.value = '$rlt[id_rol]';
          </script>";
        }
      }else{
        echo "Error de ejecución: " . mysqli_errno($conx);
        echo "<script> userName.value = '$userM'; </script>";
      }

      

    ?>
</body>

</html>