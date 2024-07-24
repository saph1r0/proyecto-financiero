//const isEmpty = (str) => str.trim() === '';
function agregar() {
    /*
    var monto = document.getElementById('monto');
    var origen = document.getElementById('cuenta-origen');
    var propia = document.getElementById('cuenta-propia');
    var terceros = document.getElementById('cuenta-terceros-input');
    var concepto = document.getElementById('concepto');
    var notif = document.getElementById('mail-terceros');
    */
    //var terms = document.getElementById('terms');//querySelector('input[name="terms"]:checked');
    
    montoVal = 12345678911;//monto.value;
    origenVal = 1234567891123;//origen.value;
    propiaVal = 1234567891123;//propia.value;
    tercerosVal = 1234567891123;//terceros.value;
    conceptoVal = "prueba";//concepto.value;
    notifVal = "prueba@gmail.com";//notif.value;;
    //termsVal = "si"; //aqui deberia de ir el contenido de terms, true es temporal para probar si funciona lo demas
    /*
    if (isEmpty(montoVal) || isEmpty (origenVal) || isEmpty(propiaVal)) { // || isEmpty(termsVal)
        alert('Todos los campos son obligatorios');
        return;
    }
*/
    if (window.XMLHttpRequest) {
        ajax= new XMLHttpRequest();
    } else {
        ajax= new ActiveXObject("Microsoft.XMLHTTP");
    }

    ajax.open("POST", "insertar_ajax.jsp");
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
    ajax.send("monto=" + montoVal + "&origen=" + origenVal + "&propia=" + propiaVal + "&terceros="+tercerosVal+"&concepto="+conceptoVal+"&notif="+notifVal);
    
};
function asignar() {
    btnAgregar = document.getElementById('btnAgregar');
    btnAgregar.addEventListener("click", agregar);
}
window.addEventListener("load", asignar);