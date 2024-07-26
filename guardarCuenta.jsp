<%@ page import="java.sql.*, java.io.*" %>
<%
    String usuarioIdStr = request.getParameter("usuario_id");
    String accountType = request.getParameter("accountType");

    if (usuarioIdStr == null || usuarioIdStr.isEmpty() || accountType == null || accountType.isEmpty()) {
        out.print("Error: Datos de usuario o tipo de cuenta no proporcionados.");
        return;
    }

    int usuarioId;
    try {
        usuarioId = Integer.parseInt(usuarioIdStr);
    } catch (NumberFormatException e) {
        out.print("Error: ID de usuariox no válido.");
        return;
    }

    // Conectar a la base de datos y guardar los datos
    String dbUrl = "jdbc:mariadb://localhost:3306/CuentaDigital";
    String dbUser = "root";
    String dbPassword = "";

    Connection connDb = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String query = "INSERT INTO Cuentas (usuario_id, accountType, created_at) VALUES (?, ?, NOW())";
        pstmt = connDb.prepareStatement(query);
        pstmt.setInt(1, usuarioId);
        pstmt.setString(2, accountType);

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.print("Cuenta guardada exitosamente.");
            // Redirigir o mostrar un mensaje de éxito según sea necesario
            response.sendRedirect("registro3.jsp?usuario_id=" + usuarioId);

        } else {
            out.print("Error al guardar la cuenta.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error al guardar la cuenta: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (connDb != null) try { connDb.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
