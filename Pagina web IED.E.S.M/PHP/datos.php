<?php 
    
    include('conexion.php');    
    
    
    function cargarTabla($conx, $usuario){
        // $consulta = "SELECT c.numero_curso, COUNT(e.n_matricula) AS cantidad
        // FROM  estudiante e, curso c, integrantesCurso i
        // WHERE e.n_matricula = i.n_matricula AND c.numero_curso = i.numero_curso
        // GROUP BY numero_curso";

        $consulta = "SELECT d.id_docente, u.p_nombre, u.p_apellido, c.numero_curso, a.nombre_asignatura
        FROM usuario u, docente d, dicta dt, asignatura a, curso c
        WHERE u.id_Usuario = d.id_Usuario AND d.id_docente = dt.id_docente 
        AND a.id_asignatura = dt.id_asignatura AND c.numero_curso = dt.numero_curso
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
  
    function buscarNombreUsuario($usuario, $conx){
        $nombreUsuario =  "SELECT * FROM docente d, usuario u
        WHERE d.id_usuario = u.id_usuario AND d.id_docente = $usuario";
        $fullName = mysqli_query($conx, $nombreUsuario);

        while ($name = mysqli_fetch_array($fullName)) {
            echo "<a> ".$name['p_nombre'] .' '. $name['s_nombre'] .' '. $name['p_apellido'] .' '. $name['s_apellido']."</a>";
        }
        
        // mysqli_close($conx);
    }

?>

