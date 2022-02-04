<?php include('conexion.php');

/*
    Se almacenan los datos enviados por POST en cada una de las variables corespondientes
*/
$datos = array(
    'conx' => $conx,
    'user' => $_POST['userName'],
    'email' => $_POST['email'],
    'pass' => $_POST['password']
);


/*VALIDACIÓN DEL USUARIOS
    #Recibe por paramentro un arreglo de datos que serviran para realizar la consulta. 
    #Se evalua si un dato necesario para el administrador se encuentra o no, si es así se almacena una concatenación para la consulta.
    #Después de haber realizado la consulta se consulta la cantidad de resultados, si solo arrojo un resultado pasa y si no se debuelve al login.
    #En en condicional verdadero se inicia la sesión y se guarda el dato del usuario ingresado.
 */
function validar($d){

    $resultado = " ";
    if ($d['cod']) {
        $resulCod = "AND codigo = '$d[cod]'";
    }

    $sql = $d['conx']->query("SELECT u.nombre_perfil 
        FROM usuario u INNER JOIN $d[rol] a INNER JOIN datos_adicionales ad ON u.id_Usuario = a.id_usuario AND u.id_datos_adicionales = ad.id_datos_adicionales AND nombre_perfil = '$d[user]' AND id_rol = '$d[id_rol]' AND contraseña = '$d[pass]' " . $resulCod . "  AND correo = '$d[email]';");

    $resultado =  mysqli_num_rows($sql);

    if ($resultado === 1) {
        session_start();
        $usuario = $sql->fetch_row();

        $_SESSION["usuario"] = $usuario[0];

        header("Location: ../html/$d[rol]-index.php");
    } else {
        header("Location: ../index.html");
    }
}

/*DETECTAR DOCENTE
    Se comprueba si fue un Usuario con el rol Docente si fue el que ingreso
*/
if (isset($_POST['form_docente'])) {

    $datos["id_rol"] = 'D';
    $datos["rol"] = 'docente';

    validar($datos);
}

/*DETECTAR ESTUDIANTE
    Se comprueba si fue un Usuario con el rol Estudiante si fue el que ingreso
*/
if (isset($_POST['form_estudiante'])) {
    $datos["id_rol"] = 'E';
    $datos["rol"] = 'estudiante';

    validar($datos);
}

/*DETECTAR ADMINISTRADOR
    Si se ingreso desde el fomulario del administrador y si es así, se le agregan datos al arrglo y se llama la función validar
*/

if (isset($_POST['form_administrador'])) {
    $datos["id_rol"] = 'A';
    $datos["rol"] = 'administrador';
    $datos["cod"] = $_POST['codigo'];

    validar($datos);
}
