<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<head>
    <meta charset="UTF-8">
    <title>Directas</title>
    <style>
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
        /*input[type="text"], input[type="number"], select {*/
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
</head>
<body>
<div class="nameDate">
    <div>
        <h4>KATHERIN MILAGROS ZENAYUCA CORIMANYA</h4>
    </div>
    <div>
        <p>s&aacute;bado, 20 de julio de 2024 | &Uacute;ltimo Acceso: 10/07/2024 08:29 p.m. | <a href="#">Cerrar Sesi&oacute;n</a></p>
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
    <img src="/paginas privadas/images_priv/money.jpeg" alt="money">
    <p>Transferencia interbancaria</p>
    </div>
</div>
<hr>
<div>
    <p>Ingresa los datos para efectuar la transferencia.</p>
    <p>Recuerda verificar los mismos antes de presionar el botón "Siguiente".</p>
</div>
<h3>Transferencia interbancaria</h3>
<hr>

<form>
    <table>
        <tr>
            <td>
            <label for="cuenta-origen">Cuenta origen:</label>
                <select class ="ingreso" id="cuenta-origen" name="cuenta-origen">
                    <option value="1326500061355">AHORROS SOLES DIGITAL 1326500061355 (S/)</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="cuenta-destino">Cuenta CCI Destino:</label>
                <input class ="ingreso" type="text" id="cuenta-destino" name="cuenta-destino">
                <input class ="ingreso" type="text" id="cuenta-destino2" name="cuenta-destino2">
            </td>
        </tr>
        <tr>
            <td>
                <label for="monto">Monto:</label>
                <input class ="ingreso" type="number" id="monto" name="monto" min="0" step="0.01">
                <select class ="ingreso" id="soles" name="soles">
                    <option value="Soles">Soles</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="micuenta">Es mi cuenta </label>
                <input type="checkbox" id="micuenta" name="micuenta">
            </td>
        </tr>
        <tr>
            <td>
                <input class ="ingreso" type="text" id="nombre" name="nombre" placeholder="Nombre referencia">
                <input class ="ingreso" type="text" id="concepto" name="concepto" placeholder="Concepto">
            </td>
        </tr>
        <tr>
            <td>
                <button type="button">Condiciones</button>
            </td>
        </tr>
    </table>
    <br>
    <div class="form-actions">
                <button type="button" id="btnAgregar">Siguiente</button>
                <button type="button">Cancelar</button>
            </div>
</form>
<script>
        document.getElementById('cuenta-propia').addEventListener('change', function() {
            document.getElementById('cuenta-propia-select').disabled = !this.checked;
            document.getElementById('cuenta-terceros-input').disabled = this.checked;
        });

        document.getElementById('cuenta-terceros').addEventListener('change', function() {
            document.getElementById('cuenta-terceros-input').disabled = !this.checked;
            document.getElementById('cuenta-propia-select').disabled = this.checked;
        });
</script>
</body>