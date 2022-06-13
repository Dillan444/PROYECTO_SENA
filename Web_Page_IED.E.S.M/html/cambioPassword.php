<?php 
    include('../PHP/conexion.php');
    include('../PHP/actualizar.php');
    include('../PHP/datos.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    $sqlDatos = "SELECT * 
      FROM usuario u INNER JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales AND u.nombre_perfil = '$usuario'";

    $datos = $conx -> query($sqlDatos) -> fetch_array();

    $rol = detectarRolUsuario($datos['id_rol']);

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
    <link rel="stylesheet" href="../css/changePasswordForm.css">
    <!-- <link rel="stylesheet" href="../css/form.css"> -->
    <title>Cambio de contraseña</title>
</head>

<body>

    <form action="" method="POST" class="pass-form">

        <div class="form-label">
            <h1>Cambio de Contraseña</h1>
            <!--  -->
            <label for="lastPassword">
                <span>Antigua contraseña</span>
                <input type="password" name="lastPassword" id="lastPassword" placeholder="Antigua Contraseña" required>
            </label>
            
            <!--  -->
            <label for="newPassword">
                <span>Nueva contraseña</span>
                <input type="password" name="newPassword" id="newPassword" placeholder="Nueva Contraseña" required>
            </label>
            
            <!--  -->
            <label for="confirmPassword">
                <span>Confirma contraseña</span>
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirmar Contraseña" required>
            </label>

            <p id="mensaje-pass"></p>
            
            <div class="botones">
                <input type="submit" name="enviar" value="Enviar">
                <?php 
                    echo "<a href=\"./$rol[rol]-index.php\"><input type=\"button\" name=\"cancelar\" value=\"Regresar\"></a>";            
                ?>
            </div>
        </div>

    </form>

    <script>
        let mensaje = document.getElementById("mensaje-pass");
    </script>
    
    <?php
        if (isset($_POST['enviar'])) {
            // almacenamiento de datos de para el cambio de cantraseña
            $lastpw = $_POST['lastPassword'];
            $newpw = $_POST['newPassword'];
            $confpw = $_POST['confirmPassword'];
            
            cambioContraseña($lastpw, $newpw, $confpw, $usuario, $conx);
        }
    ?>

</body>

</html>