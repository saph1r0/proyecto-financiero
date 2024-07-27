<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transferencia interna entre cuentas</title>
    <style>
       
        .h1 {
            margin: 0;
            font-size: 1.5em;
             text-align: center;
            margin-bottom: 20px
        }
        .p {
            margin: 0;
             text-align: center;
            margin-bottom: 20px
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        .form-actions {
            text-align: right;
        }
        
        .notification {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ddd;
        }
        .btn-print {
    background-color: #f02d3a;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin: 20px 0;
    font-size: 16px;
}

.btn-print:hover {
    background-color: #d12832;
}

    </style>
</head>
<body>
   
        <div class="content">
            <h1>Movimientos</h1>
            <p>Compra venta de divisas</p>
            <p>Compra: 3.7340 - Venta: 3.7760</p>
            

        <form>
            
            <div class="form-group">
                <label for="cuenta-origen">Cuenta origen:</label>
                <select id="cuenta-origen" name="cuenta-origen">
                    <option value="1326500061355">AHORROS SOLES DIGITAL 2147483647   (S/)</option>
                </select>
            </div>
            
        </form>
            <h1>No hay ningun movimiento</h1>
            <button class="btn-print">Imprimir</button> 
        </div>
    
</body>
</html>

