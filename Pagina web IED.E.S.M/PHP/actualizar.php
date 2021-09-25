<?php

function cambioContraseña($lastpw, $newpw, $confpw, $user, $conx)
{

    $consulta = "SELECT u.id_usuario, u.contraseña FROM usuario u, docente d 
        WHERE id_docente = $user AND u.id_usuario = d.id_usuario";
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
                    window.location='../html/docente-index.php';
                    alert('Contraseña actualizada con exito');
                </script>";
        } else {
            echo "Error: <br />" . mysqli_error($conx);
        }
    }
}
