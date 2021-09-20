<?php 

    include('conexion.php');

    $user = $_POST['userName'];
    $email = $_POST['email'];
    $pass = $_POST['password'];

    #VALIDAR DOCENTE
    if (isset($_POST['ingresar'])) {
        $query = mysqli_query($conx, "SELECT * FROM usuario, datos_adicionales
        WHERE nombre_perfil = '$user' AND id_rol = 'D' AND contraseña = '$pass' AND correo = '$email'");
        $nr = mysqli_num_rows($query);

        if ($nr == 1) {
            echo "<script> alert('Bienvenido a la plataforma SIGC $user'); window.location= '../html/docente-dc.php'</script>";        
        }
        else{
            echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
        }
        
    }  
    
    #VALIDAR ESTUDIANTE
    if (isset($_POST['enviar'])) {
        $query = mysqli_query($conx, "SELECT * FROM usuario, datos_adicionales 
        WHERE nombre_perfil = '$user' AND id_rol = 'E' AND contraseña = '$pass' AND correo = '$email'");
        $nr = mysqli_num_rows($query);

        if ($nr == 1) {
            echo "<script> alert('Bienvenido a la plataforma SIGC $user'); window.location= '../html/estudiante-as.html'</script>";        
        }
        else{
            echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
        }
    
    }  
    
    #VALIDAR ADMINISTRADOR
    if (isset($_POST['entrar'])) {
        $code = $_POST['codigo'];

        $query = mysqli_query($conx, "SELECT * FROM usuario u, administrador a, datos_adicionales ad
        WHERE nombre_perfil = '$user' AND id_rol = 'A' AND contraseña = '$pass' AND codigo = '$code' AND correo = '$email'");
        $nr = mysqli_num_rows($query);

        if ($nr == 1) {
            echo "<script> alert('Bienvenido a la plataforma SIGC $user'); window.location= '../html/administrador-ad.html'</script>";        
        }
        else{
            echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
        }
    
    }  


    
    // function detectarUsuario($conx, $user){
        
    //     $usuario = $user;
    //     $buscarNombre = mysqli_query($conx, "SELECT p_nombre, s_nombre, p_apellido, s_apellido 
    //     FROM usuario WHERE nombre_perfil = '$usuario' ");
    //     $resultado = mysqli_query_($conx, $buscarNombre);

    //     while ($fila = mysqli_fetch_array($resultado)) {
    //         echo "<p>" . $fila['userName'] . "</p>";
    //         # echo $buscarNombre'userName';
    //     }


    //     mysqli_close($conx,$user);
    // }
    

?>