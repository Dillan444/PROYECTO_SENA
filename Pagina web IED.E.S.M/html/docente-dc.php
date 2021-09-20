<?php include('../PHP/datos.php'); ?>
<?php include('../PHP/login_registro.php'); ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/96a22afc86.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../IMG/icono.ico">
    <link rel="stylesheet" href="../css/styles_2.css">
    <link rel="stylesheet" href="../css/table.css   ">
    <title>Document</title>
</head>
<a href=""></a>
<body>
    
    <div class="contenedor">
        <header>
            <nav class="list_header"> <!-- NAVEGACIÓN -->
                <ul>
                    <li><a href="#">ITEM </a> </li>
                    <li>
                        <a href="../index.html"> 
                            
                        <i class="fas fa-user"></i></a> 
                    </li>
                </ul>
            </nav>

            <div class="SIGC">
                <div class="logo">
                    <img src="../IMG/Logo.png" alt="" width="80" height="130">
                </div>
                <div class="titulo-usuario">
                    <h1>SIGC <br> Docente</h1>
                </div>
                
            </div>
            
        </header> <hr>
        <!-- <i class="far fa-edit"></i> -->
        <!-- <i class="far fa-eye"></i> -->

        <main class="cont_funciones">
            
            <table border="7">
                <thead>
                    <th>N_Curso</th>
                    <th>GradoGrado</th>
                    <th>N_Estudiantes</th>
                    <th>Calificar</th>
                    <th>Registros</th>
                </thead>
                <tbody>
                    <?= cargarTabla($conx); ?>
                </tbody>
            </table>
            

        </main>
    </div>
</body>
</html>