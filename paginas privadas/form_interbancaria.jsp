<%@ include file="bd_interbancaria.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    if (request.getParameter("cuenta-origen") != null && 
        request.getParameter("cuenta-destino") != null &&
        request.getParameter("cuenta-destino2") != null &&
        request.getParameter("monto") != null &&
        request.getParameter("moneda-select") != null &&
        request.getParameter("micuenta") != null &&
        request.getParameter("nombre") != null &&
        request.getParameter("concepto") != null) {

        session.setAttribute("cuenta-origen", request.getParameter("cuenta-origen"));
        session.setAttribute("cuenta-destino", request.getParameter("cuenta-destino"));
        session.setAttribute("cuenta-destino2", request.getParameter("cuenta-destino2"));
        session.setAttribute("monto", request.getParameter("monto"));
        session.setAttribute("moneda-select", request.getParameter("moneda-select"));
        session.setAttribute("micuenta", request.getParameter("micuenta"));
        session.setAttribute("nombre", request.getParameter("nombre"));
        session.setAttribute("concepto", request.getParameter("concepto"));
    }
    String cuentaOrigen = (String) session.getAttribute("cuenta-origen");
    String cuentaDestino = (String) session.getAttribute("cuenta-destino");
    String cuentaDestino2 = (String) session.getAttribute("cuenta-destino2");
    String monto = (String) session.getAttribute("monto");
    String soles = (String) session.getAttribute("moneda-select");
    String micuenta = (String) session.getAttribute("micuenta");
    String nombre = (String) session.getAttribute("nombre");
    String concepto = (String) session.getAttribute("concepto");

    base_datos bd = new base_datos("localhost", "root", "", "banco"); 
    try {
        if (bd.conectar()) {
            if (bd.insCliente(cuentaOrigen, cuentaDestino, cuentaDestino2, monto, soles, micuenta,nombre, concepto)) {

            } else {
                out.println("<h1>Error al insertar datos</h1>");
            }
        } else {
            out.println("<h1>Error al conectar a la base de datos</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Se produjo un error</h1>");
    } finally {
        try {
            bd.cerrar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
    <body>
    </body>
</html>
