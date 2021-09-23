<?php

include('conexion.php');

$user = $_POST['userName'];
$email = $_POST['email'];
$pass = $_POST['password'];

function validar($user, $email, $pass, $rol, $conx)
{
    $query = mysqli_query($conx, "SELECT * FROM usuario, datos_adicionales
        WHERE nombre_perfil = '$user' AND id_rol = '$rol' AND contraseña = '$pass' AND correo = '$email'");
    $nr = mysqli_num_rows($query);

    if ($nr == 1) {
        echo "<script> alert('Bienvenido a la plataforma SIGC $user');

            if('$rol' == \"D\"){
                
                window.location= '../html/docente-index.php';

            }else if('$rol' == \"E\"){

                window.location= '../html/estudiante-as.html'   ;
            }

            </script>";

    } else {
        
        echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
    }
}

#VALIDAR DOCENTE
if (isset($_POST['ingresar'])) {
    $rol = 'D';
    validar($user, $email, $pass, $rol, $conx);
}

#VALIDAR ESTUDIANTE
if (isset($_POST['enviar'])) {
    $rol = 'E';
    validar($user, $email, $pass, $rol, $conx);
}

#VALIDAR ADMINISTRADOR
if (isset($_POST['entrar'])) {
    $code = $_POST['codigo'];

    $query = mysqli_query($conx, "SELECT * FROM usuario u, administrador a, datos_adicionales ad
        WHERE nombre_perfil = '$user' AND id_rol = 'A' AND contraseña = '$pass' AND codigo = '$code' AND correo = '$email'");
    $nr = mysqli_num_rows($query);

    if ($nr == 1) {
        echo "<script> alert('Bienvenido a la plataforma SIGC $user'); window.location= '../html/administrador-ad.html'</script>";
    } else {
        echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
    }
}
