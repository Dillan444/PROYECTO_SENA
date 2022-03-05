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
  <link rel="stylesheet" href="../css/generalStyles.css">
  <link rel="stylesheet" href="../css/menu.css">
  <link rel="stylesheet" href="../css/table.css">
  <link rel="stylesheet" href="../css/formMDU.css">
  <title>Modificar Datos de Usurio</title>
</head>

<body>

  <?php include "./header.php" ?>

  <main>
    <article id="tab1" class="articulo-login">
      <div class="login-titulo">
        <h3>Actualiza Datos</h3>
        <!-- <i class="fas fa-chalkboard-teacher"></i> -->
      </div>

      <form action="" method="POST" class="form-login">


        <label for="userName" class="short short-1">
          <span>Nombre de Usuario</span>
          <input type="text" name="userName" id="userName" placeholder="UserName" value="" autocomplete="name" required />
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
          <input type="email" name="email" placeholder="user@email.com" id="email" autocomplete="email" required />
        </label>
        <label for="id_rol">
          <span>Rol</span>
          <select name="id_rol" id="id_rol">
            <option value="E">Estudiante</option>
            <option value="D">Docente</option>
          </select>
        </label>

        <div class="acciones">
          <input type="submit" class="boton_envio" name="form_update" id="update" value="Actualizar" />
        </div>

      </form>

      <?php

      if (isset($_POST['form_update'])) {
        $datos = array(
          "userName" => $_POST['userName'],
          "p_nombre" => $_POST['p_nombre'],
          "s_nombre" => $_POST['s_nombre'],
          "p_apellido" => $_POST['p_apellido'],
          "s_apellido" => $_POST['s_apellido'],
          "edad" => $_POST['edad'],
          "sexo" => $_POST['sexo'],
          "telefono" => $_POST['telefono'],
          "email" => $_POST['email'],
          "id_rol" => $_POST['id_rol']
        );

        modificarDatosUsuario($datos, $conx, $userM);
      }
      ?>

    </article>
  </main>

  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
  <script src="../js/menu.js"></script>
  
  <script>
    let userName = document.getElementById('userName'); 
    let p_nombre = document.getElementById('p_nombre'); 
    let s_nombre = document.getElementById('s_nombre'); 
    let p_apellido = document.getElementById('p_apellido'); 
    let s_apellido = document.getElementById('s_apellido'); 
    let edad = document.getElementById('edad'); 
    let sexo = document.getElementById('sexo'); 
    let telefono = document.getElementById('telefono'); 
    let email = document.getElementById('email'); 
    let id_rol = document.getElementById('id_rol'); 


  </script>
    <?php
      $sql = "SELECT * FROM usuario u INNER JOIN  datos_adicionales da
      ON u.id_datos_adicionales = da.id_datos_adicionales AND u.nombre_perfil = '$userM'";

      if ($resultado = $conx -> query($sql)) {

        $resultado = $resultado -> fetch_array();

        echo "
        <script> 
          userName.value = '$resultado[nombre_perfil]'; 
          p_nombre.value = '$resultado[p_nombre]'; 
          s_nombre.value = '$resultado[s_nombre]'; 
          p_apellido.value = '$resultado[p_apellido]'; 
          s_apellido.value = '$resultado[s_apellido]'; 
          edad.value = '$resultado[edad]'; 
          sexo.value = '$resultado[sexo]'; 
          telefono.value = '$resultado[Telefono]'; 
          email.value = '$resultado[correo]'; 
          id_rol.value = '$resultado[id_rol]'; 
        </script>";
      }else{
        echo "<script> userName.value = '$userM'; </script>";
      }

      

    ?>
</body>

</html>