<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Numero de Cuenta</title>
    
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;
    }
    table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
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
.container {
    width: 90%;
    margin: 20px auto;
    text-align: center;
}
.header {
    margin-bottom: 20px;
}

.header h2 {
    margin: 0;
}

.header p {
    margin: 5px 0 0 0;
}

.highlight {
    background-color: yellow;
    padding: 5px;
    margin: 20px 0;
}

.highlight::after {
    content: '';
    display: block;
    height: 5px;
    background-color: yellow;
}
    </style>
   
</head>
<body>
    
    
    <div class="container">
        
        <form action="consolidada.jsp" method="get">
            <label for="usuario_id">Número de Cuenta    :</label>
            <input type="text" id="usuario_id" name="usuario_id" required>
            <button type="submit">Buscar</button>
        </form>
        
        

        <!-- Mostrar Resultados -->
        <% 
            String usuarioId = request.getParameter("usuario_id");

            if (usuarioId != null && !usuarioId.isEmpty()) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Cargar el controlador de MariaDB
                    Class.forName("org.mariadb.jdbc.Driver");

                    // Establecer conexión
                    String url = "jdbc:mariadb://localhost:3306/cuentadigital";
                    String user = "root"; // Cambia esto si tu usuario es diferente
                    String password = ""; // Cambia esto si tu contraseña es diferente
                    conn = DriverManager.getConnection(url, user, password);

                    // Preparar la consulta
                    String sql = "SELECT usuario_id, accountType FROM cuentas WHERE usuario_id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, usuarioId);
                    rs = stmt.executeQuery();

                    // Mostrar resultados
                    if (rs.next()) {
                        String accountType = rs.getString("accountType");
        %>
                    
                        <h3>Detalles de la Cuenta</h3>
                        
                        <table>
                            <thead>
                                <tr>
                                    <th>Número Cuenta</th>
                                    <th>Producto</th>
                                    <th>Número CCI</th>
                                    <th>Moneda</th>
                                    <th>Estado</th>
                                    <th>Saldo Disponible</th>
                                    <th>Saldo Contable</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <td><%= usuarioId %></td>
                                <td><%= accountType %></td>
                                <td>0031234560000134510</td>
                                <td>SOL</td>
                                <td>ACTIVA</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                
                                </tr>
                        </table>
                                <button class="btn-print">Imprimir</button>
                        </div>
                        
                    
        <% 
                    } else {
                        out.println("<p>No se encontró ninguna cuenta con el número proporcionado.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Hubo un error al buscar la cuenta.</p>");
                } finally {
                    // Cerrar recursos
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        %>
    
</body>
</html>