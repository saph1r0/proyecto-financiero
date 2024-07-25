<%@ page import="java.sql.*, java.io.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String dni = request.getParameter("dni");
    String password = request.getParameter("password"); 
    
    String dbUrl = "jdbc:mariadb://localhost:3306/CuentaDigital";
    String dbUser = "root";
    String dbPassword = "";

    Connection connDb = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Consulta SQL para verificar las credenciales
        String query = "SELECT usuario_id FROM Usuarios WHERE dni = ? AND password = ?";
        pstmt = connDb.prepareStatement(query);
        pstmt.setString(1, dni);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Si las credenciales son válidas, establecer sesión y redirigir
            int usuarioId = rs.getInt("usuario_id");
            session.setAttribute("usuario_id", usuarioId);
            out.print("Inicio de sesión exitoso");
        } else {
            out.print("Error en el inicio de sesión: Credenciales incorrectas");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error en el inicio de sesión: Error de conexión o consulta");
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
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
