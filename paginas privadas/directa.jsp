<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAPAQ</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%
        String usuarioIdStr = "1";
    %>
    <script>
        function id(){
            var usuarioIdStr = "<%= usuarioIdStr %>";
            console.log("usuarioIdStr:", usuarioIdStr);
            return usuarioIdStr;
        }
        document.addEventListener("DOMContentLoaded", function() {
        var optionValue = id();
        
        var selectElement = document.getElementById("cuentaorigen");
        var cuentaPropiaSelect = document.getElementById("cuentapropiaselect");
        var optionElement = selectElement.querySelector("option");
        var optionElement2 = cuentaPropiaSelect.querySelector("option");


        optionElement.value = optionValue;
        optionElement2.value = optionValue;
    });
                
        function cambios() {
            console.log("cambios() function called");
            var cuentaPropiaRadio = document.getElementById("cuentapropia");
            var cuentaTercerosRadio = document.getElementById("cuentaterceros");
            var cuentaTercerosInput = document.getElementById("cuentatercerosinput");
            var mailTerceros = document.getElementById("mailterceros");
            

            console.log("cuentaPropiaRadio.checked:", cuentaPropiaRadio.checked);
            console.log("cuentaTercerosRadio.checked:", cuentaTercerosRadio.checked);

            if (cuentaPropiaRadio.checked) {
                cuentaTercerosInput.value = " ";
                mailTerceros.value = " ";
                
            } else if (cuentaTercerosRadio.checked) {
                cuentaPropiaSelect.value = " ";
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            console.log("DOMContentLoaded event");
            var cuentaPropiaRadio = document.getElementById("cuentapropia");
            var cuentaTercerosRadio = document.getElementById("cuentaterceros");

            // Agrega el evento de cambio a ambos radios
            cuentaPropiaRadio.addEventListener("change", cambios);
            cuentaTercerosRadio.addEventListener("change", cambios);

            // Llama a la función al cargar la página para establecer el estado inicial
            cambios();
        });
    </script>
</head>
<body>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .nameDate{
            display: flex;
            height: 50px;
            justify-content: space-between;
            align-items: center;
        }
        .titulo{
            display:flex;
            flex-direction: column;
            align-items: center;
            padding: 3px;
        }
        .line{
            display:flex;
            background-color: #fcec04;
            height: 7px;
        }
        .titulo2{
            display: flex;
            height: 38px;
            align-items: center;
        }
        .money{
            display: flex;
            align-items: center;
        }
        .money img{
            height: 20px;
        }
        .money p{
            color: red;
        }
        table{
            border-radius: 5px;
            width: 100%;
            border-collapse: collapse;
        }
        td{
            display: flex;
            border: 1px solid gray;
            padding: 10px;
        }
        td label{
            margin-right: 50px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .ingreso{
            width: 25%;
            padding: 8px;
            border-radius: 5px;
        }
        .ingreso2 {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        .form-actions {
            text-align: right;
        }
        button {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
        .notificacion{
            flex-direction: column;
        }
    </style>
    <div class="nameDate">
        <div>
            <div><b>
                <%
                    String nombre = (String) session.getAttribute("primer_nombre");
                    String nombre2 = (String) session.getAttribute("segundo_nombre");
                    String apellidoP = (String) session.getAttribute("apellido_paterno");
                    String apellidoM = (String) session.getAttribute("apellido_materno");

                    if (nombre != null) {
                        out.println(nombre +" "+ nombre2+" "+ apellidoP +" "+ apellidoM);
                        //String nombreCompleto = nombre +" "+ nombre2+" "+ apellidoP +" "+ apellidoM;
                    } else {
                        out.println(" ");
                    }
                %>
                </b>
            </div>
        </div>
        <div>
            <p>s&aacute;bado, 26 de julio de 2024 | &Uacute;ltimo Acceso: 25/07/2024 11:29 p.m. | <a href="#">Cerrar Sesi&oacute;n</a></p>
        </div>
    </div>
    <div class="titulo">
        <div>
            <p>Compra venta de divisas</p>
        </div>
        <div>
            <p>Compra: 3.7340 - Venta: 3.7760</p>
        </div>
    </div>
    <div class="line"></div>
    <div class="titulo2">
        <div class="money">
            <img src="images_priv/money.jpeg" alt="money">
            <p>Transferencia interna entre cuentas</p>
        </div>
    </div>
    <div class="line"></div>
    <div>
        <p>Ingresa los datos para efectuar la transferencia.</p>
        <p>Recuerda verificar los mismos antes de presionar el botón "Siguiente".</p>
    </div>
    <h3>Transferencia interna electrónica</h3>
    <hr>

    <form id="directaForm" action="form_directa.jsp" method="post">
        <table>
            <tr>
                <td>
                    <label for="monto">Monto:</label>
                    <input class="ingreso" type="number" id="monto" name="monto" min="0" step="0.01">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="cuenta-origen">Cuenta origen:</label>
                    <select class="ingreso" id="cuentaorigen" name="cuentaorigen">
                        <option  value="1326500061355">AHORROS SOLES DIGITAL 1326500061355 (S/)</option>
                    </select>
                </td>
            </tr>
        </table>
        <h3>Cuenta Destino</h3>
        <table>
            <tr>
                <td>
                    <label for="cuenta-propia">Cuenta propia: </label>
                    <input type="radio" id="cuentapropia" name="cuenta-destino" value="propia">
                    <select class="ingreso" id="cuentapropiaselect" name="cuentapropiaselect">
                        <option  value="1326500061355">AHORROS SOLES DIGITAL 1326500061355 (S/)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="cuenta-terceros">Cuenta terceros: </label>
                    <input type="radio" id="cuentaterceros" name="cuenta-destino" value="terceros">
                    <input class="ingreso2" type="text" id="cuentatercerosinput" name="cuentatercerosinput">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="concepto">Concepto:</label>
                    <input class="ingreso2" type="text" id="concepto" name="concepto">
                </td>
            </tr>
            <tr>
                <td class="notificacion">
                    <h3>Notificación de transferencia por e-mail</h3>
                    <p>Puedes enviar una notificación por correo electrónico al beneficiario de la transferencia a realizar, ingresa la cuenta de correo a la que deseas enviar la notificación. No es obligatorio para realizar la transferencia.</p>
                    <label for="mail-terceros">Mail terceros: </label>
                    <input class="ingreso" type="text" id="mailterceros" name="mailterceros">
                </td>
            </tr>
        </table>
        <br>
        <div class="form-actions">
            <button type="submit" id="btnAgregar">Siguiente</button>
            <button type="button" onclick="loadPage('menupriv.jsp')">Cancelar</button>
        </div>
    </form>
    
    <script>
    $("#directaForm").on("submit", function(event) {
        event.preventDefault();       
            var formData = {
                monto: $("#monto").val(),
                cuentaorigen: $("#cuentaorigen").val(),
                cuentapropiaselect: $("#cuentapropiaselect").val(),
                cuentatercerosinput: $("#cuentatercerosinput").val(),
                concepto: $("#concepto").val(),
                mailterceros: $("#mailterceros").val()
            };
            $.ajax({
            type: "POST",
            url: "form_directa.jsp",
            data: formData,
            dataType: "json",
            success: function(response) {
                alert(response.message);
            },
            error: function(xhr, status, error) {
                console.error(xhr);
                alert("Error en el servidor: " + xhr.statusText);
            }
        }); 
        }
    });
    </script>
</body>
</html>
