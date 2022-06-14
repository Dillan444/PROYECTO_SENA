<?php 

/*CAMBIAR LA CONTRASEÑA
        Se realiza la consulta para saber si la contraseña antigua que ingreso es igual al de la base de datos
        Se verifica si laconfirmación de la contraseña es igual al de la nueva contaseña 
        Si pasa por todos los filtros se ejecutara la actualización de la contraseña
        Se le aletara en la pantalla si fue exitoso o no*/

function cambioContraseña($lastpw, $newpw, $confpw, $user, $conx)
{

    if ($newpw !== $confpw) {

        echo "<script>mensaje.innerHTML = 'La nueva contraseña no coincide con la confimación'</script>";

    } else {

        $sql = "SELECT contraseña FROM usuario WHERE nombre_perfil = '$user'";
        $consulta = $conx->query($sql);
        $resultado = $consulta -> fetch_array();


        if ($lastpw === $resultado['contraseña']) {

            $sqlUpdate = "UPDATE usuario SET contraseña = '$newpw' WHERE contraseña = '$lastpw' AND nombre_perfil = '$user'";
            if ($conx->query($sqlUpdate)) {
                echo "<script>mensaje.innerHTML = 'Actualizado con exito'</script>";
            } else {

                echo "Error: <br />" . mysqli_error($conx);
            }
        } else {
            echo "<script>mensaje.innerHTML = 'La contraseña es incorrecta'</script>";
        }
    }
}

function modificarDatosUsuario($d, $conx, $u){
    $sqlConsulta = "SELECT u.id_datos_adicionales FROM usuario u INNER JOIN  datos_adicionales da
    ON u.id_datos_adicionales = da.id_datos_adicionales AND u.nombre_perfil = '$u'";

    if ($result = $conx -> query($sqlConsulta)) {
        
        $result = $result -> fetch_row();

        if(tablaDatosAdicionales($conx, $d, $result[0]) === true){
            if(tablaUsuario($conx, $d, $result[0])){

                echo "<script>
                    swal('Exelente',  'Datos actualizados exitosamente', 'success');
            
                    setTimeout(function(){
                        location.href = '../html/modificarDatosUsuario.php?user=$d[nombre_perfil]'
                    }, 3000);

                </script>";

            };
        }


    }

}

function tablaDatosAdicionales($conx, $d, $id_d_a){
    $sqlUpdateDA = "UPDATE datos_adicionales SET 
      correo =  '$d[correo]',
      Telefono =  '$d[telefono]',
      sexo =  '$d[sexo]'
      WHERE id_datos_adicionales = '$id_d_a'";

    if(!$conx -> query($sqlUpdateDA)){
        if ($conx -> errno == 1062) {
            echo "<script> inputs.mensaje_error.innerHTML = 'Hola Mundo'</script>
            Duplicidad de datos: " . mysqli_error($conx);
            return false; 
        }else{
          
            return "Error en tabla Datos Adicionales: " . mysqli_error($conx);
        }
    }

    return true;
}

function tablaUsuario($conx, $d, $id_d_a){
    $documento = (!$d['documento']) ? " " : ", documento = $d[documento]";

    $sqlUpdateU = "UPDATE usuario SET 
        nombre_perfil =  '$d[nombre_perfil]',
        tipo_documento = '$d[tipo_documento]'
        $documento,
        p_nombre =  '$d[p_nombre]',
        s_nombre =  '$d[s_nombre]',
        p_apellido =  '$d[p_apellido]',
        s_apellido =  '$d[s_apellido]',
        edad =  '$d[edad]'
        WHERE id_datos_adicionales = '$id_d_a';";

    if(!$conx -> query($sqlUpdateU)){
        if ($conx -> errno == 1062) {
            echo "Duplicidad de datos: " . mysqli_error($conx);
            return false;
            
        }else{
            
            echo "Error tabla usuario: " . mysqli_error($conx);
            return false;
        }
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