<?php

function cambioContraseña($lastpw, $newpw, $confpw, $user, $conx, $rol)
{

    if ($rol[0] === 'estudiante') {
    $consulta = "SELECT u.id_usuario, u.contraseña FROM usuario u, $rol[0] d 
        WHERE $rol[1] = $user AND u.id_usuario = d.id_usuario";
        
    }else{
    $consulta = "SELECT u.id_usuario, u.contraseña FROM usuario u, $rol d 
        WHERE id_$rol = $user AND u.id_usuario = d.id_usuario";
    }

    $resultado = mysqli_query($conx, $consulta);
    $pass = mysqli_fetch_array($resultado);

    $actualizar = "UPDATE usuario SET contraseña = '$newpw' 
       WHERE contraseña = '$lastpw' AND id_usuario = $pass[id_usuario]";


    if ($lastpw !== $pass['contraseña']) {
        echo "<p class = 'mensaje'>La contraseña es incorrecta</p>";
    }

    if ($newpw !== $confpw) {
        echo "<p class = 'mensaje'>La nueva contraseña no coincide con la confimación</p>";
        
    } else if ($lastpw === $pass['contraseña']) {

        if (mysqli_query($conx, $actualizar)) {
            echo "<script> 
                    window.location='../html/$rol-index.php';
                    alert('Contraseña actualizada con exito');
                </script>";
        } else {
            echo "Error: <br />" . mysqli_error($conx);
        }
    }
}
