<?php
    
    include('conexion.php');    
    
    /*TABLA CON MIS CURSOS (DOCENTE)
        1.Se realiza una consulta para saber en cursos dica y que materia dicta en ese curso
        2.Se guarda lo que arrojo la consulta en un arreglo
        3.Un bucle itera por cada fila para mostrarlos por cada fila de la tabla de la pagina 
        4.Se accede a cada dato con notación de laves []    */
function cargarTabla($conx, $usuario){
    // $consulta = "SELECT c.numero_curso, COUNT(e.n_matricula) AS cantidad
    // FROM  estudiante e, curso c, integrantesCurso i
    // WHERE e.n_matricula = i.n_matricula AND c.numero_curso = i.numero_curso
    // GROUP BY numero_curso";

    $consulta = "SELECT d.id_docente, u.p_nombre, u.p_apellido, c.numero_curso, a.nombre_asignatura
    FROM usuario u, docente d, dicta dt, asignatura a, curso c, clases cl
    WHERE u.id_Usuario = d.id_Usuario AND d.id_docente = dt.id_docente AND cl.id_asignatura = a.id_asignatura
    AND cl.numero_curso = c.numero_curso
    AND a.id_asignatura = dt.id_asignatura  AND a.nombre_asignatura = 'sociales' /*AND c.numero_curso = dt.numero_curso*/
    AND d.id_docente = $usuario
    ORDER BY c.numero_curso";
    $resultado = mysqli_query($conx, $consulta);

    while ($fila = mysqli_fetch_array($resultado)) {
        echo "<tr>";
            echo "<td data-titulo = 'Curso'>" . $fila['numero_curso'] . "</td>";
            echo "<td data-titulo = 'Grado'> ". buscarGrado($fila['numero_curso']) . "</td>";
            echo "<td data_titulo = 'Cantidad'> " . $fila['nombre_asignatura'] . "</td>";

            echo"<td data-titulo = 'Calificar'> 
                    <a href=\"../html/calificar.php?curso=$fila[numero_curso]&materia=$fila[nombre_asignatura]&user=$usuario\"><i class=\"far fa-edit\"></i></a>
                </td>";
                
            echo"<td data-titulo = 'Revisar'> 
                    <a href='#?curso=$fila[numero_curso]&materia=$fila[nombre_asignatura]&user=$usuario'><i class=\"far fa-eye\"></i></a> 
                </td>";
                
        echo "</tr>";
    }
    mysqli_close($conx);
}
    
    /*BUSCANDO EL NOMBRE DEL GRADO
        Esta es una subFunción de "cargarTabla"
        Se llama para generar si el curso es sexto, septimo, etc...
        1.Mediante un paramentro se trae un dato de la enterio función que es el número del grado
        2.Con condicionales "if" se compara el paramentro con los números de los cursos que corresponden a un grado  
        3.Si coincide se retorna el dato que se mostrar en la anterior función*/
function buscarGrado($grado){        

    if ($grado == 601 || $grado == 602 || $grado == 603 || $grado == 604){
        return 'Sexto';
    }
    else if ($grado == 701 || $grado == 702){
        return 'Septimo';
    }      
    else if ($grado == 801 || $grado == 802  || $grado == 803){
        return 'Octavo';
    }
    else if ($grado == 901 || $grado == 902 || $grado == 903 ){
        return 'Noveno';
    }     
    else if ($grado == 1001 || $grado == 1002){
        return 'Decimo';
        
    }
    else if ($grado == 1101 ||$grado == 1102 || $grado == 1103  ){
        return 'once';
        
    }
            
}

    /*ESTUDIANTES DEL DOCENTE x MATERIA & CURSO
        Una vez que el docente escoja que curso y materia va a calificar se mostrar un listado de los integrantes
            para hacer su respectiva calficación
        1.Recibe unos datos por parametro
        2.Se realiza una consulta con los datos insertados para listar los integrantes del curso.
        3.Se almacenan los datos de la consulta en un arreglo
        4.Con un bucle se muestran los datos de una fila por cada iteración
        5.Se usa una variable para enumerar el indice
     */
