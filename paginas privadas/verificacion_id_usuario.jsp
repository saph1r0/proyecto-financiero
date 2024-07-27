<%@ page import="java.sql.*, java.io.*, javax.servlet.*" %>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String dni = request.getParameter("dni");
    String password = request.getParameter("password");

    String dbUrl = "jdbc:mariadb://localhost:3306/banco";
    String dbUser = "root";
    String dbPassword = "";

    Connection connDb = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    response.setContentType("application/json");
    StringBuilder jsonResponse = new StringBuilder();

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Consulta simplificada para probar autenticación
        String query = "SELECT usuario_id FROM Usuarios WHERE dni = ? AND password = ?";
        pstmt = connDb.prepareStatement(query);
        pstmt.setString(1, dni);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            int usuarioId = rs.getInt("usuario_id");
            session.setAttribute("usuario_id", usuarioId);
            jsonResponse.append("{\"status\":\"exitoso\", \"usuario_id\":").append(usuarioId).append("}");
        } else {
            jsonResponse.append("{\"status\":\"fallido\", \"message\":\"Credenciales incorrectas\"}");
        }
    } catch (Exception e) {
        e.printStackTrace();
        jsonResponse.append("{\"status\":\"error\", \"message\":\"Error de conexión o consulta\"}");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        if (connDb != null) try { connDb.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    }

    out.print(jsonResponse.toString());
%>
