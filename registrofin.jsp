<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuenta Digital</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url("images/fin.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    background-attachment: fixed; 
    background-position: center; 
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding-left: 320px; 
            margin-top: -20px;
        }
        .confirmation-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 93%;
            text-align: center;
        }
        .confirmation-box h2 {
            color: #e6007e;
        }
        .confirmation-box .details {
            margin: 20px 0;
            text-align: left;
        }
        .details div {
            margin-bottom: 10px;
        }
        .details label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="confirmation-box">
            <h2>Cuenta Digital</h2>
            <% 
                String url = "jdbc:mariadb://localhost:3306/CuentaDigital";
                String user = "root";
                String password = "";

                // Variables para los datos que quieres mostrar
                String primerNombre = "";
                String segundoNombre = "";
                String apellidoPaterno = "";
                String apellidoMaterno = "";
                String dni = "";
                String email = "";
                String accountType = "";
                String departamento = "";
               

                // Obtener el parámetro usuario_id
                String usuarioIdParam = request.getParameter("usuario_id");

                // Conexión a la base de datos
                try {
                    Class.forName("org.mariadb.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, password);

                    // Consulta combinada usando JOIN
                    String query = "SELECT u.dni, u.email, d.primer_nombre, d.segundo_nombre, d.apellido_paterno, d.apellido_materno, c.accountType, v.dni_department " +
                                   "FROM Usuarios u " +
                                   "JOIN Datos d ON u.usuario_id = d.usuario_id " +
                                   "JOIN Cuentas c ON u.usuario_id = c.usuario_id " +
                                   "JOIN Validacion v ON u.usuario_id = v.usuario_id " +
                                   "WHERE u.usuario_id = ?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, usuarioIdParam);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        primerNombre = rs.getString("primer_nombre");
                        segundoNombre = rs.getString("segundo_nombre");
                        apellidoPaterno = rs.getString("apellido_paterno");
                        apellidoMaterno = rs.getString("apellido_materno");
                        dni = rs.getString("dni");
                        email = rs.getString("email");
                        accountType = rs.getString("accountType");
                        departamento = rs.getString("dni_department");
                        
                    } else {
                        out.println("No se encontraron datos para el usuario_id: " + usuarioIdParam);
                    }

                    rs.close();
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
            %>
            <p>¡Felicitaciones <%= primerNombre %>! Finalizaste con éxito tu solicitud.</p>
            <div class="details">
                <div>
                    <label>Tipo de Documento:</label>
                    <span>DNI</span>
                </div>
                <div>
                    <label>N° de Documento:</label>
                    <span><%= dni %></span>
                </div>
                <div>
                    <label>Nombre:</label>
                    <span><%= primerNombre %> <%= segundoNombre %> <%= apellidoPaterno %> <%= apellidoMaterno %></span>
                </div>
                <div>
                    <label>Cuenta Elegida:</label>
                    <span><%= accountType %></span>
                </div>
                <div>
                    <label>N° de Cuenta:</label>
                    <span><%= usuarioIdParam %></span>
                </div>
                <div>
                    <label>Código Interbancario:</label>
                    <span><%= usuarioIdParam %></span>
                </div>
                <div>
                    <label>Correo electrónico:</label>
                    <span><%= email %></span>
                </div>
               
                <div>
                    <label>Fecha y Hora:</label>
                    <span><%= new java.util.Date() %></span>
                </div>
                <div>
                    <label>Moneda:</label>
                    <span>SOLES</span>
                </div>
                <div>
                    <label>Departamento:</label>
                    <span><%= departamento %></span>
                </div>
               
            </div>
            <p>Revisa tu correo electrónico registrado, te enviamos todos los documentos de respaldo, tu Usuario y Contraseña temporal de <a href="/qapac_inicio_sesion/inicio_sesion.html">Banca en Línea</a></p>
           
        </div>
    </div>
</body>
</html>
