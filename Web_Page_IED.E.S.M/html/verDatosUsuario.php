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
    <link rel="stylesheet" href="../css/botones.css">
    <title>Modificar</title>
</head>
<body>

<?php include "./header.php" ?>  

<main> 
    <table>
        <thead>
            <tr>
                <th>id_usuario</th>
                <th>Documento</th>
                <th>Nombre de perfil</th>
                <th>Rol</th>
                <th>Primer nombre</th>
                <th>Segundo nombre</th>
                <th>Primer apellido</th>
                <th>Segundo apellido</th>
                <th>Edad</th>
                <th>Correo Electronico</th>
                <th>Teléfono</th>
                <th>Sexo</th>
                <th colspan="2" >Acción</th>
                
            </tr>
        </thead>
        <tbody>
            <?php mostrarDatosUsuario($conx, $usuario); ?>
        </tbody>
    </table>
</main>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
<script src="../js/menu.js"></script>

</body>
</html>