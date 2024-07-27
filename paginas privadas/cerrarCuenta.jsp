
<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.InitialContext, javax.naming.NamingException" %>
<%
    // Obtener el ID del usuario del formulario
    String usuarioIdStr = request.getParameter("usuario_id");
    int usuarioId = Integer.parseInt(usuarioIdStr);

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Obtener el DataSource
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myDB");
        conn = ds.getConnection();

        // Desactivar auto-commit para realizar transacciones
        conn.setAutoCommit(false);

        // Eliminar datos de las tablas en orden de dependencia
        String[] sqlStatements = {
            "DELETE FROM Validacion WHERE usuario_id = ?",
            "DELETE FROM Datos WHERE usuario_id = ?",
            "DELETE FROM Cuentas WHERE usuario_id = ?",
            "DELETE FROM CuentaDigital WHERE id = ?",
            "DELETE FROM Usuarios WHERE usuario_id = ?"
        };

        // Ejecutar las eliminaciones
        for (String sql : sqlStatements) {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuarioId);
            stmt.executeUpdate();
        }

        // Confirmar la transacción
        conn.commit();

        out.println("<html><body><h2>Tu cuenta ha sido cerrada exitosamente.</h2></body></html>");

    } catch (SQLException | NamingException e) {
        // Manejo de errores
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        out.println("<html><body><h2>Ocurrió un error al cerrar tu cuenta. Por favor, intenta nuevamente.</h2></body></html>");
        e.printStackTrace();
    } finally {
        // Cerrar recursos
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
