<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Contraseña</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

header {
    text-align: center;
    border-bottom: 2px solid #fdd835;
    margin-bottom: 20px;
}

.logo img {
    width: 150px;
    margin-bottom: 10px;
}

h2 {
    color: #d32f2f;
    margin: 0;
}

.note {
    color: #d32f2f;
    background-color: #fff9c4;
    border-left: 5px solid #fdd835;
    padding: 10px;
    margin-bottom: 20px;
}
 .line{
            display:flex;
            background-color: #fcec04;
            height: 7px;
        }
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-group {
    margin-bottom: 20px;
    width: 100%;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.keyboard {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 10px;
    margin-bottom: 20px;
}

.keyboard button {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
    cursor: pointer;
}

.form-buttons {
    display: flex;
    justify-content: center;
    gap: 10px; 
    margin-top: 20px; 
}

.form-buttons button {
    background-color: #0056b3; 
    color: white;
    border: none; 
    padding: 9px 18px; 
    font-size: 14px; 
    cursor: pointer; 
    border-radius: 5px; 
    transition: background-color 0.3s ease;
}

.form-buttons button:hover {
    background-color: darkblue;
}

footer {
    margin-top: 10px;
    padding: 10px;
    background-color: #f7f7f7;
    text-align: center;
    font-size: 0.9em;
    color: #333;
    border-top: 1px solid #ccc;
}

    </style>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Clave</title>

</head>
<body>
        <main>
            <h2>Cambio de Clave</h2>
            <div class="line"></div>
            <p class="note">Antes de continuar, por seguridad es necesario que cambies tu Clave de Banca electronica, por favor ingresa una clave que no hayas usado con anterioridad.</p>
            <form action="passw_change_process.jsp" method="post">
      
            <div class="form-group">
                <label for="current_password">Ingresa clave ACTUAL</label>
                <input type="password" id="current_password" name="current_password" required>
            </div>
            <div class="form-group">
                <label for="new_password">Ingresa clave NUEVA</label>
                <input type="password" id="new_password" name="new_password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Reingresa clave NUEVA</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>
            <div class="form-buttons">
                <button type="submit">Cambiar</button>
                <button type="reset">Cancelar</button>
            </div>
        
            </form>
        </main>
        <footer>
            <p>Importante: Te recordamos que el uso, el manejo y la custodia de tu clave es de tu entera responsabilidad. Te recomendamos realizar el cambio de la misma en forma periódica.</p>
            <p>Se recomienda usar Firefox, Safari, Chrome o Internet Explorer 8.0 o superior.</p>
        </footer>
</body>
</html>
