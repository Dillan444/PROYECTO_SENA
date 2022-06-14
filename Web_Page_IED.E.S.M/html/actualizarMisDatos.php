<?php 
    include('../PHP/conexion.php');
    include('../PHP/actualizar.php');
    include('../PHP/datos.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }

    $sqlDatos = "SELECT * 
      FROM usuario u INNER JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales AND u.nombre_perfil = '$usuario'";

    $datos = $conx -> query($sqlDatos) -> fetch_array();

    $rol = detectarRolUsuario($datos['id_rol']);    

    #CONSUTA DE LOS nompre_perfil YA EXISTENTES
    $sqlUsers = $conx -> query("SELECT u.nombre_perfil
     FROM usuario u LEFT JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales WHERE u.nombre_perfil NOT LIKE '$usuario'");

    echo "<script> 
      const usuarios = [];
    </script>";
    
    // Almacenando datos de la consulta sql en un arreglo de javaScript
    while ($user = $sqlUsers -> fetch_array()) {
        
        $users = $user['nombre_perfil'];
        echo "<script>
         usuarios.push('$users') ;
        </script>";
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/actualizarMisDatos.css">
    <link rel="stylesheet" href="../css/botones.css">
    <title>Actualiza tus datos</title>
</head>
<body>
    
    <section class="perfil-info">
        <h1>Actualiza tus datos</h1>
        <span><?= buscarNombreUsuario($usuario, $conx, $rol['rol']);?></span>
    </section>
    <main class="content">
        <a href="./<?php echo $rol['rol'];?>-index.php">
            <button id="back"> <img src="../IMG/icons/arrow-left-solid.svg" alt="Regresar"> <span>Regresar</span></button>
        </a>
        <section class="perfil">
    
            <img src="../IMG/<?php echo ($datos['sexo'] === "F")?"userWoman":"userMan";?>.png" alt="imagen de perfil del usuario" class="perfil-imagen">
            <span class="perfil-rol"><?php echo $rol['rol']; ?><?php echo $rol['icon']?></span>
        </section>
        <div class="line-gradient"></div>
        <section class="perfil-data">
          <form action="#" method="POST" class="form-update">
              
              <label for="userName">
                  <span>Nombre de Perfil</span>
                  <input type="text" value="<?php echo $datos['nombre_perfil'];?>" id="userName" name="userName" required min = "4" autocomplete="none">
                  <span id="mensaje"></span>
              </label><br>
              <label for="">
                  <span>Documento Identidad</span>
                  <input type="text" disabled value="<?php echo ($datos['documento'])?$datos['documento']:9999999; ?>" id="documento" name="documento">
              </label><br>
              <label for="">
                  <span>Nombres</span>
                  <input type="text" disabled value="<?php echo $datos['p_nombre'] . " " . $datos['s_nombre']; ?>" id="names" name="names">
              </label><br>
              <label for="lastName">
                  <span>Apellidos</span>
                  <input type="text" disabled value="<?php echo $datos['p_apellido'] . " " . $datos['s_apellido']; ?>" id="lastNames" name="lastNames">
              </label><br>
              <label for="">
                  <span>Edad</span>
                  <input type="number" disabled value="<?php echo $datos['edad']; ?>" id="edad" name="edad">
              </label><br>
              <label for="email">
                  <span>Correo Electronico</span>
                  <input type="email" value="<?php echo $datos['correo'];?>" id="email" name="email" required>
              </label><br>
              <label for="telefono">
                  <span>Telefono</span>
                  <input type="number" value="<?php echo $datos['Telefono'];?>" id="telefono" name="telefono">
              </label>
            <div class="perfil-data--actualizar">
                <input type="submit" value="Actualizar" name="accion" id="actualizar" >
                <button type="reset" id="reset" onclick="repetido()">
                    <svg viewBox="0 0 512 512"><path d="M496 48V192c0 17.69-14.31 32-32 32H320c-17.69 0-32-14.31-32-32s14.31-32 32-32h63.39c-29.97-39.7-77.25-63.78-127.6-63.78C167.7 96.22 96 167.9 96 256s71.69 159.8 159.8 159.8c34.88 0 68.03-11.03 95.88-31.94c14.22-10.53 34.22-7.75 44.81 6.375c10.59 14.16 7.75 34.22-6.375 44.81c-39.03 29.28-85.36 44.86-134.2 44.86C132.5 479.9 32 379.4 32 256s100.5-223.9 223.9-223.9c69.15 0 134 32.47 176.1 86.12V48c0-17.69 14.31-32 32-32S496 30.31 496 48z"/>
                    </svg>
                </button>
            </div>
          </form>
    
          <?php
            if(isset($_POST['accion'])){
                $datos['nombre_perfil'] = $_POST['userName'];
                $datos['correo'] = $_POST['email'];
                $datos['telefono'] = $_POST['telefono'];
               
                if ($error = tablaDatosAdicionales($conx, $datos, $datos['id_datos_adicionales']) !== true) {
                    echo "<span class = 'error'>" . mysqli_error($conx) ."</span>";
                    ?>
                    <script>
                    swal('Atención',  'Es posible que algunos de los datos a actualizar este duplicado', "warning");
                    </script>
                    <?php
                    
                }else{

                    tablaUsuario($conx, $datos, $datos['id_datos_adicionales']);
        
                    $_SESSION['usuario'] = $datos['nombre_perfil'];
                    
                    echo "<script>window.location = 'actualizarMisDatos.php'</script>";
                   
                }
  
            }
    
          ?>
        </section>

    </main>

    <script src="../js/validacionForm.js"></script>
</body>
</html>