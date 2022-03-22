<?php 
    include('../PHP/conexion.php');
    include('../PHP/actualizar.php');

    session_start();
    $usuario = $_SESSION["usuario"];

    // $rol = $_GET['r'];

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }

    $sqlDatos = "SELECT * 
      FROM usuario u INNER JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales AND u.nombre_perfil = '$usuario'";

    $datos = $conx -> query($sqlDatos) -> fetch_array();

    #CONSUTA DE LOS nompre_perfil YA EXISTENTES
    $sqlUsers = $conx -> query("SELECT u.nombre_perfil
     FROM usuario u LEFT JOIN datos_adicionales da ON da.id_datos_adicionales = u.id_datos_adicionales AND u.nombre_perfil NOT LIKE '$usuario'");

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
    <title>Actualiza tus datos</title>
</head>
<body>
    <section>
        <h1>Actualiza tus datos</h1>
        <img src="../IMG/home.jpg" alt="imagen de perfil del usuario" width="280">
        <span>Estudiante / 601</span>
        <hr>
    </section>
    <section>
      <form action="#" method="POST">
          
          <label for="userName">
              <span>Nombre de Perfil</span>
              <input type="text" value="<?php echo $datos['nombre_perfil'];?>" id="userName" name="userName" required min = "4">
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

          <input type="submit" value="Actualizar" name="accion" id="actualizar" >
      </form>

      <?php
        if(isset($_POST['accion'])){
            $datos['nombre_perfil'] = $_POST['userName'];
            $datos['correo'] = $_POST['email'];
            $datos['Telefono'] = $_POST['telefono'];
           
            tablaDatosAdicionales($conx, $datos, $datos['id_datos_adicionales']);
            
            tablaUsuario($conx, $datos, $datos['id_datos_adicionales']);

            $_SESSION['usuario'] = $datos['nombre_perfil'];
                     
        }

      ?>
    </section>

    <script>
        // 
        const mensaje = document.getElementById('mensaje');
        const userName = document.getElementById('userName');
        const boton = document.getElementById('actualizar');
        userName.addEventListener("input", repetido);
        

        function repetido(){
            let coincide = false;
            usuarios.forEach(dato => {
                if (userName.value === dato){
                    coincide = true
                }
            });
            

            let string = userName.value;

            if (coincide) {
                mensaje.innerHTML = "Nombre ya existe";
                boton.disabled = true;
            }else{
                mensaje.innerHTML = "Aceptado";
                boton.disabled = false;
                
                if (string.length < 4) {
                    boton.disabled = true;
                    mensaje.innerHTML = "Demaciado corto";

                }
            }
        }

    </script>
</body>
</html>