<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAPAQ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            display: flex;
            height: 70px;
            background-color: #fcec04;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        .logo {
            display: flex;
            align-items: center;
            background-image: url("images_priv/logo.png")
        }

        .logo img {
            height: 50px;
              background-image: url("images_priv/logo.png");
        }

        .container {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        .sidebar {
            width: 300px;
            background-color: #f4f4f4;
            overflow-y: auto;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            box-sizing: border-box;
            height: 100%;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            padding: 10px;
            cursor: pointer;
        }

        .sidebar ul li:hover {
            background-color: #ddd;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
            box-sizing: border-box;
            height: 100%;
        }

        /* Estilos adicionales para asegurar que el contenido ocupe todo el espacio */
        .full-width {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
        }

        .full-width > * {
            flex: 1;
        }
    </style>
</head>
<body>
    <header>
        <a href="#" class="logo">
          
        </a>
    </header>
    <div class="container">
        <div class="sidebar">
            <ul>
              
                <li>Posicion Consolidada</li>
                <li>CUENTAS</li>
                <li>Movimientos</li>
                <li>Movimientos por Fecha</li>
                <li>Cierre de Cuenta</li>
                <li onclick="loadPage('directa.html')">Transferencias Directas</li>
                <li onclick="loadPage('interbancaria.jsp')">Transferencias Interbancarias</li>
                <li>Historicos de Transferencias</li>
                <li>Compartir cuenta</li>
                <li>Crear una Cuenta Digital</li>              
                <li>Depositos a plazo</li>
                <li>Configuracion</li>
                <li>Bloqueo</li>
                <li onclick="loadPage('passw_change.jsp')">Cambio Clave de Ingreso</li>
                <li>Registro de pregunta</li>
                <li>Contactanos</li>
                <li>SALIR</li>
                <li>Salir</li>
            </ul>
        </div>
        <div class="content" id="main-content">
        </div>
    </div>
    <script>
        function loadPage(page) {
            fetch(page)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('main-content').innerHTML = data;
                })
                .catch(error => console.error('Error loading page:', error));
        }

        // Cargar una página por defecto al iniciar
        window.onload = function() {
            loadPage('directa.html');
        };
    </script>
</body>
</html>
