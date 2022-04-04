<?php include('conexion.php');

if (isset($_POST['crear'])) {

    $datosRegistro = array(

        // Datos de la tabla -> usuario
        "rol_in" => $_POST['rol_in'],
        "tipo_documento" => $_POST['tipo_documento'],
        "documento" => ($_POST['documento'])?$_POST['documento']:"",
        "fst_name" => $_POST['P_nombre'],
        "scd_name" => $_POST['S_nombre'],
        "fst_lastName" => $_POST['P_apellido'],
        "scd_lastName" => $_POST['S_apellido'],
        "age" => $_POST['edad'],

        // Datos de la tabla -> Datos Adicionales
        "number" => $_POST['telefono'],
        "email" => $_POST['correo'],
        "sex" => $_POST['sexo'],

        // Datos de la tabla -> integrantescurso
        "curso_E" => $_POST['curso_E'],
        "jornada" => $_POST['jornada'],
    );

    crearUsuarios($conx, $datosRegistro);
}

/*CREANDO NUEVOS USUARIOS EN LA BASE DE DATOS
        En esta función se crea un usuario llenado dos tablas que contienen sus datos
        Utiliza funciones anidadas para generar dos datos la contraseña y el nombre de usuario*/
function crearUsuarios($conx, $dR){
    $sqlInsert = "INSERT INTO  datos_adicionales(id_datos_adicionales, correo, Telefono, sexo) 
    VALUES (NULL, '$dR[email]', '$dR[number]','$dR[sex]')";

    if ($conx->query($sqlInsert)) {

        $sqlConsulta = "SELECT id_datos_adicionales FROM datos_adicionales WHERE correo =  '$dR[email]'";
        $resultado = mysqli_query($conx, $sqlConsulta);

        $id = $resultado->fetch_array();

        $userName = generarUserName($conx, $dR);
        $password = generarPassword();

        if (insertarTablaUsuario($conx, $userName, $dR, $password, $id)) {
 
            if(añadirUsuarioTablaRolCorrespondiente($conx, $userName, $dR['rol_in']) && $dR['rol_in'] == "E" && $dR['curso_E'] != "otro"){ #verificar correcta ejecución y que el rol se de E(estudiante)

                if(integrarEstudianteAlCurso($conx, $userName, $dR['curso_E'], $dR['jornada'])){

                    if(asignarEstudianteIntegranteCursoPlantillaDefinitivas($conx, $userName, $dR['curso_E'])){

                        header("Location: ../html/create-users.php?mensaje='y'"); 
                    }                
                }
            }else{
                header("Location: ../html/create-users.php?mensaje='y'");
            }
        }
    }else{
        $mensaje =  mysqli_error($conx);
        header("Location: ../html/create-users.php?mensaje='$mensaje'");
    }
}

/*CREACIÓN DE UNA CONTRASEÑA ALEATORIA
        En una variable se colocan los caracteres que podra contener la contraseña
        Con un bucle for se establece cuantos carateres va a tener por primera vez
        El bucle escoge caracteres aleatorios por iteración y los concatena con los anteriores
        Finalmente retorna una contraseña
     */
function generarPassword(){
    $caracteres = "abcdefghijklmnñopqrstuvwxyz1234567890";
    $password = '';

    for ($i = 0; $i < 15; $i++) {

        $password .= $caracteres[rand(0, strlen($caracteres) - 1)];
    }

    return $password;
}

/*CREACIÓN DE UN NOMBRE DE USUARIO
        Se genera un user name con alguno de sus nombre más algunos número aleatorio
        Se almacenan sus nombres en un arreglo para escoger uno al azar
        Con un bucle se le agrega de uno a cutro número para generar un user name
        Y finalmente se retorna el string*/
function generarUserName($conx, $dR){

    $u = array(
        $dR['fst_name'], 
        $dR['scd_name'], 
        $dR['fst_lastName'], 
        $dR['scd_lastName']
    );

    $caracteres = '1234567890';
    
    do {
        $userName = $u[rand(0, strlen('$u') - 1)];
    } while (!$userName);

    for ($i = 0; $i < rand(1, 4); $i++) {
        $userName .= $caracteres[rand(0, strlen($caracteres) - 1)];
    }

    # Verificar si nombre_perfil ya existe
    $datos = false;

    $sqlConsulta = "SELECT * FROM usuario WHERE nombre_perfil = '$userName'";
    if ($resultado = $conx -> query($sqlConsulta)) {
        $datos = mysqli_num_rows($resultado);
    }

    if (!$datos) {
        return $userName;
    }
    generarUserName($conx, $dR);
}

/*INSERCIÓN EN LA TABLA USUARIO
        Se insertan los datos faltante en la tabla usuario con un insert into
        Se muestra un alert si se creo con exito o vicebersa*/
