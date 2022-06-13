<?php
    include('../PHP/datos.php'); 
    session_start();

    $usuario = $_SESSION["usuario"];
    $rol = array('Docente');
    $materia = $_POST['materia'];
    $curso = $_POST['curso'];

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
    <link rel="stylesheet" href="../css/botones.css">
    <title>Registro de Calificaciones</title>
    <style>
        #periodos-row{
            background-color: #1818a6;
        }

        .right{
            text-align: right;
        }
    </style>
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
                    <th rowspan="2">Indice</th>
                    <th rowspan="2">Nombres</th>
                    <th rowspan="2">Apellidos</th>
                    <th colspan="5">Periodo Academico</th>         
                    <tr id="periodos-row">   
                        <th rowspan="1">N°1</th> 
                        <th rowspan="1">N°2</th> 
                        <th rowspan="1">N°3</th> 
                        <th rowspan="1">N°4</th>
                        <th rowspan="1">Promedio</th>
                    </tr>
                </tr>
            </thead>
            <tbody>
                <?= mostrarCalificacionesMisEstudiantes($conx, $materia, $usuario, $curso) ?>
            </tbody>
        </table>
        <a href="./docente-index.php"><button class="boton">Regresar</button></a>
    </center>
    </seccion>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>