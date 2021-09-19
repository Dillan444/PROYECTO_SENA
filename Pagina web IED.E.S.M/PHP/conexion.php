<?php

    $bdhost = 'localhost';
    $bduser = 'root';
    $bdpass = '';
    $bdname = 'sigc';

    $conx = mysqli_connect($bdhost, $bduser, $bdpass, $bdname);

    if (!$conx) {
        die("No hay conexion:" . mysqli_connect_error());
    }
?>