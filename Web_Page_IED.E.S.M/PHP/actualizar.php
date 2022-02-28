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