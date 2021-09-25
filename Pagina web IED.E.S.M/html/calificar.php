<?php 
    include('../PHP/datos.php');
    $materia = $_GET['materia'];
    $user = $_GET['user'];
    $curso = $_GET['curso'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/cabecera.css">
    <title>Docente</title>
</head>
<body>
    <header>

        <div>
            <h2>SIGC</h2>
            <h3>Docente</h3>
        </div>


        <div id="menu">
        <ul>
            <li>
                <h3> <?php buscarNombreUsuario($user, $conx);?> </h3>                     
            </li>

            <li id="item">
                <div id="icon_perfil">
                    <i class="fas fa-user"></i>
                </div>

            <ul id="despliegue" class="despliegue">
                <div class="opciones_mi-perfil">
                    <div class="perfil">
                        <div><img src="" alt=""></div>
                        <span>Mi nombre</span>
                    </div>
                    <hr>
                    <nav class="opciones">
                        <li><a href="#">Actualizar mis datos</a> </li>
                        <li><?php  echo "<a href=\"./cambioPassword.php?user=$user\">Cambiar Contraseña</a>"; ?></li>
                        <li><a href="#">Configuración</a> </li>
                        <li><a href="../index.html">Cerrar Sesión</a> </li>
                    </nav>
                        
                </div>
                
            </ul>
            </li>
        </ul>
        </div>
    </header>

    <main>
        <center>
        <?php echo "<h2> $materia / $curso</h2>"?>
        <form action="" method="POST">
            <table border="7">
                <thead>
                    <th>Indice</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>          
                    <th>3ro Periodo</th>                
                </thead>
                <tbody>
                    <?=cargarLista($conx, $materia, $user, $curso);?>
                </tbody>
            </table>

            <button name="guardarNotas">GuardarNotas</button>
        </form>

        <?php 
            if (isset($_POST['guardarNotas'])) {
                
                
            }
        ?>

        </center>
    </main>
</body>

</html>