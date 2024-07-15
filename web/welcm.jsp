<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("registro_inicio.html");
    } else {
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Bienvenido, <%= user %>!</h1>
    <p>Has iniciado sesión exitosamente.</p>
</body>
</html>
<%
    }
%>
