<?php
    include('../PHP/datos.php'); 
    session_start();

    $usuario = $_SESSION["usuario"];
    $rol = array('Docente');
    $materia = $_GET['m'];
    $curso = $_GET['c'];

    if(!isset($usuario)){
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
    <title>Registro de Calificaciones</title>
</head>
<body>
    
    <?php include "./header.php"; ?>

    <seccion>
    <center>
        <?php 
            $sql = "SELECT nombre_asignatura FROM asignatura WHERE id_asignatura = $materia";
            $sql = $conx -> query($sql) -> fetch_array();
            echo "<h2> $sql[nombre_asignatura] / $curso</h2>"?>
        <table>
            <thead>
                <tr>
                    <th>Indice</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>          
                    <th>P1</th> 
                    <th>P2</th> 
                    <th>P3</th> 
                    <th>P4</th>
                    <th>Promedio</th> 
                </tr>
            </thead>
            <tbody>
                <?= mostrarCalificacionesMisEstudiantes($conx, $materia, $usuario, $curso) ?>
            </tbody>
        </table>
        <a href="./docente-index.php"><button>Regresar</button></a>
    </center>
    </seccion>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>