<?php 
    include('../PHP/conexion.php');
    include('../PHP/actualizar.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    $rol = $_GET['r'];

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
    <link rel="stylesheet" href="../css/form.css">
    <title>Cambio de contraseña</title>
</head>

<body>
            
    <div class="contenedor">
        <h2>Cambio de Contraseña</h2>

        <form action="" method="POST">

            <!--  -->
            <label for="lastPassword">
                <input type="password" name="lastPassword" id="lastPassword" placeholder="Antigua Contraseña" required>
            </label>
            
            <p></p>
            <!--  -->
            <label for="newPassword">
                <input type="password" name="newPassword" id="newPassword" placeholder="Nueva Contraseña" required>
            </label>
            
            <p></p>
            <!--  -->
            <label for="confirmPassword">
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirmar Contraseña" required>
            </label>
            
            <p></p>
            <div class="botones">
            <input type="submit" name="enviar" value="Enviar">
            <?php 
            echo "<a href=\"./$rol-index.php\"><input type=\"button\" name=\"cancelar\" value=\"Regresar\"></a>";            
            ?>

        </div>
    </form>
    
    <?php
        if (isset($_POST['enviar'])) {
            // almacenamiento de datos de para el cambio de cantraseña
            $lastpw = $_POST['lastPassword'];
            $newpw = $_POST['newPassword'];
            $confpw = $_POST['confirmPassword'];
            
            cambioContraseña($lastpw, $newpw, $confpw, $usuario, $conx);
        }
    ?>


    </div>
</body>

</html>