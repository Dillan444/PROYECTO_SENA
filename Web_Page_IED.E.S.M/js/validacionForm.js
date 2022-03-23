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
        mensaje.innerHTML = "Nombre ya existe";
        mensaje.style.color = "#c30202";
        boton.disabled = true;
        boton.style.cursor = "none";
    }else{
        mensaje.innerHTML = "Aceptado";
        mensaje.style.color = "#059409";
        boton.disabled = false;
        boton.style.cursor = "pointer";
        
        if (string.length < 4) {
            boton.disabled = true;
            mensaje.innerHTML = "Demaciado corto";
            mensaje.style.color = "#c30202";
            boton.style.cursor = "none";
        }
    }
}
