<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Histórico de Transferencias</title>

</head>
<body>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }

    </style>
   
        <div>
        <center>
            <p>Compra Venta de Divisas</p>
            <p>compra : 3.7610 - venta : 38030</p>
        </center>
        </div>
        
        <hr style="width: 100%; border: 5px yellow solid">
            <p style="color: red"> Historico de transferencias </p>
        <hr style="width: 100%; border: 5px yellow solid">
        <br>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Monto</th>
                    <th>Cuenta Origen</th>
                    <th>Cuenta Destino</th>
                    <th>Concepto</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Establecer conexión con la base de datos
                    String url = "jdbc:mariadb://localhost:3306/banco";
                    String user = "root";
                    String password = "";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;

                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        connection = DriverManager.getConnection(url, user, password);
                        statement = connection.createStatement();
                        String sql = "SELECT id, fecha, monto, cuenta_origen, cuenta_destino, concepto FROM transferencias";
                        resultSet = statement.executeQuery(sql);

                        // Iterar sobre los resultados y mostrarlos en la tabla
                        while (resultSet.next()) {
                            int id = resultSet.getInt("id");
                            Date fecha = resultSet.getDate("fecha");
                            double monto = resultSet.getDouble("monto");
                            String origen = resultSet.getString("cuenta_origen");
                            String destino = resultSet.getString("cuenta_destino");
                            String concepto = resultSet.getString("concepto");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= fecha %></td>
                    <td><%= monto %></td>
                    <td><%= origen %></td>
                    <td><%= destino %></td>
                    <td><%= concepto %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="6">No se pudieron cargar las transferencias.</td>
                </tr>
                <%
                    } finally {
                        // Cerrar recursos
                        try {
                            if (resultSet != null) resultSet.close();
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
   
</body>
</html>
