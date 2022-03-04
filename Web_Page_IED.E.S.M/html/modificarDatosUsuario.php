<?php include('../PHP/datos.php');
    include "../PHP/actualizar.php";

    session_start();
    $usuario = $_SESSION["usuario"];

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
    <link rel="stylesheet" href="../css/login.css">
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

          <form action="../PHP/login_registro.php" method="POST" class="form-login">
            <label for="userName" class="short short-1">
              <span>Nombre de Usuario</span>
              <input
                type="text"
                name="userName"
                id="userName"
                placeholder="UserName"
                autocomplete="name"
                required
              />
            </label>
            <label for="email" class="short short-2">
              <span>Correo Electronico</span>
              <input
                type="email"
                name="email"
                placeholder="user@email.com"
                id="email"
                autocomplete="email"
                required
              />
            </label>
            <label for="password">
              <span>Contraseña</span>
              <input 
                type="password" 
                name="password" placeholder="password" id="password" required />
            </label>

            <div class="acciones">
                <input type="submit" class="boton_envio" name="form_docente" id="entrar" value="Ingresar"/>
            </div>

          </form>
            
          
        </article>
</main>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
<script src="../js/menu.js"></script>
</body>
</html>