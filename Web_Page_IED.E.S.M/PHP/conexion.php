<?php

    /*CONEXIÓN 
        Se reunenen los datos necesarios para lograr la conexión con la base de datos
        En caso de no conectarse mostrará un mensaje*/
    $bdhost = 'localhost';
    $bduser = 'root';
    $bdpass = '';
    $bdname = 'sigc';

    
    if (!mysqli_connect($bdhost, $bduser, $bdpass, $bdname)) {
        die("No hay conexion:" . mysqli_connect_error());
    }else{
        $conx = mysqli_connect($bdhost, $bduser, $bdpass, $bdname);
    }
?>