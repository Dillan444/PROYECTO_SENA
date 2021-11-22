<?php 
    
    /*CREANDO NUEVOS USUARIOS EN LA BASE DE DATOS
        En esta función se crea un usuario llenado dos tablas que contienen sus datos
        Utiliza funciones anidadas para generar dos datos la contraseña y el nombre de usuario*/
function crearUsuarios($conx, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $number, $email, $sex, $user, $rol){
    $d_adicionales = "INSERT INTO  datos_adicionales(id_datos_adicionales, correo, Telefono, sexo) 
    VALUES (NULL, '$email', '$number','$sex')";

    if (mysqli_query($conx, $d_adicionales)){
            /*echo "<script>alert ('Se ha creado la cuenta de manera exitosa');</script>";*/

            $consulta = "SELECT id_datos_adicionales FROM datos_adicionales WHERE correo =  '$email' AND Telefono = $number AND sexo = '$sex'";
            $resultado = mysqli_query($conx, $consulta);
            $id = mysqli_fetch_array($resultado);
            $userName = generarUserName($fst_name, $scd_name, $fst_lastName, $scd_lastName);
            $password = generarPassword();

            insertUsuer($conx, $userName, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $password, $id, $user, $rol);
    }else{

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
        $password .= $caracteres[rand(0, strlen($caracteres))];
    }

    return $password;
}

    /*CREACIÓN DE UN NOMBRE DE USUARIO
        Se genera un user name con alguno de sus nombre más algunos número aleatorio
        Se almacenan sus nombres en un arreglo para escoger uno al azar
        Con un bucle se le agrega de uno a cutro número para generar un user name
        Y finalmente se retorna el string*/
function generarUserName($fn, $sn, $fln, $sln){

    $u = array($fn, $sn, $fln, $sln);
    $caracteres = '1234567890';
    $userName = $u[rand(0, strlen('$u'))]; 

    for ($i = 0; $i < rand(1, 4); $i++) { 
        $userName .= $caracteres[rand(0, strlen($caracteres))];
    }

    return $userName;        
}

    /*INSERCIÓN EN LA TABLA USUARIO
        Se insertan los datos faltante en la tabla usuario con un insert into
        Se muestra un alert si se creo con exito o vicebersa*/
function insertUsuer($conx, $userName, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $password, $id, $user, $rol){
    $insert = "INSERT INTO usuario(id_usuario, nombre_perfil ,id_rol, p_nombre, s_nombre, p_apellido, s_apellido ,edad, contraseña, id_datos_adicionales)
    VALUES (NULL, '$userName', '$rol_in', '$fst_name', '$scd_name','$fst_lastName','$scd_lastName', $age, '$password', $id[id_datos_adicionales])";

    if (mysqli_query($conx, $insert)){
        echo "<script>alert('Se ha creado la cuenta de manera exitosa'); window.location='../html/create-users.php?user=$user&rol=$rol'</script>";
    }else{
        echo "<script>alert ('No se ha creado la cuenta en el sistema');</script>";
        echo "Error: " . mysqli_error($conx);
    }
    
    mysqli_close($conx);
}

?>