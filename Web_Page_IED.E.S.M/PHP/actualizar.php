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

        tablaDatosAdicionales($conx, $d, $result[0]);
        tablaUsuario($conx, $d, $result[0]);

        header("Location: ../html/modificarDatosUsuario.php?user=$d[userName]");

    }

}

function tablaDatosAdicionales($conx, $d, $id_d_a){
    $sqlUpdateDA = "UPDATE datos_adicionales SET 
      correo =  '$d[correo]',
      Telefono =  '$d[Telefono]',
      sexo =  '$d[sexo]'
      WHERE id_datos_adicionales = '$id_d_a'";

    if(!$conx -> query($sqlUpdateDA)){
        if ($conx -> errno == 1062) {
            return "Error: " . mysqli_error($conx);
                
        }else{
          
            return "Error: " . mysqli_error($conx);
        }
    }

    return true;
}

function tablaUsuario($conx, $d, $id_d_a){
    $var = (!$d['documento']) ? " " : ", documento = $d[documento]";

    $sqlUpdateU = "UPDATE usuario SET 
        nombre_perfil =  '$d[nombre_perfil]',
        tipo_documento = '$d[tipo_documento]'
        $var,
        p_nombre =  '$d[p_nombre]',
        s_nombre =  '$d[s_nombre]',
        p_apellido =  '$d[p_apellido]',
        s_apellido =  '$d[s_apellido]',
        id_rol =  '$d[id_rol]',
        edad =  '$d[edad]'
        WHERE id_datos_adicionales = '$id_d_a';";

    if(!$conx -> query($sqlUpdateU)){
        echo "Error: " . mysqli_error($conx);
    }

    return true;
}


function asignarCalificacionesEstudiantes($conx, $datos){

    
    $sqlUpdate = "UPDATE definitivas SET 
      definitiva_B1 = $datos[nota1],
      definitiva_B2 = $datos[nota2],
      definitiva_B3 = $datos[nota3],
      definitiva_B4 = $datos[nota4]
      WHERE estudiante = $datos[estudiante] AND id_asignatura = $datos[materia]";
        
    if (!$conx -> query($sqlUpdate)) {
        echo "Error " . mysqli_error($conx);
    }else{
    }
}