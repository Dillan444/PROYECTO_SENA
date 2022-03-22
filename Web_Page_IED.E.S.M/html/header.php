<header class="h-user">
    <div class="h-user--info">
        <?php
        echo "<h2>$rol[0]</h2>";
        echo "<p> " . buscarNombreUsuario($usuario, $conx, $rol[0]) . " </p>";
        ?>
        
    </div>

    <img src="../IMG/home.jpg" class="menu--icon">

    <nav class="opciones">
        <div class="opciones-perfil">
            <img src="../IMG/home.jpg" alt="">
            <span><?php echo $usuario ?></span>
        </div><hr>
        <ul class="opciones--cuenta">
            <a href="./actualizarMisDatos.php"><li>Actualizar mis Datos</li></a>
            <?php echo "<a href=\"./cambioPassword.php?r=$rol[0]\"><li>Cambiar Contraseña</li></a>"; ?>
            <a href="#"><li>Configuración</li></a>
            <a href="../PHP/cerrarSesion.php"><li>Cerrar Sesión</li></a>
        </ul>
    </nav>
</header>
