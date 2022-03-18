<?php include('../PHP/datos.php'); 
    
    session_start();

    $usuario = $_SESSION["usuario"];

    $rol = array('Estudiante', 'n_matricula');

    if (!isset($usuario)) {
        header("Location: ./login.html");
    }

    $consulta = "SELECT c.curso, a.nombre_asignatura, u.p_nombre, u.s_nombre, u.p_apellido, u.s_apellido, d.definitiva_B1, d.definitiva_B2, d.definitiva_B3, d.definitiva_B4, i.año 
        FROM asignatura a INNER JOIN definitivas d ON a.id_asignatura = d.id_asignatura 
        INNER JOIN integrantescurso i ON d.estudiante = i.id_integrantecurso AND i.año = now() 
        INNER JOIN curso c ON i.id_curso = c.id_curso 
        INNER JOIN estudiante e ON e.id_estudiante = i.id_estudiante
        INNER JOIN usuario u ON u.id_Usuario = e.id_Usuario AND u.nombre_perfil = '$usuario'";

    $resultado = $conx -> query($consulta);
    $datos = $conx -> query($consulta) -> fetch_array();

ob_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/generalStyles.css">
    <link rel="stylesheet" href="../css/pdf.css">
    <title>Boletín PDF</title>
</head>

<body>
    <table border="3">
        <tr>
            <th colspan="3" width="385">
                Institución Educativa Departamental Enrique Santos Montejo</th>
            <th rowspan="3" width="120">
                <img src="http://<?php echo $_SERVER["HTTP_HOST"]; ?>/PROYECTO_SENA/Web_Page_IED.E.S.M/img/Logo2.jpg" alt="Escudo del Colegio" width="100">
            </th>
            </th>
        </tr>
        <tr>
            <td>
                <span>Periodo:</span>
                <p>4</p>
            </td>
            <td>
                <span>Jornada:</span>
                <p>Mañana</p>
            </td>
            <td>
                <span>Grupo:</span>
                <p><?php echo $datos['curso']?></p>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <span>Estudiante:</span>
                <?php echo "<p> " . buscarNombreUsuario($usuario, $conx, $rol[0]) . " </p>";?>
                
            </td>
            <td>
                <span>Año:</span>
                <p><?php echo $datos['año']?></p>
            </td>
        </tr>
        
    </table>

    <table border="2">
        <thead >
            <tr>
                <th rowspan="2" width="300">Materia</th>
                <th colspan="4" width="150">Periodo</th>
                <th rowspan="2">Definitiva</th>
            </tr>
            <tr>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
            </tr>
        </thead>
        <tbody><?php
        

    while ($fila = mysqli_fetch_array($resultado)){?>
        
        <tr>
            <td><b><?php echo $fila['nombre_asignatura']; ?></b></td>
            <td><?php echo $fila['definitiva_B1']; ?></td>
            <td><?php echo $fila['definitiva_B2']; ?></td>
            <td><?php echo $fila['definitiva_B3']; ?></td>
            <td><?php echo $fila['definitiva_B4']; ?></td>
            <td><?php 
                $promedio = 0;
                for ($i=1; $i <= 4; $i++) { 
                    $promedio += $fila['definitiva_B' . $i];
                }
                echo $promedio / 4;?>
            </td>
        </tr>
        <tr><td colspan="6"> <sub>Comentario.</sub></td></tr>
<?php }?>
        </tbody>
    </table>
</body>

</html>

<?php
    $html = ob_get_clean();
    // echo $html;

    require_once '../PHP/libreria/dompdf/autoload.inc.php';

    use Dompdf\Dompdf;

    $dompdf = new Dompdf();

    $options = $dompdf->getOptions();
    $options->set(array('isRemoteEnabled' => true));
    $dompdf->setOptions($options);

    $dompdf->loadHtml($html);

    $dompdf->setPaper('letter');
    // $dompdf -> setPaper('A4', 'lansdscape');

    $dompdf->render();

    $dompdf->stream("archivo_.pdf", array("Attachment" => false));

?>