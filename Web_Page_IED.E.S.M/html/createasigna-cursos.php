<?php include('../PHP/datos.php');
    include('../PHP/create.php');
    session_start();
    $usuario = $_SESSION["usuario"];

    $rol = array('Administrador');

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }
?>

<!DOCTYPE html>  
<html lang="en"></html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/createasig-curso.css">
    
    <title>Administrador</title>
</head>
<body>

    <?PHP include "./header.php" ?>

    <div class="container-data">

        <section class="loko">
            

            <ul class="container-materias">
                <?php mostrarDatos($conx, 'nombre_asignatura', 'asignatura');?>
            </ul>
    
            <form action="" method="POST" >
    
                <label for="materia">
                    <span class="lolo">Escribir nombre de la Asignatura</span>
                    <input type="text" name="materia" id="materia">
                </label>
                <div class="boton">
                <input type="submit" name="crear" id="crear" value="Crear materia">
                </div>
            </form>
            
        
        </section>
    
        <section class="loko">
            <ul>
              <?php mostrarDatos($conx, 'curso', 'curso'); ?>
            </ul>
    
            <form action="" method="POST">
                <label for="curso">
                    <span class="lolo">Escribir curso </span>
                    <input type="text" name="curso" id="curso">
                </label>
                <div class="boton">
                <input type="submit" value="Crear curso" id="crearcurso" name="crear">
                </div>
            </form>
            
        </section>
        
    </div>

    <?php
    if(isset($_POST['crear'])){

        switch ($_POST['crear']) {
            case 'Crear materia':
                $materia = $_POST['materia'];
        
                if (buscarSiExisteDato($conx, $materia, 'asignatura', 'nombre_asignatura')) {
                    echo cargarNuevoDato($materia,$conx, 'asignatura', 'nombre_asignatura');
                }else{
                    echo "Materia ya exite en la base de datos";
                } break;

            case 'Crear curso':
                $curso = $_POST['curso'];

                if(buscarSiExisteDato($conx, $curso, 'curso', 'curso')){
                    echo cargarNuevoDato($curso, $conx, 'curso', 'curso');
                }else{
                    echo "Curso ya existe";
                } break;
            
            default: echo "Error"; break;
        }
        echo "<script>window.location = 'createasigna-cursos.php'</script>";
    }
    ?>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>