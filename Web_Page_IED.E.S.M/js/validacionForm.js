const mensaje = document.getElementById('mensaje');
const userName = document.getElementById('userName');
const boton = document.getElementById('actualizar');
userName.addEventListener("input", repetido);

function repetido(){
    let coincide = false;
    usuarios.forEach(dato => {
        if (userName.value === dato){
            coincide = true
        }
    });
    

    let string = userName.value;

    if (coincide) {

        aspectosCursor(
            true,
            "Nombre ya existe",
            "#c30202",
            "not-allowed"
        );

    }else{

        aspectosCursor(
            false,
            "Aceptado",
            "#059409",
            "pointer"
        );
        
        if (string.length < 4) {

            aspectosCursor(
                true,
                "Demaciado corto",
                "#c30202",
                "not-allowed"
            );


        }if(string.length > 30){

            aspectosCursor(
                true,
                "Demaciado largo",
                "#c30202",
                "not-allowed"
            );
        }
    }
}

function aspectosCursor(active, message, color, typeCursor){
    boton.disabled = active;
    mensaje.innerHTML = message;
    mensaje.style.color = color;
    boton.style.cursor = typeCursor;
}
