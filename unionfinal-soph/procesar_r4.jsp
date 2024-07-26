<%@ page import="java.sql.*, java.io.*" %>
<%
    // Recuperar parámetros del formulario
    String usuarioIdStr = request.getParameter("usuario_id");
    String primerNombre = request.getParameter("primer-nombre");
    String segundoNombre = request.getParameter("segundo-nombre");
    String apellidoPaterno = request.getParameter("apellido-paterno");
    String apellidoMaterno = request.getParameter("apellido-materno");
    String genero = request.getParameter("genero");
    String estadoCivil = request.getParameter("estado-civil");
    String fuenteIngreso = request.getParameter("fuente-ingreso");

    // Validar los parámetros
    if (usuarioIdStr == null || usuarioIdStr.isEmpty() ||
        primerNombre == null || primerNombre.isEmpty() ||
        segundoNombre == null || segundoNombre.isEmpty() ||
        apellidoPaterno == null || apellidoPaterno.isEmpty() ||
        apellidoMaterno == null || apellidoMaterno.isEmpty() ||
        genero == null || genero.isEmpty() ||
        estadoCivil == null || estadoCivil.isEmpty() ||
        fuenteIngreso == null || fuenteIngreso.isEmpty()) {
        out.print("Error: Datos incompletos.");
        return;
    }

    int usuarioId;
    try {
        usuarioId = Integer.parseInt(usuarioIdStr);
    } catch (NumberFormatException e) {
        out.print("Error: ID de usuario no válido.");
        return;
    }

    String dbUrl = "jdbc:mariadb://localhost:3306/CuentaDigital";
    String dbUser = "root";
    String dbPassword = "";

    Connection connDb = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String query = "INSERT INTO Datos (usuario_id, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, genero, estado_civil, fuente_ingreso) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = connDb.prepareStatement(query);
        pstmt.setInt(1, usuarioId);
        pstmt.setString(2, primerNombre);
        pstmt.setString(3, segundoNombre);
        pstmt.setString(4, apellidoPaterno);
        pstmt.setString(5, apellidoMaterno);
        pstmt.setString(6, genero);
        pstmt.setString(7, estadoCivil);
        pstmt.setString(8, fuenteIngreso);

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
        response.sendRedirect("registrofin.jsp?usuario_id=" + usuarioId);
           
        } else {
            out.print("Error al guardar los datos.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error al guardar los datos: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (connDb != null) try { connDb.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
