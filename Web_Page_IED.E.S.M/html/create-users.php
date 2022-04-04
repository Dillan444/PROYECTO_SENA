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

    $mensajeEstado = (isset($_GET['mensaje']))?$_GET['mensaje']:false;

    if ($mensajeEstado) {

        $mensaje = ($mensajeEstado == 'y')?"Creado":"$mensajeEstado";
        echo "<script>alert('$mensaje');</script>"; 
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
    <!-- <link rel="stylesheet" href="../css/form-create.css"> -->
    <link rel="stylesheet" href="../css/form-creacion.css">
    <title>Creación de perfiles</title>
</head>

<body>

    <?PHP include "./header.php" ?>

    <section class="contenedor-form">
        <form action="" method="post" class="form-creacionUsuarios">
            <div class="creacionUsuarios-title">
                <h1>Crea cuentas de usuario</h1>
            </div>

            <div class="datosDeEntrada">

                <label for="tipo_documento" class="text-in">
                    <span>Tipo de documento</span>
                    <select name="tipo_documento" id="tipo_documento">
                        <option value="CC">Cedula de Ciudadania</option>
                        <option value="TI">Tarjeta de Identidad</option>
                        <option value="CE">Certificado de Extrangería</option>
                    </select>
                </label>
    
                <label for="documento">
                    <span>N° Documento</span>
                    <input type="number" name="documento" id="documento" placeholder="N° Identificación">
                </label>
    
                <label for="P_nombre" class="text-in">
                    <span>Primer nombre:</span>
                    <input type="text" name="P_nombre" id="P_nombre" placeholder="P nombre" required> 
                </label>
                
                <label for="S_nombre" class="text-in">
                    <span>Segundo nombre:</span>
                    <input type="text" name="S_nombre" id="S_nombre" placeholder="S nombre"> 
                </label>
    
                <label for="P_apellido" class="text-in">
                    <span>Primer apellido:</span>
                    <input type="text" name="P_apellido" id="P_apellido" placeholder="P apeliido" required>  
                </label>
    
                <label for="S_apellido" class="text-in">
                    <span>Segundo Apellido:</span>
                    <input type="text" name="S_apellido" id="S_apellido" placeholder="S apellido">  
                </label>
                
                <label for="edad" class="text-in">
                    <span>Edad:</span>
                    <input type="number" name="edad" id=" edad" placeholder="edad" required> 
                </label>
    
                <label for="Genero" class="genero">
                    <span>Sexo:</span>
                    <div><span>M</span> <input type="radio" name="sexo" id="sexo" value="M"> </div>
                    <div><span>F</span> <input type="radio" name="sexo" id="sexo" value="F"> </div>
                </label>
    
                <label for="telefono" class="text-in">
                    <span>Número de Telefono:</span> 
                    <input type="number" name="telefono" id="telefono" placeholder="telefono"> 
                </label>
                <label for="Correo" class="text-in">
                    <span>Correo electronico:</span>
                    <input type="email" name="correo" id="correo" placeholder="usuario@example.com" required> 
                </label>
                
                <label for="rol">
                    <span>Rol:</span>
                    <select name="rol_in" id="rol_in">
                        <option value="D">Docente</option>
                        <option value="E">Estudiante</option>
                    </select>
                </label>
    
                <label for="cursos" id="cursosG">
                    <span>Curso del Estudiante</span>
                    <select name="curso_E" id="cursos">
                        <option value="otro" selected>Ninguno</option>
                        <?php 
                            $sqlCursos = "SELECT curso FROM curso";
    
                            if($cursos = $conx -> query($sqlCursos)){
    
                                while ($curso = $cursos -> fetch_array()) {?>
                                  
                                 <option value="<?php echo $curso['curso'];?>">
                                    <?php echo $curso['curso'];?>
                                 </option>
    
                                <?php }
                            }
                        ?>
                    </select>
                </label>
                <label for="jornada" class="text-in" id="jornadaG">
                    <span>Jornada</span>
                    <select name="jornada" id="jornada">
                        <option value="D">Diurna</option>
                        <option value="N">Nocturna</option>
                        <option value="FDS">Fin de semana</option>
                    </select>
                </label>
            </div>

            <div class="botons-accion">
                <button type="submit" name="crear" id="boton">Crear</button> 
                <a href="../html/administrador-index.php">
                    <button type="button" name="Regresar" id="boton">Regresar</button> 
                </a>
 
            </div>
        </form>
    </section>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"> </script>
    <script src="../js/menu.js"></script>
    <script>
        const cursos = document.getElementById("cursosG");
        const jornada = document.getElementById("jornadaG");
        const rol = document.getElementById("rol_in");
        cursos.style.display = "none";
        jornada.style.display = "none";
        
        rol.addEventListener("input", () => {
            if(rol.value == "E"){
                cursos.style.display = "flex"; 
                jornada.style.display = "flex"; 
            }else{
                cursos.style.display = "none";
                jornada.style.display = "none";
            }
        });
    </script>
</body>

</html>