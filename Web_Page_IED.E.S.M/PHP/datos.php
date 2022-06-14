<?php
    
    include('conexion.php');    
    
    /*TABLA CON MIS CURSOS (DOCENTE)
        1.Se realiza una consulta para saber en cursos dica y que materia dicta en ese curso
        2.Se guarda lo que arrojo la consulta en un arreglo
        3.Un bucle itera por cada fila para mostrarlos por cada fila de la tabla de la pagina 
        4.Se accede a cada dato con notación de laves []    */
function cargarTabla($conx, $usuario){

    $consulta = "SELECT c.curso, a.id_asignatura, a.nombre_asignatura, cl.año, count(i.id_estudiante) AS cantidad
        FROM curso c INNER JOIN clases cl ON c.id_curso = cl.id_curso
        INNER JOIN integrantescurso i ON i.id_curso = c.id_curso  
        INNER JOIN asignatura a ON a.id_asignatura = cl.id_asignatura 
        INNER JOIN docente d ON d.id_docente = cl.id_docente 
        INNER JOIN usuario u ON u.id_Usuario = d.id_Usuario AND u.nombre_perfil = '$usuario' 
        GROUP BY c.curso";

    if(!$resultado = $conx -> query($consulta)){
        return "<tr><td colspan='5'>Ha ocurrido un problema al consultar los datos, intenta mas tarde o comunicate<br/> con un Administrador.
        Código de error: " . mysqli_errno($conx) . " </td></tr>";
    };

    if (mysqli_num_rows($resultado) < 1){
            return "<tr><td colspan='5'>No tienes cursos asignados</td></tr>";
        }

    while ($fila = $resultado -> fetch_array()) {
        echo "<tr>";
            echo "<td data-titulo = 'Curso'>" . $fila['curso'] . "</td>";
            echo "<td data_titulo = 'Cantidad'> " . $fila['cantidad'] . "</td>";
            echo "<td data-titulo = 'Grado'> ". buscarGrado($fila['curso']) . "</td>";
            echo "<td data_titulo = 'Cantidad'> " . $fila['nombre_asignatura'] . "</td>"; ?>
            
            
            <td><form action="../html/calificar.php" method="post">
                <input type="hidden" name="materia" value="<?php echo $fila['id_asignatura']; ?>" >
                <input type="hidden" name="curso" value="<?php echo $fila['curso']; ?>" >
                <button class= "boton" type="submit" > Calificar <i class="far fa-edit"></i></button>
            </form></td>

            <td><form action="../html/registros.php" method="post">
                <input type="hidden" name="materia" value="<?php echo $fila['id_asignatura']; ?>" >
                <input type="hidden" name="curso" value="<?php echo $fila['curso']; ?>" >
                <button class= "boton" type="submit" > Ver <i class="far fa-eye"></i></button>
            </form></td>
               
                
       <?php  echo "</tr>";
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
function cargarListadoEstudiantilDocente($conx, $materia, $docente, $curso){
    $sqlDocente = "SELECT dc.id_docente FROM usuario u INNER JOIN docente dc ON dc.id_Usuario = u.id_Usuario AND u.nombre_perfil = '$docente'";
    $docente = $conx -> query($sqlDocente) -> fetch_array();

    $consulta = "SELECT u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, d.definitiva_B3, i.id_integrantecurso, d.definitiva_B1, d.definitiva_B2, d.definitiva_B4
        FROM clases cl INNER JOIN curso c ON cl.id_curso = c.id_curso 
        AND c.curso = $curso AND cl.id_asignatura = $materia AND cl.id_docente = '$docente[id_docente]'
        INNER JOIN integrantescurso i ON i.id_curso = c.id_curso AND i.año = now()
        INNER JOIN definitivas d ON d.estudiante = i.id_integrantecurso AND d.id_asignatura = $materia
        INNER JOIN estudiante e ON i.id_estudiante = e.id_estudiante
        INNER JOIN usuario u ON u.id_Usuario = e.id_Usuario";

    $notas = mysqli_query($conx, $consulta);
    $indice = 1;

    while ($fila = $notas -> fetch_array()) {?>
        <tr>
            <td> <?php echo $indice; ?> </td>
            <td> <?php echo $fila['p_nombre'] . " " . $fila['s_nombre'] ?> </td>
            <td> <?php echo $fila['p_apellido'] . " " . $fila['s_apellido'] ?> </td>
            <form action="#" method="post">
                <input type="hidden" name="estudiante" value="<?php echo $fila['id_integrantecurso']; ?>">
                <input type="hidden" name="materia" value="<?php echo $materia; ?>">
                <input type="hidden" name="curso" value="<?php echo $curso; ?>">
                <td>
                    <input type="number" max="50" min="0" name="nota1" id="nota1" value="<?php echo !$fila['definitiva_B1'] ? null : $fila['definitiva_B1']; ?>" class="boton">
                </td>
                <td>
                    <input type="number" max="50" min="0" name="nota2" id="nota2" value="<?php echo !$fila['definitiva_B2'] ? null : $fila['definitiva_B2']; ?>" class="boton">
                </td>
                <td>
                    <input type="number" max="50" min="0" name="nota3" id="nota3" value="<?php echo !$fila['definitiva_B3'] ? null : $fila['definitiva_B3']; ?>" class="boton">
                </td>
                <td>
                    <input type="number" max="50" min="0" name="nota4" id="nota4" value="<?php echo !$fila['definitiva_B4'] ? null : $fila['definitiva_B4']; ?>" class="boton">
                </td>
                <td>
                    <input type="submit" name="accion" value="Cargar" class="boton">
                </td>
            </form>
        </tr>

        <?php $indice++;
    }

    mysqli_close($conx);
}

function mostrarCalificacionesMisEstudiantes($conx, $materia, $docente, $curso){
    $sqlDocente = "SELECT dc.id_docente FROM usuario u INNER JOIN docente dc ON dc.id_Usuario = u.id_Usuario AND u.nombre_perfil = '$docente'";
    $docente = $conx -> query($sqlDocente) -> fetch_array();

    $consulta = "SELECT *
        FROM clases cl INNER JOIN curso c ON cl.id_curso = c.id_curso 
        AND c.curso = $curso AND cl.id_asignatura = $materia AND cl.id_docente = '$docente[id_docente]'
        INNER JOIN integrantescurso i ON i.id_curso = c.id_curso AND i.año = now()
        INNER JOIN definitivas d ON d.estudiante = i.id_integrantecurso AND d.id_asignatura = $materia
        INNER JOIN estudiante e ON i.id_estudiante = e.id_estudiante
        INNER JOIN usuario u ON u.id_Usuario = e.id_Usuario";

    $notas = $conx -> query($consulta);
    $indice = 1;
    $acumulado = array(0, 0, 0, 0);

    while ($fila = $notas -> fetch_array()) {?>
        <tr>
            <td> <?php echo $indice; ?> </td>
            <td width="150" > <?php echo $fila['p_nombre'] . " " . $fila['s_nombre'] ?> </td>
            <td width="150" > <?php echo $fila['p_apellido'] . " " . $fila['s_apellido'] ?> </td>
            <td class="right"> <?php echo !$fila['definitiva_B1']? null: $fila['definitiva_B1'] ?> </td>
            <td class="right"> <?php echo !$fila['definitiva_B2']? null: $fila['definitiva_B2'] ?> </td>
            <td class="right"> <?php echo !$fila['definitiva_B3']? null: $fila['definitiva_B3'] ?> </td>
            <td class="right"> <?php echo !$fila['definitiva_B4']? null: $fila['definitiva_B4'] ?> </td>
            <td class="right"> <?php 
                $promedio = 0;
                for ($i=1; $i <= 4; $i++) { 
                    $promedio += $fila['definitiva_B' . $i];
                    $acumulado[$i - 1] += $fila['definitiva_B' . $i];
                    $acumulado[5] = $indice;
                }

                echo round($promedio / 4, 1);
            ?> </td>
        </tr>

    <?php $indice++; }?>
        <tr>
            <td colspan="3">TOTAL Promedio General</td>    
            <?php foreach ($acumulado as $periodo) { ?>
                    <td class="right"><?php echo round($periodo / $acumulado[5], 1); ?></td>
            <?php }
            ?>
        </tr>
    <?php 
}

    /*BUSCAR EL NOMBRE DEL QUE INICIO SESIÓN
        1.Se traen tres parametros para identificar quien fue el que entro en su cuenta
        2.Se usan esos datos para realizar una consulta especifica del usuario
        3.Se almacenan en un arreglo los resultados
        4.Luego se imprimen los datos en pantalla*/
function buscarNombreUsuario($usuario, $conx, $rol){
    $nombreUsuario =  "SELECT * FROM usuario u WHERE u.nombre_perfil = '$usuario' AND id_rol = '$rol[0]' AND estado = 1";
    
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

    $consulta = "SELECT c.curso, a.nombre_asignatura, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, d.definitiva_B1, d.definitiva_B2, d.definitiva_B3, d.definitiva_B4, i.año 
        FROM asignatura a INNER JOIN definitivas d ON a.id_asignatura = d.id_asignatura 
        INNER JOIN integrantescurso i ON d.estudiante = i.id_integrantecurso AND i.año = now() 
        INNER JOIN curso c ON i.id_curso = c.id_curso 
        INNER JOIN estudiante e ON e.id_estudiante = i.id_estudiante
        INNER JOIN usuario u ON u.id_Usuario = e.id_Usuario AND u.nombre_perfil = '$usuario'";

    $resultado = $conx -> query($consulta);

    while ($fila = mysqli_fetch_array($resultado)){?>
        
        <tr>
            <td><?php echo $fila['nombre_asignatura']; ?></td>
            <td><?php echo $fila['definitiva_B1']; ?></td>
            <td><?php echo $fila['definitiva_B2']; ?></td>
            <td><?php echo $fila['definitiva_B3']; ?></td>
            <td><?php echo $fila['definitiva_B4']; ?></td>
            <td><?php 
                $promedio = 0;
                for ($i=1; $i <= 4; $i++) { 
                    $promedio += $fila['definitiva_B' . $i];
                }
                echo $promedio / 4;
            ?></td>
        </tr>

    <?php }    
    mysqli_close($conx);
}    

function mostrarDatosUsuario($conx, $user){
    $sql = 
      "SELECT id_usuario, u.documento, u.nombre_perfil, u.id_rol, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, u.edad, da.correo, da.Telefono, da.sexo 
      FROM usuario u LEFT JOIN datos_adicionales da ON u.id_datos_adicionales = da.id_datos_adicionales WHERE u.nombre_perfil NOT LIKE '$user'#WHERE u.id_rol NOT LIKE 'A'
      UNION SELECT id_usuario, u.documento, u.nombre_perfil, u.id_rol, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, u.edad, da.correo, da.Telefono, da.sexo 
      FROM usuario u right JOIN datos_adicionales da ON u.id_datos_adicionales = da.id_datos_adicionales WHERE u.nombre_perfil NOT LIKE '$user'#WHERE u.id_rol NOT LIKE 'A'
    ";

    if ($result = $conx -> query($sql)) {
        while ($fila = $result -> fetch_row()) {
            echo "<tr>";
                foreach ($fila as $value) {
                    echo "<td>$value</td>";
                } ?>

                <td>
                    <a href="../html/modificarDatosUsuario.php?user=<?php echo $fila[2];?>"><button class="boton">Modificar</button></a>
                </td>
                
                <td> <!-- Activación de Desactivación de cuentas de usuario -->
                    <?php $estado = "SELECT estado FROM usuario WHERE nombre_perfil = '$fila[2]'"; 
                    $rE = $conx -> query($estado) -> fetch_array();
                    ?>
                    <form action="" method="post">
                        <input type="hidden" value="<?php echo $fila[2] ?>" name="user">
                        <input type="hidden" value="<?php echo $rE['estado']; ?>" name="estadoActual">

                        <?php
                          if ($rE['estado'] == 0) {?>
                            <input type="submit" value="Activar" name="active" class = "activar boton"> <?php
                          }else{?>
                            <input type="submit" value="Desactivar" name="active" class="desactivar boton">
                            <?php
                          }
                        ?>
                    </form>

                    <?php 
                        if (isset($_POST['active'])) {

                            $u = $_POST['user'];
                            $eAc = $_POST['estadoActual'];

                            $newE = ($eAc) ? 0 : 1 ;
                                                        
                            $updateE = "UPDATE usuario SET estado = $newE WHERE nombre_perfil = '$u'";

                            if (!$conx -> query($updateE)) {
                                echo "No cambiado";
                            }

                            header("Location: verDatosUsuario.php");
                        }
                    ?>
                </td>

            <?php echo"</tr>";
        }
    }
}

function buscarSiExisteDato($conx, $dato, $tabla, $columna){
    // Se ejecuta una consulta para saber si la asignatua a enviar ya esta creada
    $sql_search = "SELECT $columna FROM $tabla WHERE $columna = '$dato'";
    $resultado = $conx->query($sql_search);
    $resultado = mysqli_num_rows($resultado);
    // si hay un resultado o más quiere decir que ya existe, entoces debuelve false
    return ($resultado >= 1) ? false : true;
}

function mostrarDatos($conx, $column1, $column2, $tabla){

  // Se ejecuta una consulta para saber que datos ya esta creados
  $sql_search = "SELECT $column1, $column2 FROM $tabla";
  $resultado = $conx->query($sql_search);
  
  
  // Se almacena en una variable un dato a medida que itera el bucle
  while($dato = $resultado->fetch_array()){?>
  
  <!-- se muestra en una etiqueta li cada dato -->
  <li>
    <form action="" method="post">
      <input type="hidden" name="id_dato" id="" value="<?php echo $dato[$column1]; ?>">
      <input type="submit" class="loko-dato" value="<?php echo $dato[$column2]; ?>">
    </form>
      
   </li>
  
  <?php }
  }

function detectarRolUsuario($dato)
    {
        switch ($dato) {
            case 'E': return array(
                "rol" => "Estudiante", 
                "icon" => '<i class="fas fa-user-graduate"></i>'); break;

            case 'D': return array(
                "rol" => "Docente", 
                "icon" => "<i class='fas fa-chalkboard-teacher'></i>"); break;

            case 'A': return array(
                "rol" => "Administrador", 
                "icon" => '<i class="fas fa-user-cog"></i>'); break;

    
            default: return array(
                "rol" => "Rol desconocido", 
                "icon" => "!"); break;

        }
    }
?>