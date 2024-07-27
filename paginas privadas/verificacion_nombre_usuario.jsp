<%@ page import="java.sql.*, java.io.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    Integer usuarioId = (Integer) session.getAttribute("usuario_id");
    
    if (usuarioId == null) {
        response.setContentType("application/json");
        out.print("{\"status\":\"fallido\", \"message\":\"Usuario no autenticado\"}");
        return;
    }
    
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
        String query = "SELECT primer_nombre, segundo_nombre, apellido_paterno, apellido_materno FROM datos WHERE usuario_id = ?";
        pstmt = connDb.prepareStatement(query);
        pstmt.setInt(1,usuarioId);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String primer_nombre = rs.getString("primer_nombre");
            String segundo_nombre = rs.getString("segundo_nombre");
            String apellido_paterno = rs.getString("apellido_paterno");
            String apellido_materno = rs.getString("apellido_materno");
            
            session.setAttribute("primer_nombre", primer_nombre);
            session.setAttribute("segundo_nombre", segundo_nombre);
            session.setAttribute("apellido_paterno", apellido_paterno);
            session.setAttribute("apellido_materno", apellido_materno);

            jsonResponse.append("{")
                .append("\"status\":\"exitoso\", ")
                .append("\"primer_nombre\":\"").append(primer_nombre).append("\", ")
                .append("\"segundo_nombre\":\"").append(segundo_nombre).append("\", ")
                .append("\"apellido_paterno\":\"").append(apellido_paterno).append("\", ")
                .append("\"apellido_materno\":\"").append(apellido_materno).append("\"")
                .append("}");
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

