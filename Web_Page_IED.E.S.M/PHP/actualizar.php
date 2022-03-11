<?php 

/*CAMBIAR LA CONTRASEÑA
        Se realiza la consulta para saber si la contraseña antigua que ingreso es igual al de la base de datos
        Se verifica si laconfirmación de la contraseña es igual al de la nueva contaseña 
        Si pasa por todos los filtros se ejecutara la actualización de la contraseña
        Se le aletara en la pantalla si fue exitoso o no*/

function cambioContraseña($lastpw, $newpw, $confpw, $user, $conx)
{

    if ($newpw !== $confpw) {

        echo "<p class = 'mensaje'>La nueva contraseña no coincide con la confimación</p>";

    } else {

        $sql = "SELECT contraseña FROM usuario WHERE nombre_perfil = '$user'";
        $consulta = $conx->query($sql);
        $resultado = $consulta -> fetch_array();


        if ($lastpw === $resultado['contraseña']) {

            $sqlUpdate = "UPDATE usuario SET contraseña = '$newpw' WHERE contraseña = '$lastpw' AND nombre_perfil = '$user'";
            if ($conx->query($sqlUpdate)) {

                echo "<p class = 'mensaje'>Actualizado con exito</p>";
            } else {

                echo "Error: <br />" . mysqli_error($conx);
            }
        } else {
            echo "<p class = 'mensaje'>La contraseña es incorrecta</p>";
        }
    }
}

function modificarDatosUsuario($d, $conx, $u){
    $sqlConsulta = "SELECT u.id_datos_adicionales FROM usuario u INNER JOIN  datos_adicionales da
    ON u.id_datos_adicionales = da.id_datos_adicionales AND u.nombre_perfil = '$u'";

    if ($result = $conx -> query($sqlConsulta)) {
        
        $result = $result -> fetch_row();

        $sqlUpdateDA = "UPDATE datos_adicionales SET 
            correo =  '$d[email]',
            telefono =  '$d[telefono]',
            sexo =  '$d[sexo]'
        WHERE id_datos_adicionales = '$result[0]'";

        $sqlUpdateU = "UPDATE usuario SET 
            nombre_perfil =  '$d[userName]',
            p_nombre =  '$d[p_nombre]',
            s_nombre =  '$d[s_nombre]',
            p_apellido =  '$d[p_apellido]',
            s_apellido =  '$d[s_apellido]',
            id_rol =  '$d[id_rol]',
            edad =  '$d[edad]'
            WHERE id_datos_adicionales = '$result[0]';";

        if(!$conx -> query($sqlUpdateU)){

            echo "Error: " . mysqli_error($conx);
        }

        if(!$conx -> query($sqlUpdateDA)){

            echo "Error: " . mysqli_error($conx);
        }

        header("Location: ../html/modificarDatosUsuario.php?user=$d[userName]");

    }

    

}

function asignarCalificacionesEstudiantes($conx, $datos){

    
    $sqlUpdate = "UPDATE definitivas SET definitiva_B3 = $datos[nota] WHERE estudiante = $datos[estudiante] AND id_asignatura = $datos[materia]";
        
    if ($conx -> query($sqlUpdate)) {
    }else{
        echo "error";
    }
}