<?php

    /*CONEXIÓN 
        Se reunenen los datos necesarios para lograr la conexión con la base de datos
        En caso de no conectarse mostrará un mensaje*/
    $bdhost = 'localhost';
    $bduser = 'root';
    $bdpass = '';
    $bdname = 'sigc';

    $conx = mysqli_connect($bdhost, $bduser, $bdpass, $bdname);

    if (!$conx) {
        die("No hay conexion:" . mysqli_connect_error());
    }
?>