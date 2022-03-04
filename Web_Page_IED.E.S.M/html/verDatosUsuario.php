<?php include('../PHP/conexion.php'); 
    include "../PHP/datos.php";
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
    <title>Modificar</title>
</head>
<body>

<?php include "./header.php" ?>  

<main> 
    <table>
        <thead>
            <tr>
                <td>id_usuario</td>
                <td>id_datos_adicionales</td>
                <td>nombre_perfil</td>
                <td>id_rol</td>
                <td>Primer_Nombre</td>
                <td>Segundo_Nombre</td>
                <td>Primer_Apellido</td>
                <td>Segundo_Apellido</td>
                <td>Edad</td>
                <td>Correo</td>
                <td>Teléfono</td>
                <td>Sexo</td>
                <td>Acción</td>
                <td>Deshabilitar</td>
            </tr>
        </thead>
        <tbody>
            <?php mostrarDatosUsuario($conx); ?>
        </tbody>
    </table>
</main>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
<script src="../js/menu.js"></script>

</body>
</html>