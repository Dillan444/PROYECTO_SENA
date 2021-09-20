<?php 
    
    include('conexion.php');
    include('login_registro.php');
    
    function cargarTabla($conx){
        $consulta = "SELECT c.numero_curso, COUNT(e.n_matricula) AS cantidad
        FROM  estudiante e, curso c, integrantesCurso i
        WHERE e.n_matricula = i.n_matricula AND c.numero_curso = i.numero_curso
        GROUP BY numero_curso";
        $resultado = mysqli_query($conx, $consulta);

        while ($fila = mysqli_fetch_array($resultado)) {
            echo "<tr>";
                echo "<td data-titulo = 'Curso'>" . $fila['numero_curso'] . "</td>";
                echo "<td data-titulo = 'Grado'> ". buscarGrado($fila['numero_curso']) . "</td>";
                echo "<td data_titulo = 'Cantidad'> ". $fila['cantidad'] . "</td>";

                echo"<td data-titulo = 'Calificar'> 
                        <a href='#'><i class=\"far fa-edit\"></i></a> 
                    </td>";
                 
                echo"<td data-titulo = 'Revisar'> 
                        <a href='#'><i class=\"far fa-eye\"></i></a> 
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
    
    

?>