function insertarTablaUsuario($conx, $userName, $dR, $password, $id){
    $sqlInsert = "INSERT INTO usuario(id_usuario, nombre_perfil ,id_rol, documento, tipo_documento, p_nombre, s_nombre, p_apellido, s_apellido ,edad, contraseña, id_datos_adicionales)
    VALUES (NULL, '$userName', '$dR[rol_in]', $dR[documento], '$dR[tipo_documento]', '$dR[fst_name]', '$dR[scd_name]', '$dR[fst_lastName]', '$dR[scd_lastName]', $dR[age], '$password', $id[id_datos_adicionales])";

    if ($conx->query($sqlInsert)) {
    } else {
        echo "Error: " . mysqli_error($conx);
        return false;
    }

    return true;
}

/*INSERTAR USUARIO A LA TABLA DOCENTE O ESTUDIANTE
 Dependiendo del rol que se cree en el sistema, este lo asignara a la tabla "DOCENTE" o "ESTUDIANTE
 -si no funciona mostrara un error y si pasa retornará verdadero"*/
function añadirUsuarioTablaRolCorrespondiente($conx, $userName, $rol){
    $sql = "SELECT id_Usuario FROM usuario WHERE nombre_perfil = '$userName'";

    $rolResult = ($rol === 'D') ? $rol = 'docente' : $rol = 'estudiante';

    $id = $conx->query($sql)->fetch_array();

    $sql = "INSERT INTO $rolResult (id_$rolResult, id_Usuario) VALUES (null, '$id[id_Usuario]')";

    if ($conx->query($sql)) {
        return true;
    } else {
        echo "Error: " . mysqli_error($conx);
    }
}
/*INSERTAR USUARIO ESTUDAINTE A LA TABLA INTEGRANTESCURSO */
function integrarEstudianteAlCurso($conx, $userName, $cursoN, $jornada){ 
    $id_Estudiante = $conx -> query( #consultar el id del estudiante anteriormente creado
     "SELECT id_estudiante FROM estudiante e INNER JOIN usuario u 
     ON e.id_Usuario = u.id_Usuario AND u.nombre_perfil = '$userName'"
    ) -> fetch_array();

    $id_curso = $conx -> query(
     "SELECT id_curso FROM curso WHERE curso = $cursoN"
    ) -> fetch_array();


    $sqlIntegrantesCurso = #código para insertar en la tabla integrantescurso al usuario estudiante
     "INSERT INTO integrantescurso (id_estudiante, id_curso, año, jornada) 
     VALUES ('$id_Estudiante[id_estudiante]', '$id_curso[id_curso]', now(), '$jornada')
    ";

    if($conx -> query($sqlIntegrantesCurso)){
        return true;
    }else{
        echo "Ha ocurrido un error al integrar al estudiante a su curso";
        echo mysqli_error($conx);
    }
}

/*ASIGNAR AL ESTUDIANTE DE UN CURSO UNA PLANTILLA PARA SUS CALIFICACIONES */
function asignarEstudianteIntegranteCursoPlantillaDefinitivas($conx, $userName, $cursoN){

    $id_Estudiante = $conx -> query( #consultar el id del estudiante anteriormente creado
     "SELECT id_estudiante FROM estudiante e INNER JOIN usuario u 
     ON e.id_Usuario = u.id_Usuario AND u.nombre_perfil = '$userName'"
    ) -> fetch_array();

    $id_integranteCurso = $conx -> query(  #consulta del id del la tabla integrantescurso insertado anteriormente
     "SELECT id_integrantecurso 
     FROM estudiante e INNER JOIN usuario u ON e.id_Usuario = u.id_Usuario AND u.nombre_perfil = '$userName'
     INNER JOIN integrantescurso i ON i.id_estudiante = e.id_estudiante AND e.id_estudiante = '$id_Estudiante[id_estudiante]'
    ") -> fetch_array();

    include "./datos.php";
    $grado = buscarGrado($cursoN); #llamada a una función para convertir curso en grado Ej. 601 -> sexto, 703 -> septimo
   
    $materias = $conx -> query(  #consulta de las materias de un grado Ej. sexto = m1, m2, m3
     "SELECT m.materia FROM materiasdelgrado m INNER JOIN asignatura a 
     ON a.id_asignatura = m.materia AND m.grado = '$grado'"
    );

    #añadir en una variable todos los datos que se van a insertar posteriormente (materias que vera el estudiante en el curso) 
    while ($materia = $materias -> fetch_array()) {
       
       $sqlTablaDefinitivas = "INSERT INTO definitivas (id_asignatura, estudiante) 
        VALUES ($materia[materia], $id_integranteCurso[id_integrantecurso])"
       ; #sentencia para insertar datos a la tabla
  
        if(!$conx -> query($sqlTablaDefinitivas)){ #verificación de ejecución de la sentencia
           
           echo "Ha ocurrido un error al vincula al integrante del curso a la sus definitivas";
           echo mysqli_error($conx);
           echo $sqlTablaDefinitivas;
           break;
        }
    }
    
    return true;
}

function cargarNuevoDato($dato, $conx, $tabla, $columna){

    $sqlInsert = "INSERT INTO $tabla ($columna) VALUES ('$dato')";

    if($conx->query($sqlInsert)){
        return "Insertado exitosamente";
    }else{
        return mysqli_error($conx);
    }
}