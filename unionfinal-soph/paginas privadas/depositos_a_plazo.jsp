<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Depósitos a Plazo Fijo</title>
    <style>body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
} .nameDate{
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


form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}
.flex-container {
  display: flex;
  align-items: center;
  padding:20px;
}

.flex-container label {
  margin-right: 30px;
}

.flex-container select {
  font-size: 13px;
  flex: 1;
}
select {
     display: inline-block;
    padding: 8px;
    font-size: 16px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.no-info {
    color: #ff6f61;
    font-weight: bold;
    text-align: center;
}

.btn {
    background-color: #ff6f61;
    color: white;
    border: none;
    padding: 10px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    align-self: center;
}

.btn:hover {
    background-color: #ff3b2e;
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
        <p>Compra: 3.7340 - Venta: 3.7760</p>
    </div>
</div>
<div class="line"></div>
    <main>
        <h2 style="font-size:14px;  color: #ff6f61;">Depositos a Plazo Fijo</h2>
        <div class="line"></div>
        <form action="procesar_deposito.jsp" method="post">
        <div class="flex-container">
            <label for="plazoFijo"><br>Deposito a Plazo Fijo:</label>
            <select id="plazoFijo" name="plazoFijo">
                <option value="" disabled selected>Seleccione una opcion</option>
                <option value="opcion1">-</option>
                <option value="opcion2">-</option>
            </select>
          </div>
            <p class="no-info">No existe informacion disponible</p>
            <button type="submit" class="btn">Imprimir</button>
        </form>

    </main>
</body>
</html>
