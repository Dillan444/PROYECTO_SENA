$(document).ready(main);

var contador = 1;

function main(){
    $('.menu-bar').click(function(){
          //$('nav').toggle();

          if(contador == 1){
              $('nav').animate({
                right: '0'
              });
              contador = 0;
          }else{
              contador = 1;
              $('nav').animate({
                right: '-100%'
              });
          }
    });
};


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
