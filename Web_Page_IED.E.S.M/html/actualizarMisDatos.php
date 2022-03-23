<?php 
    include('../PHP/conexion.php');
    include('../PHP/actualizar.php');
    include('../PHP/datos.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    $rol = $_GET['r'];

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }

    $sqlDatos = "SELECT * 
      FROM usuario u INNER JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales AND u.nombre_perfil = '$usuario'";

    $datos = $conx -> query($sqlDatos) -> fetch_array();

    #CONSUTA DE LOS nompre_perfil YA EXISTENTES
    $sqlUsers = $conx -> query("SELECT u.nombre_perfil
     FROM usuario u LEFT JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales WHERE u.nombre_perfil NOT LIKE '$usuario'");

    echo "<script> 
      const usuarios = [];
    </script>";
    
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/actualizarMisDatos.css">
    <link rel="stylesheet" href="../css/botones.css">
    <title>Actualiza tus datos</title>
</head>
<body>
    <a href="./<?php echo $rol;?>-index.php">
        <button id="back">Regresar</button>
    </a>
    <section class="perfil-info">
        <h1>Actualiza tus datos</h1>
        <span><?= buscarNombreUsuario($usuario, $conx, $datos['id_rol']);?></span>
    </section>
    <main class="content">
        <section class="perfil">
    
            <img src="../IMG/<?php echo ($datos['sexo'] === "F")?"userWoman":"userMan";?>.png" alt="imagen de perfil del usuario" class="perfil-imagen">
            <span class="perfil-rol"><?php
                switch ($datos['id_rol']) {
                    case 'E': echo "Estudiante"; break;
                    case 'D': echo "Docente"; break;
                    case 'A': echo "Administrador"; break;
    
                    default: echo "Rol desconocido"; break;
                }
            ?></span>
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
                  <input type="text" disabled value="99999999" id="documento" name="documento">
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
            </div>
          </form>
    
          <?php
            if(isset($_POST['accion'])){
                $datos['nombre_perfil'] = $_POST['userName'];
                $datos['correo'] = $_POST['email'];
                $datos['Telefono'] = $_POST['telefono'];
               
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