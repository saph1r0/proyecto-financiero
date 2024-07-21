<%@ page import="java.sql.*, java.io.*, javax.servlet.*, java.net.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.*"%>
<%
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");

    String dni = request.getParameter("dni");
    String email = request.getParameter("email");
    String celular = request.getParameter("celular");
    String password = request.getParameter("password");

    boolean hasErrors = false;
    String dniError = "";
    String emailError = "";
    String celularError = "";
    String passwordError = "";

    // Validaciones
    if (dni == null || !dni.matches("\\d{8}")) {
        dniError = "El DNI debe tener 8 números.";
        hasErrors = true;
    }
    if (email == null || !email.endsWith("@gmail.com")) {
        emailError = "El email debe terminar en @gmail.com.";
        hasErrors = true;
    }
    if (celular == null || !celular.matches("\\d{9}")) {
        celularError = "El celular debe tener 9 números.";
        hasErrors = true;
    }
    if (password == null || password.length() < 5) {
        passwordError = "La contraseña debe tener al menos 5 caracteres.";
        hasErrors = true;
    }

    // Crear un mensaje de respuesta
    StringBuilder responseMessage = new StringBuilder();

    if (hasErrors) {
        responseMessage.append("errors:");
        if (!dniError.isEmpty()) responseMessage.append("dniError=").append(dniError).append(";");
        if (!emailError.isEmpty()) responseMessage.append("emailError=").append(emailError).append(";");
        if (!celularError.isEmpty()) responseMessage.append("celularError=").append(celularError).append(";");
        if (!passwordError.isEmpty()) responseMessage.append("passwordError=").append(passwordError).append(";");
        out.print(responseMessage.toString());
    } else {
        // Conectar a la base de datos y guardar los datos
        String dbUrl = "jdbc:mariadb://localhost:3306/CuentaDigital";
        String dbUser = "root";
        String dbPassword = "";

        Connection connDb = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connDb = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String query = "INSERT INTO Usuarios (dni, email, celular, password) VALUES (?, ?, ?, ?)";
            pstmt = connDb.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, dni);
            pstmt.setString(2, email);
            pstmt.setString(3, celular);
            pstmt.setString(4, password);
            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();
            int usuarioId = 0;
            if (rs.next()) {
                usuarioId = rs.getInt(1);
            }

            // Enviar mensaje de éxito con el ID del usuario
            responseMessage.append("success=").append(usuarioId);
            out.print(responseMessage.toString());
        } catch (Exception e) {
            e.printStackTrace();
            responseMessage.append("error=Error en el registro");
            out.print(responseMessage.toString());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (connDb != null) try { connDb.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
