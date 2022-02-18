$(document).ready(desplegar);

let i = 1;

function desplegar(){

    $('.menu--icon').click(function(){

        if(i){
            $('.opciones').animate({ top:'60px'});
            i = 0;

        }else{
            $('.opciones').animate({ top: '-100vh'});
            i = 1;

        }

    });
};

