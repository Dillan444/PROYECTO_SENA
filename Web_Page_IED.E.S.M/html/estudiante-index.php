<?php include('../PHP/datos.php'); 
    
    session_start();

    $usuario = $_SESSION["usuario"];

    $rol = array('estudiante', 'n_matricula');

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
    <link rel="stylesheet" href="../css/cabecera.css">
    <link rel="stylesheet" href="../css/cuerpo-admi.css">
    <link rel="stylesheet" href="../css/table.css">
    <title>Estudiante</title>
</head>
<body>
    <header style="background: linear-gradient(to right, red, white, red);">

        <div>
            <h2>SIGC</h2>
            <h3>Estudiante</h3>
        </div>


        <div id="menu">
            
            <ul>

                <li>
                    <h3> <?php buscarNombreUsuario($usuario, $conx, $rol[0]);?> </h3>                     
                </li>
                
                <li id="item">
                    <div id="icon_perfil">
                        <i class="fas fa-user"></i>
                    </div>

                    <ul id="despliegue" class="despliegue">
                        <div class="opciones_mi-perfil">
                            <div class="perfil">
                                <div><img src="" alt=""></div>
                                <span><?php echo $usuario; ?></span>
                            </div>
                            <hr>
                            <nav class="opciones">
                                <li><a href="./create-users.php">Actualizar mis datos</a> </li>
                                <li><?php  echo "<a href=\"./cambioPassword.php?user=$usuario&rol=$rol[0]\">Cambiar Contraseña</a>"; ?></li>
                                <li><a href="#">Configuración</a> </li>
                                <li><a href="../PHP/cerrarSesion.php">Cerrar Sesión</a> </li>
                            </nav>
                                
                        </div>
                        
                    </ul>
                </li>

        </ul>
        </div>
    </header>

    <main>
        <center>
        <table border="7">
                <thead>
                    <th>Indice    </th>
                    <th>Asignatura</th>
                    <th>Bimestre 1</th>
                    <th>Bimestre 2</th>
                    <th>Bimestre 3</th>
                    <th>Bimestre 4</th>
                    <!-- <th>Registros</th> -->
                </thead>
                <tbody>
                    <?php cargarMisNotas($conx, $usuario);?>
                </tbody>
            </table>
        </center>
    </main>
</body>
</html>