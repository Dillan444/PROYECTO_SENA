<?php include('../PHP/datos.php'); 
    session_start();

    $usuario = $_SESSION["usuario"];

    $rol = array('Docente');

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
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/botones.css">
    <title>Docente</title>
</head>
<body>

    <?PHP include "./header.php" ?> 

    <main>
        <center>
        <table>
            <thead>
                <tr>
                  <th>N_Curso</th>
                  <th>GradoGrado</th>
                  <th>Materia</th>
                  <th colspan="2">Acción</th>
                </tr>
            </thead>
            <tbody>
                <?php cargarTabla($conx, $usuario);?>
            </tbody>
            </table>
        </center>
    </main>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>