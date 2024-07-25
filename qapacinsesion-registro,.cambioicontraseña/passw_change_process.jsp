<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Cambio de Contraseña</title>
</head>
<body>
<%
    // Obtener los parámetros del formulario
    String currentPassword = request.getParameter("current_password");
    String newPassword = request.getParameter("new_password");
    String confirmPassword = request.getParameter("confirm_password");

    // Validar que las contraseñas coinciden
    if (!newPassword.equals(confirmPassword)) {
        out.println("<script>alert('Las contraseñas no coinciden'); window.location='passw_change.jsp';</script>");
    } else {
        // Obtener la sesión actual, si existe
        HttpSession userSession = request.getSession(false); 
        if (userSession == null) {
            out.println("<script>alert('No se encontró la sesión'); window.location='passw_change.jsp';</script>");
            return;
        }

        Integer usuarioId = (Integer) userSession.getAttribute("usuario_id");
        if (usuarioId == null) {
            out.println("<script>alert('Usuario no autenticado'); window.location='passw_change.jsp';</script>");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/CuentaDigital", "root", "");

            String sqlCheck = "SELECT password FROM Usuarios WHERE usuario_id = ?";
            ps = conn.prepareStatement(sqlCheck);
            ps.setInt(1, usuarioId);
            rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (dbPassword.equals(currentPassword)) {
                    String sqlUpdate = "UPDATE Usuarios SET password = ? WHERE usuario_id = ?";
                    ps = conn.prepareStatement(sqlUpdate);
                    ps.setString(1, newPassword);
                    ps.setInt(2, usuarioId);
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<script>alert('Contraseña actualizada con éxito'); window.location='passw_change.jsp';</script>");
                    } else {
                        out.println("<script>alert('No se pudo actualizar la contraseña'); window.location='passw_change.jsp';</script>");
                    }
                } else {
                    out.println("<script>alert('La contraseña actual es incorrecta'); window.location='passw_change.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Usuario no encontrado'); window.location='passw_change.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error al actualizar la contraseña: " + e.getMessage() + "'); window.location='passw_change.jsp';</script>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
</body>
</html>
