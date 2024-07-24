<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAPAQ</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <a href ="#" class="logo">
            <img src="imagenes/logo.png" alt="Logo QAPAQ">
        </a>
    </header>
    <div class="container">
        <div class="sidebar">
            <ul>
                <li>POSICION CONSOLIDADA</li>
                <li>Posicion Consolidada</li>
                <li>CUENTAS</li>
                <li>Movimientos</li>
                <li>Movimientos por Fecha</li>
                <li>Cierre de Cuenta</li>
                <li onclick="loadContent('directa.jsp')">Transferencias Directas</li>
                <li onclick="loadContent('interbancaria.jsp')">Transferencias Interbancarias</li>
                <li>Historicos de Transferencias</li>
                <li>Compartir cuenta</li>
                <li>Crear una Cuenta Digital</li>
                <li>DEPÓSITOS A PLAZO</li>
                <li>Depositos a plazo</li>
                <li>TARJETAS</li>
                <li>Configuracion</li>
                <li>Bloqueo</li>
                <li>OPCIONES DE ACCESO</li>
                <li>Cambio Clave de Ingreso</li>
                <li>Registro de pregunta</li>
                <li>CONTACTANOS</li>
                <li>Contactanos</li>
                <li>SALIR</li>
                <li>Salir</li>
            </ul>
        </div>
        <div class="content" id="content">
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
