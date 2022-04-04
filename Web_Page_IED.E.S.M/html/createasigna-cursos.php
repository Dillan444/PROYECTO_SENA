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
    <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/createasig-curso.css">
    
    <title>Administrador</title>
</head>
<body>

    <?PHP include "./header.php" ?>
    <a href="./<?php echo $rol[0];?>-index.php">
            <button id="back"> <img src="../IMG/icons/arrow-left-solid.svg" alt="Regresar"> <span>Regresar</span></button>
    </a>

    <div class="container-data">

        <section class="loko">
            <div class="title">
                <h2>Materias de la Institución</h2>
            </div>

            <ul class="container-materias">
                <?php mostrarDatos($conx, 'id_asignatura', 'nombre_asignatura', 'asignatura');?>
            </ul>
    
            <form action="" method="POST" >
    
                <label for="materia">
                    <span class="lolo">Asignatura</span>
                    <input type="text" name="materia" id="materia">
                </label>
                <div class="boton">
                <input type="submit" name="accionElemento" id="crear" value="Crear materia">
                <input type="submit" name="accionElemento" value="Renombrar materia">
                </div>
            </form>
            
        </section>
    
        <section class="loko">
            <div class="title">
                <h2>Cursos de la Institución</h2>
            </div>

            <ul>
              <?php mostrarDatos($conx, 'id_curso', 'curso', 'curso'); ?>
            </ul>
    
            <form action="" method="POST">
                <label for="curso">
                    <span class="lolo">Curso</span>
                    <input type="number" max="1111" name="curso" id="curso" value="<?php echo (isset($_POST['id_dato']))?$_POST['id_dato']:"" ;?>">
                </label>
                <div class="boton">
                <input type="submit" value="Crear curso" id="crearcurso" name="accionElemento">
                <input type="submit" name="accionElemento" value="Renombrar Curso">
                </div>
            </form>
            
        </section>
        
    </div>

    <?php
    if(isset($_POST['accionElemento'])){

        switch ($_POST['accionElemento']) {
            case 'Crear materia':
                $materia = $_POST['materia'];
        
                if (!buscarSiExisteDato($conx, $materia, 'asignatura', 'nombre_asignatura')) {
                    echo cargarNuevoDato($materia,$conx, 'asignatura', 'nombre_asignatura');
                }else{
                    echo "Materia ya exite en la base de datos";
                } break;

            case 'Crear curso':
                $curso = $_POST['curso'];

                if(buscarSiExisteDato($conx, $curso, 'curso', 'curso')){
                    echo cargarNuevoDato($curso, $conx, 'curso', 'curso');
                    echo "<script>window.location = 'createasigna-cursos.php'</script>";
                }else{
                    echo "Curso ya existe";
                } break;
            
            default: echo "Error"; break;
        }
        
    }
    ?>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>
</html>