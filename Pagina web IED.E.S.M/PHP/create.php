<?php 
    // include('./conexion.php');

    

    function crearUsuarios($conx, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $number, $email, $sex, $user, $rol){
        $d_adicionales = "INSERT INTO  datos_adicionales(id_datos_adicionales, correo, Telefono, sexo) 
        VALUES (NULL, '$email', '$number','$sex')";

        if (mysqli_query($conx, $d_adicionales)){
                /*echo "<script>alert ('Se ha creado la cuenta de manera exitosa');</script>";*/

                $consulta = "SELECT id_datos_adicionales FROM datos_adicionales WHERE correo =  '$email' AND Telefono = $number AND sexo = '$sex'";
                $resultado = mysqli_query($conx, $consulta);
                $id = mysqli_fetch_array($resultado);
                $userName = generarUserName($fst_name, $scd_name, $fst_lastName, $scd_lastName);
                $password = generarPassword();

                insertUsuer($conx, $userName, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $password, $id, $user, $rol);
        }else{

            echo "Error: " . mysqli_error($conx);    
        }
    }

        

        
    

    function generarPassword(){
        $caracteres = "abcdefghijklmnñopqrstuvwxyz1234567890";
        $password = '';

        for ($i = 0; $i < 15; $i++) { 
            $password .= $caracteres[rand(0, strlen($caracteres))];
        }

        return $password;
    }

    function generarUserName($fn, $sn, $fln, $sln){

        $u = array($fn, $sn, $fln, $sln);
        $caracteres = '1234567890';
        $userName = $u[rand(0, strlen('$u'))]; 

        for ($i = 0; $i < rand(1, 4); $i++) { 
            $userName .= $caracteres[rand(0, strlen($caracteres))];
        }

        return $userName;        
    }
    


    function insertUsuer($conx, $userName, $rol_in, $fst_name, $scd_name, $fst_lastName, $scd_lastName, $age, $password, $id, $user, $rol){
        $insert = "INSERT INTO usuario(id_usuario, nombre_perfil ,id_rol, p_nombre, s_nombre, p_apellido, s_apellido ,edad, contraseña, id_datos_adicionales)
        VALUES (NULL, '$userName', '$rol_in', '$fst_name', '$scd_name','$fst_lastName','$scd_lastName', $age, '$password', $id[id_datos_adicionales])";
    
        if (mysqli_query($conx, $insert)){
            echo "<script>alert('Se ha creado la cuenta de manera exitosa'); window.location='../html/create-users.php?user=$user&rol=$rol'</script>";
        }else{
            echo "<script>alert ('No se ha creado la cuenta en el sistema');</script>";
            echo "Error: " . mysqli_error($conx);
        }
        
        mysqli_close($conx);
    }


    
    

?>