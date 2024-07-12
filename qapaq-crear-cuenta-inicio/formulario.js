const isEmpty = (str) => str.trim() === '';
function agregar() {
    var dni = document.getElementById('dni');
    var email = document.getElementById('email');
    var celular = document.getElementById('celular');
    //var terms = document.getElementById('terms');//querySelector('input[name="terms"]:checked');
    
    dniVal = dni.value;
    emailVal = email.value;
    celularVal = celular.value;
    //termsVal = "si"; //aqui deberia de ir el contenido de terms, true es temporal para probar si funciona lo demas
    
    if (isEmpty(dniVal) || isEmpty (emailVal) || isEmpty(celularVal)) { // || isEmpty(termsVal)
        alert('Todos los campos son obligatorios');
        return;
    }

    if (window.XMLHttpRequest) {
        ajax= new XMLHttpRequest();
    } else {
        ajax= new ActiveXObject("Microsoft.XMLHTTP");
    }

    ajax.open("POST", "insertar_ajax.jsp");
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
    ajax.send("dni=" + dniVal + "&email=" + emailVal + "&celular=" + celularVal); //+ "&terms=" + termsVal
    
};
function asignar() {
    btnAgregar = document.getElementById('btnAgregar');
    btnAgregar.addEventListener("click", agregar);
}
window.addEventListener("load", asignar);