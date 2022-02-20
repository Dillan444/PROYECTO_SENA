<?php 
    include('../PHP/conexion.php');
    include('../PHP/create.php');
    include('../PHP/datos.php');

    session_start();
    $usuario = $_SESSION["usuario"];
    $rol = array('Administrador');

    if (!isset($_SESSION["usuario"])) {
        header("Location: login.html");
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
    <link rel="stylesheet" href="../css/form-create.css">
    <title>Creación de perfiles</title>
</head>

<body>

    <?PHP include "./header.php" ?>

    <main class="contnedor-in">
        
        <center><h2>Crear cuenta</h2>
                
        <form action="" method="POST" class="formulario-in"> 
       
            <div class="inputs">

            <fieldset>
                
                <legend>Datos Personales</legend>
                <label for="P_nombre" class="text-in">
                    <span>Primer nombre:</span><br>
                    <input type="text" name="P_nombre" id="P_nombre" placeholder="P nombre" required> 
                </label>
                
                <label for="S_nombre" class="text-in">
                    <span>Segundo nombre:</span><br>
                    <input type="text" name="S_nombre" id="S_nombre" placeholder="S nombre"> 
                </label>
                <label for="P_apellido" class="text-in">
                    <span>Primer apellido:</span><br>
                    <input type="text" name="P_apellido" id="P_apellido" placeholder="P apeliido" required>  
                </label>
                <label for="S_apellido" class="text-in">
                    <span>Segundo Apellido:</span><br>
                    <input type="text" name="S_apellido" id="S_apellido" placeholder="S apellido"> 
                </label>
                
                <label for="edad" class="text-in">
                    <span>Edad:</span><br>
                    <input type="number" name="Edad" id=" edad" placeholder="edad" required> 
                </label>

                <label for="Genero">
                    <span>Sexo:</span>
                    <span>M</span> <input type="radio" name="Sexo" id="sexo" value="M"> 
                    <span>F</span> <input type="radio" name="Sexo" id="sexo" value="F"> 
                </label>

            </fieldset>

            <fieldset> <legend>Datos Contacto</legend>
            
                <label for="telefono" class="text-in">
                    <span>Número de Telefono:</span> <br>
                    <input type="text" name="telefono" id="telefono" placeholder="telefono"> 
                </label>
                <label for="Correo" class="text-in">
                    <span>Correo electronico:</span><br>
                    <input type="email" name="Correo" id="Correo" placeholder="usuario@example.com" required> 
                </label>
                
                <label for="rol">
                    <span>Rol:</span>
                    <select name="rol" id="rol">
                        <option value="D">Docente</option>
                        <option value="E">Estudiante</option>
                    </select>
                </label>
                
            </fieldset>
            </div>
            
           <center>
               <button type="submit" name="crear" id="boton">Crear</button> 
               <a href="../html/administrador-index.php"><button type="button" name="Regresar" id="boton">Regresar</button> </a>
            </center>

                
                
            </form>
        </center>

        <?php

        if (isset($_POST['crear'])){
            // Datos de la tabla usuario
            $rol_in = $_POST['rol'];
            $fst_name = $_POST['P_nombre'];
            $scd_name = $_POST['S_nombre'];
            $fst_lastName = $_POST['P_apellido'];
            $scd_lastName = $_POST['S_apellido'];
            $age = $_POST['Edad'];

            // Datos de la tabla Datos Adicionales
            $number = $_POST['telefono'];
            $email = $_POST['Correo'];
            $sex = $_POST['Sexo'];
            
            crearUsuarios($conx, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $number, $email, $sex, $user, $rol);
        }
        
        ?>


    </main>

    <footer class="pie_pagina">
        <div id="info">
            <h6>
                Sistema de Informacion para Gestión  de Calificaciones<br>
                cc 1003558362<br>
                cc 1001116817<br>
                Correos administradores fsrojas26misena.edu.co / dsportocarrero@misena.edu.co <br>
                Colegio: Enrrique Santos Montejo de Tenjo <br>
            </h6>
        </div>
        <nav class="redes">
                <ul> 
                    <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram-square"></i></a></li>
                </ul>
            </nav>
    </footer>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
</body>

</html>