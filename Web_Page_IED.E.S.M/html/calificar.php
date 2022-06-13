<?php include('../PHP/conexion.php'); 
    include "../PHP/datos.php";
    include "../PHP/actualizar.php";

    session_start();

    $usuario = $_SESSION["usuario"];
    $materia = $_POST['materia'];
    $curso = $_POST['curso'];

    $rol = array('Docente');
    if (!isset($usuario)) {
        header("Location: ./login.html");
    }

    
    if (isset($_POST['accion'])) {
        $datos = array(
            'nota1' => $_POST['nota1'],
            'nota2' => $_POST['nota2'],
            'nota3' => $_POST['nota3'],
            'nota4' => $_POST['nota4'],
            'estudiante' => $_POST['estudiante'],
            'materia'=> $_POST['materia']
        );
        
        asignarCalificacionesEstudiantes($conx, $datos);
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
    <link rel="stylesheet" href="../css/botones.css">
    <title>Docente</title>
</head>
<body>

    <?php include "./header.php" ?>

    <main>
        <center>
        <?php 
            $sql = "SELECT nombre_asignatura FROM asignatura WHERE id_asignatura = $materia";
            $sql = $conx -> query($sql) -> fetch_array();
            echo "<h2> $sql[nombre_asignatura] / $curso</h2>"?>
        <form action="" method="POST">
            <table>
                <thead>
                    <tr>
                      <th>Indice</th>
                      <th>Nombres</th>
                      <th>Apellidos</th>          
                      <th>Periodo N°1</th> 
                      <th>Periodo N°2</th> 
                      <th>Periodo N°3</th> 
                      <th>Periodo N°4</th> 
                      <th>Acción</th>
                    </tr>               
                </thead>
                <tbody>
                    <?=cargarListadoEstudiantilDocente($conx, $materia, $usuario, $curso);?>
                </tbody>
            </table>

            <!-- <button type="submit" name="guardarNotas">GuardarNotas</button> -->
            <a href="./docente-index.php"><button type="button" name="Regresar" class="boton">Regresar</button></a>
        </form>

        </center>
    </main>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>

</html>