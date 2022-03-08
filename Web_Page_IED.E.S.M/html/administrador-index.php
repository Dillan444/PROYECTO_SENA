<?php include('../PHP/datos.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    $rol = array('Administrador');

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/cuerpo-admi.css">
    <title>Administrador</title>
</head>
<body>

    <?PHP include "./header.php" ?>

    <main class="cuerpo-admi">
        <nav>
            <ul>
                <?php echo "<a href=\"../html/create-users.php?user=$usuario&rol=$rol[0]\"><li><strong>Crea Cuentas</strong></li></a>"; ?>
                <a href="./verDatosUsuario.php">
                    <li><strong>Modificas</strong></li>
                </a>
                
                <a href="#">
                    <li><strong>Habilita el Sistema </strong></li>
                </a>
            </ul>
        </nav>
    </main>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>