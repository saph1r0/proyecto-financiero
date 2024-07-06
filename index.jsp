<%-- 
    Document   : index
    Created on : 5 jul 2024, 20:02:56
    Author     : Kathy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAPAQ - Cuenta Digital</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="row p-0 m-0">
            <div class="col col-12 col-md-6 col-lg-6 order-md-first p-0 m-0">
                <div class="logo-container">
                    <div class="logo">
                        <div class="logo-item imagen-container">
                            <div class="imagen"></div>
                        </div>
                        <div class="logo-item fondo-container">
                            <div class="fondo"></div>
                        </div>
                        <div class="logo-item cinta-container">
                            <div class="cinta"></div>
                        </div>
                        <div class="logo-item descripcion-container">
                            <div class="descripcion">Cuenta Digital</div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    <div class="container">
        <div class="header">
            <img src="logo.png" alt="QAPAQ Logo">
        </div>
        <div class="content">
            <!--
            <div class="image-section">
                <img src="family-image.png" alt="Familia usando laptop">
                <div class="caption">Cuenta Digital</div>
            </div>
            -->
            
            <div class="form-section">
                <h2>Cuenta Digital</h2>
                <p>Abre tu cuenta 100% digital</p>
                <form action="submit.jsp" method="post">
                    <div class="form-group">
                        <label for="dni">DNI</label>
                        <input type="text" id="dni" name="dni" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="celular">Celular</label>
                        <input type="tel" id="celular" name="celular" required>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">Acepto los <a href="#">Términos y Condiciones de Cuenta Digital</a></label>
                    </div>
                    <div class="form-group">
                        <div class="g-recaptcha" data-sitekey="your-site-key"></div>
                    </div>
                    <button type="submit">Siguiente</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>
