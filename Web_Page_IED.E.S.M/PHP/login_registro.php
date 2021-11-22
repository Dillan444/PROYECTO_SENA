<?php

include('conexion.php');

/*
    Se almacenan los datos enviados por POST en cada una de las variables corespondientes
*/
$user = $_POST['userName'];
$email = $_POST['email'];
$pass = $_POST['password'];


/*VALIDACIÓN DEL USUARIO "D"-"E"
    Recibe parametros de datos de un formulario
    Se realiza una consulta especifica con cada uno de los datos pasador por parametros
    Los resultador de la consulta se almacenan en un arreglo

    Si la busqueda arrojo resultados se procede a enviar al usuario dentro del sitema dependientdo de su rol
        De lo contrario lo devuelve a para que se vuelva loguear
 */
function validar($user, $email, $pass, $rol, $conx){
    $query = mysqli_query($conx, "SELECT * FROM usuario, datos_adicionales
        WHERE nombre_perfil = '$user' AND id_rol = '$rol' AND contraseña = '$pass' AND correo = '$email'");
    $nr = mysqli_num_rows($query);

    if ($nr == 1) {
        echo "<script> alert('Bienvenido a la plataforma SIGC $user');

            if('$rol' == \"D\"){
                
                window.location= '../html/docente-index.php?user=$user';

            }else if('$rol' == \"E\"){

                window.location= '../html/estudiante-index.php';
            }

            </script>";
    } else {

        echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
    }
}

/*DETECTAR DOCENTE
    Se comprueba si fue un Usuario con el rol Docente si fue el que ingreso
*/
if (isset($_POST['ingresar'])) {
    $rol = 'D';
    validar($user, $email, $pass, $rol, $conx);
}

/*DETECTAR ESTUDIANTE
    Se comprueba si fue un Usuario con el rol Estudiante si fue el que ingreso
*/
if (isset($_POST['enviar'])) {
    $rol = 'E';
    validar($user, $email, $pass, $rol, $conx);
}

/*DETECTAR ADMINISTRADOR
    Se comprueba si fue un Usuario con el rol Administrador si fue el que ingreso
    Recibe parametros de datos de un formulario
    Se realiza una consulta especifica con cada uno de los datos pasador por parametros
    Los resultador de la consulta se almacenan en un arreglo

    Si la busqueda arrojo resultados se procede a enviar al usuario dentro del sitema dependientdo de su rol
        De lo contrario lo devuelve a para que se vuelva loguear
*/

if (isset($_POST['entrar'])) {
    $code = $_POST['codigo'];

    $query = mysqli_query($conx, "SELECT * FROM usuario u, administrador a, datos_adicionales ad
        WHERE nombre_perfil = '$user' AND id_rol = 'A' AND contraseña = '$pass' AND codigo = '$code' AND correo = '$email'");
    $nr = mysqli_num_rows($query);

    if ($nr == 1) {
        echo "<script> alert('Bienvenido a la plataforma SIGC $user'); window.location= '../html/administrador-index.php'</script>";
    } else {
        echo "<script> alert('Usuario no existente'); window.location = '../html/login.html'</script>";
    }
}