function cargarLista($conx, $materia, $user, $curso){
    $consulta = "SELECT *
    FROM estudiante e, usuario u, definitivas df, asignatura a, integrantescurso i, curso c, docente d, dicta dt
    WHERE e.id_Usuario = u.id_Usuario AND e.n_matricula = df.n_matricula AND d.id_docente = dt.id_docente AND dt.id_asignatura = a.id_asignatura
    AND dt.numero_curso = c.numero_curso 
    AND d.id_docente = $user AND a.nombre_asignatura = '$materia' AND c.numero_curso = $curso
    AND a.id_asignatura = df.id_asignatura AND c.numero_curso = i.numero_curso AND i.n_matricula = e.n_matricula";
    $notas = mysqli_query($conx, $consulta);
    $indide = 1;

    while ($fila = mysqli_fetch_array($notas)) {
        echo "<tr>";
            echo "<td>". $indide ."</td>";
            echo "<td>". $fila['p_nombre']." ". $fila['s_nombre'] ."</td>";
            echo "<td>". $fila['p_apellido']. " ".$fila['s_apellido'] ."</td>";
            // echo "<td>". $fila['definitiva_B1'] ."</td>";
            // echo "<td>". $fila['definitiva_B2'] ."</td>";
            echo "<td> <input type=\"number\" name=\"$fila[nombre_perfil]\"/> </td>";
            // echo "<td>". $fila['definitiva_B4'] ."</td>";
        echo "</tr>";
        $indide++;
    }

    mysqli_close($conx);
}

    /*BUSCAR EL NOMBRE DEL QUE INICIO SESIÓN
        1.Se traen tres parametros para identificar quien fue el que entro en su cuenta
        2.Se usan esos datos para realizar una consulta especifica del usuario
        3.Se almacenan en un arreglo los resultados
        4.Luego se imprimen los datos en pantalla*/
function buscarNombreUsuario($usuario, $conx, $rol){
    $nombreUsuario =  "SELECT * FROM usuario u WHERE u.nombre_perfil = '$usuario' AND id_rol = '$rol[0]'";
    
    $fullName = $conx -> query($nombreUsuario);

    $name = $fullName -> fetch_array();

    if ($name) {
        return $name['p_nombre'] .' '. $name['s_nombre'] .' '. $name['p_apellido'] .' '. $name['s_apellido'];
    }else{

        // echo "No hay resultados";
        header("Location: ../index.html");
    }
    
    // mysqli_close($conx);
}


    /*BUSCAR LAS CALIFICACIONES DEL ESTUDIANTE
        El estudiante puede buscar sus calificaciones por materia en cada uno de los bimestres 
        
        *La sintaxis del código es la misma que en las anteriores funciones
     */
function cargarMisNotas($conx, $usuario){
    $consulta = "SELECT a.nombre_asignatura, df.definitiva_B1, df.definitiva_B2, df.definitiva_B3, df.definitiva_B4 
    FROM estudiante e, usuario u, asignatura a, definitivas df
    WHERE u.id_usuario = e.id_usuario AND e.n_matricula = df.n_matricula AND a.id_asignatura = df.id_asignatura
    AND e.n_matricula = $usuario";
    $resultado = mysqli_query($conx, $consulta);
    $i = 1;

    while ($fila = mysqli_fetch_array($resultado)){
            
        echo "<tr>";
            echo "<td>" . $i . "</td>";
            echo "<td>" . $fila['nombre_asignatura']. "</td>";
            echo "<td>" . $fila['definitiva_B1'] . "</td>";
            echo "<td>" . $fila['definitiva_B2'] . "</td>";
            echo "<td>" . $fila['definitiva_B3'] . "</td>";
            echo "<td>" . $fila['definitiva_B4'] . "</td>";
        echo "</tr>";   
            
        $i++;
                

    }    
    mysqli_close($conx);
}    

function mostrarDatosUsuario($conx){
    $sql = "
        SELECT id_usuario, da.id_datos_adicionales, u.nombre_perfil, u.id_rol, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, u.edad, da.correo, da.Telefono, da.sexo FROM usuario u LEFT JOIN datos_adicionales da ON u.id_datos_adicionales = da.id_datos_adicionales WHERE u.id_rol NOT LIKE 'A'
        UNION SELECT id_usuario, da.id_datos_adicionales, u.nombre_perfil, u.id_rol, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, u.edad, da.correo, da.Telefono, da.sexo FROM usuario u right JOIN datos_adicionales da ON u.id_datos_adicionales = da.id_datos_adicionales WHERE u.id_rol NOT LIKE 'A'
    ";

    if ($result = $conx -> query($sql)) {
        while ($fila = $result -> fetch_row()) {
            echo "<tr>";
                foreach ($fila as $value) {
                    echo "<td>$value</td>";
                }
                echo "<td>
                    <a href='modificarDatosUsuario.php?user=$fila[2]'>Modificar</a>
                </td>";                             
                echo "<td> <input type='button' name='estado' value='Deshabilitar' id='on-off' 
                /> </td>";                             
            echo"</tr>";
        }
    }
}

?>