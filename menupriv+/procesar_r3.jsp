<%@ page import="java.sql.*, java.io.*" %>
<%
    // Recuperar parámetros del formulario
    String usuarioIdStr = request.getParameter("usuario_id");
    String dobDayStr = request.getParameter("dob-day");
    String dobMonthStr = request.getParameter("dob-month");
    String dobYearStr = request.getParameter("dob-year");
    String motherName = request.getParameter("mother-name");
    String dniDepartment = request.getParameter("dni-department");
    String dniProvince = request.getParameter("dni-province");
    String dniDistrict = request.getParameter("dni-district");
    String product = request.getParameter("product");

    // Validar los parámetros
    if (usuarioIdStr == null || usuarioIdStr.isEmpty() ||
        dobDayStr == null || dobDayStr.isEmpty() || dobMonthStr == null || dobMonthStr.isEmpty() || dobYearStr == null || dobYearStr.isEmpty() ||
        motherName == null || motherName.isEmpty() || dniDepartment == null || dniDepartment.isEmpty() || dniProvince == null || dniProvince.isEmpty() ||
        dniDistrict == null || dniDistrict.isEmpty() || product == null || product.isEmpty()) {
        out.print("Error: Datos incompletos.");
        return;
    }

    int usuarioId;
    int dobDay;
    int dobMonth;
    int dobYear;

    try {
        usuarioId = Integer.parseInt(usuarioIdStr);
        dobDay = Integer.parseInt(dobDayStr);
        dobMonth = Integer.parseInt(dobMonthStr);
        dobYear = Integer.parseInt(dobYearStr);
    } catch (NumberFormatException e) {
        out.print("Error: Datos de formato incorrecto.");
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
        
        
        String query = "INSERT INTO Validacion (usuario_id, dob_day, dob_month, dob_year, mother_name, dni_department, dni_province, dni_district, product) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = connDb.prepareStatement(query);
        pstmt.setInt(1, usuarioId);
        pstmt.setInt(2, dobDay);
        pstmt.setInt(3, dobMonth);
        pstmt.setInt(4, dobYear);
        pstmt.setString(5, motherName);
        pstmt.setString(6, dniDepartment);
        pstmt.setString(7, dniProvince);
        pstmt.setString(8, dniDistrict);
        pstmt.setString(9, product);

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            response.sendRedirect("registro4.jsp?usuario_id=" + usuarioId);
        } else {
            out.print("Error al guardar la validación.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error al guardar la validación: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connDb != null) {
            try {
                connDb.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
