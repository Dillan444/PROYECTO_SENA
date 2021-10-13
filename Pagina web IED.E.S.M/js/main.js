
  /*FORMULARIOS DE USUARIOS AYAX
    Muestra un solo un formulario cuando hace click en el icono del rol correspondiente
    quitando y agregando clases a un contenedo */
$(document).ready(function(){
    $('ul.tabs li a:first').addClass('active');
    $('.secciones article').hide();
    $('.secciones article:first').show();
  
    $('ul.tabs li a').click(function(){
      $('ul.tabs li a').removeClass('active');
      $(this).addClass('active');
      $('.secciones article').hide();
  
      var activeTab = $(this).attr('href');
      $(activeTab).show();
      return false;
    });
  });
  