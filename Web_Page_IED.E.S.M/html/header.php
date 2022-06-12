<header class="h-user">
    <div class="h-user--info">
        <?php
        echo "<h2>$rol[0]</h2>";
        echo "<p> " . buscarNombreUsuario($usuario, $conx, $rol[0]) . " </p>";
        ?>
        
    </div>
    <?php $sexo = $conx -> query("SELECT da.sexo FROM datos_adicionales da INNER JOIN usuario u ON u.id_datos_adicionales = da.id_datos_adicionales AND u.nombre_perfil = '$usuario'") -> fetch_array()?>
    <img src="../IMG/<?php echo ($sexo['sexo'] === "F")?"userWoman":"userMan";?>.png" class="menu--icon">

    <nav class="opciones">
        <div class="opciones-perfil">
            <img src="../IMG/<?php echo ($sexo['sexo'] === "F")?"userWoman":"userMan";?>.png" alt="">
            <span><?php echo $usuario ?></span>
        </div><hr>
        <ul class="opciones--cuenta">
            <a href="./actualizarMisDatos.php"><li>Actualizar mis Datos</li></a>
            <?php echo "<a href=\"./cambioPassword.php\"><li>Cambiar Contraseña</li></a>"; ?>
            <a href="../PHP/cerrarSesion.php"><li>Cerrar Sesión</li></a>
        </ul>
    </nav>
</header>
