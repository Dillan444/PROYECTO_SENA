<?php include('../PHP/datos.php'); 
    $usuario = rand(20, 22);
    // $usuario = 21;
    $rol = 'administrador';
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
    <title>Administrador</title>
</head>
<body>
    <header style="background: linear-gradient(to right, gray, white, gray);">

        <div>
            <h2>SIGC</h2>
            <h3>Administrador</h3>
        </div>


        <div id="menu">
            
            <ul>

                <li>
                    <h3> <?php buscarNombreUsuario($usuario, $conx, $rol);?> </h3>                     
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
                                <li><a href="./create-users.php">Actualizar mis datos</a> </li>
                                <li><?php  echo "<a href=\"./cambioPassword.php?user=$usuario&rol=$rol\">Cambiar Contraseña</a>"; ?></li>
                                <li><a href="#">Configuración</a> </li>
                                <li><a href="../index.html">Cerrar Sesión</a> </li>
                            </nav>
                                
                        </div>
                        
                    </ul>
                </li>

        </ul>
        </div>
    </header>
    
    <main class="cuerpo-admi">
        <nav>
            <ul>
               <?php echo "<a href=\"../html/create-users.php?user=$usuario&rol=$rol\"><li><strong>Crea Cuentas</strong></li></a>";?>
               <a href="#"><li><strong>Modificas</strong></li></a>
               <a href="#"><li><strong>Desabilitalas</strong></li></a>
               <a href="#"><li><strong>Habilita el Sistema </strong></li></a>
            </ul>
        </nav>
    </main>
</body> 
</html>