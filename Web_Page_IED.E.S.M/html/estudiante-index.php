<?php include('../PHP/datos.php'); 
    
    session_start();

    $usuario = $_SESSION["usuario"];

    $rol = array('Estudiante', 'n_matricula');

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
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/table.css">
    <title>Estudiante</title>
</head>
<body>

    <?PHP include "./header.php" ?>

    <main>
        <center>
        <table border="7">
                <thead>
                    <th>Asignatura</th>
                    <th>Bimestre 1</th>
                    <th>Bimestre 2</th>
                    <th>Bimestre 3</th>
                    <th>Bimestre 4</th>
                    <th>Promedio</th>
                </thead>
                <tbody>
                    <?php cargarMisNotas($conx, $usuario);?>
                </tbody>
            </table>
            <a href="./generarPDF.php" target="black"><button>Generar Boletin</button></a>
        </center>
    </main>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>