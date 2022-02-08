$(document).ready(function(){
    $('ul.tabs li a:first').addClass('active');
    $('.seccion-login article').hide();
    $('.seccion-login article:first').show();
  
    $('ul.tabs li a').click(function(){
      $('ul.tabs li a').removeClass('active');
      $(this).addClass('active');
      $('.seccion-login article').hide();
  
      var activeTab = $(this).attr('href');
      $(activeTab).show();
      return false;
    });
  });
  