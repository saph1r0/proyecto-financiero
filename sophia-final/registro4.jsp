<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LLene datos</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    background-image: url("images/ingdata.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    background-attachment: fixed; 
    background-position: center; 
    margin: 0;
    padding: 0;
}

.container {
    position: absolute;
    top: 120px;
    overflow-y: auto;
    max-height: 100vh;
    width: 40%;
    margin: 20px;
    padding: 20px;
    display:block;
    background-color: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    transform: translateX(90%)

}

.form-container {
    padding: 20px;
}

form {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

form h2 {
    grid-column: span 2;
    text-align: center;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input, select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="text"], select {
    font-size: 16px;
}

    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
               <form action="procesar_r4.jsp" method="post">
                    <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
          
                <h2>Cuéntanos un poco más de ti</h2>
                <label for="primer-nombre">PRIMER NOMBRE</label>
                <input type="text" id="primer-nombre" name="primer-nombre">

                <label for="segundo-nombre">SEGUNDO NOMBRE</label>
                <input type="text" id="segundo-nombre" name="segundo-nombre">

                <label for="apellido-paterno">APELLIDO PATERNO</label>
                <input type="text" id="apellido-paterno" name="apellido-paterno">

                <label for="apellido-materno">APELLIDO MATERNO</label>
                <input type="text" id="apellido-materno" name="apellido-materno">

                <label for="genero">Género:</label>
                
                <select id="genero" name="genero">
                    <option value="Femenino">- Femenino -</option>
                    <option value="Masculino">- Masculino-</option>
                    
                </select>

                <label for="estado-civil">Estado Civil:</label>
                
                <select id="estado-civil" name="estado-civil">
                    <option value="Soltero">- Soltero -</option>
                    <option value="Casado">- Casado-</option>
                    <option value="Viudo">- Viudo-</option>
                    <option value="Divoriciado">- Divoriciado-</option>
                </select>

                <label for="actividad">¿A qué actividad te dedicas?</label>
                <label for="fuente-ingreso">Fuente de Ingreso:</label>
                <select id="fuente-ingreso" name="fuente-ingreso">
                    <option value="Salariado">- Salariado -</option>
                    <option value="Estudiante">- Estudiante-</option>
                </select>
                <button type="submit">Enviar</button>
           
               </form>
        </div>
    </div>
</body>
</html>
