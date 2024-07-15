<%@ page import="java.sql.*, java.io.*, javax.servlet.*, java.net.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.*"%>
<%
    String dni = request.getParameter("dni");
    String email = request.getParameter("email");
    String celular = request.getParameter("celular");
    String password = request.getParameter("password"); // Captura la contraseña del formulario

    // Conectar a la base de datos y guardar los datos
    String dbUrl = "jdbc:mariadb://localhost:3306/CuentaDigital";
    String dbUser = "root";
    String dbPassword = "";

    Connection connDb = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String query = "INSERT INTO CuentaDigital(dni, email, celular, password, created_at) VALUES (?, ?, ?, ?, NOW())";
        pstmt = connDb.prepareStatement(query);
        pstmt.setString(1, dni);
        pstmt.setString(2, email);
        pstmt.setString(3, celular);
        pstmt.setString(4, password); // Asigna el valor del campo de contraseña

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.print("Registro exitoso");
        } else {
            out.print("Error en el registro");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error en el registro");
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (connDb != null) {
            try {
                connDb.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
%>
