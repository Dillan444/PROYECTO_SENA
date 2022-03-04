<?php include('conexion.php');

if (isset($_POST['crear'])) {

    $datosRegistro = array(

        // Datos de la tabla usuario
        "rol_in" => $_POST['rol_in'],
        "fst_name" => $_POST['P_nombre'],
        "scd_name" => $_POST['S_nombre'],
        "fst_lastName" => $_POST['P_apellido'],
        "scd_lastName" => $_POST['S_apellido'],
        "age" => $_POST['edad'],

        // Datos de la tabla Datos Adicionales
        "number" => $_POST['telefono'],
        "email" => $_POST['correo'],
        "sex" => $_POST['sexo']
    );

    crearUsuarios($conx, $datosRegistro);
}

/*CREANDO NUEVOS USUARIOS EN LA BASE DE DATOS
        En esta función se crea un usuario llenado dos tablas que contienen sus datos
        Utiliza funciones anidadas para generar dos datos la contraseña y el nombre de usuario*/
function crearUsuarios($conx, $dR){
    $sqlInsert = "INSERT INTO  datos_adicionales(id_datos_adicionales, correo, Telefono, sexo) 
    VALUES (NULL, '$dR[email]', '$dR[number]','$dR[sex]')";

    if ($conx->query($sqlInsert)) {

        $sqlConsulta = "SELECT id_datos_adicionales FROM datos_adicionales WHERE correo =  '$dR[email]'";
        $resultado = mysqli_query($conx, $sqlConsulta);

        $id = $resultado->fetch_array();

        $userName = generarUserName($conx, $dR);
        $password = generarPassword();

        if (insertUsuer($conx, $userName, $dR, $password, $id)) {

            añadirUsuarioTablaRolCorrespondiente($conx, $userName, $dR['rol_in']);
        }
    } else {

        echo "Error: " . mysqli_error($conx);
    }
}

/*CREACIÓN DE UNA CONTRASEÑA ALEATORIA
        En una variable se colocan los caracteres que podra contener la contraseña
        Con un bucle for se establece cuantos carateres va a tener por primera vez
        El bucle escoge caracteres aleatorios por iteración y los concatena con los anteriores
        Finalmente retorna una contraseña
     */
function generarPassword(){
    $caracteres = "abcdefghijklmnñopqrstuvwxyz1234567890";
    $password = '';

    for ($i = 0; $i < 15; $i++) {

        $password .= $caracteres[rand(0, strlen($caracteres) - 1)];
    }

    return $password;
}

/*CREACIÓN DE UN NOMBRE DE USUARIO
        Se genera un user name con alguno de sus nombre más algunos número aleatorio
        Se almacenan sus nombres en un arreglo para escoger uno al azar
        Con un bucle se le agrega de uno a cutro número para generar un user name
        Y finalmente se retorna el string*/
function generarUserName($conx, $dR){

    $u = array(
        $dR['fst_name'], 
        $dR['scd_name'], 
        $dR['fst_lastName'], 
        $dR['scd_lastName']
    );

    $caracteres = '1234567890';
    
    do {
        $userName = $u[rand(0, strlen('$u') - 1)];
    } while (!$userName);

    for ($i = 0; $i < rand(1, 4); $i++) {
        $userName .= $caracteres[rand(0, strlen($caracteres) - 1)];
    }

    # Verificar si nombre_perfil ya existe
    $datos = false;

    $sqlConsulta = "SELECT * FROM usuario WHERE nombre_perfil = '$userName'";
    if ($resultado = $conx -> query($sqlConsulta)) {
        $datos = mysqli_num_rows($resultado);
    }

    if (!$datos) {
        return $userName;
    }
    generarUserName($conx, $dR);
}

/*INSERCIÓN EN LA TABLA USUARIO
        Se insertan los datos faltante en la tabla usuario con un insert into
        Se muestra un alert si se creo con exito o vicebersa*/
function insertUsuer($conx, $userName, $dR, $password, $id){
    $sqlInsert = "INSERT INTO usuario(id_usuario, nombre_perfil ,id_rol, p_nombre, s_nombre, p_apellido, s_apellido ,edad, contraseña, id_datos_adicionales)
    VALUES (NULL, '$userName', '$dR[rol_in]', '$dR[fst_name]', '$dR[scd_name]', '$dR[fst_lastName]', '$dR[scd_lastName]', $dR[age], '$password', $id[id_datos_adicionales])";

    if ($conx->query($sqlInsert)) {
    } else {
        echo "Error: " . mysqli_error($conx);
        return false;
    }

    return true;
}

function añadirUsuarioTablaRolCorrespondiente($conx, $userName, $rol){
    $sql = "SELECT id_Usuario FROM usuario WHERE nombre_perfil = '$userName'";

    $rolResult = ($rol === 'D') ? $rol = 'docente' : $rol = 'estudiante';

    $id = $conx->query($sql)->fetch_array();

    $sql = "INSERT INTO $rolResult (id_$rolResult, id_Usuario) VALUES (null, '$id[id_Usuario]')";

    if ($conx->query($sql)) {
        header("Location: ../html/create-users.php");
    } else {
        echo "Error: " . mysqli_error($conx);
    }
}