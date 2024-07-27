<%@ include file="bd_directa.jsp" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*" %>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setContentType("application/json");
    String monto = request.getParameter("monto");
    String cuentaOrigen = request.getParameter("cuentaorigen");
    String cuentaPropiaSelect = request.getParameter("cuentapropiaselect");
    String cuentaTercerosInput = request.getParameter("cuentatercerosinput");
    String concepto = request.getParameter("concepto");
    String mailTerceros = request.getParameter("mailterceros");

    BaseDatos bd = new BaseDatos("localhost", "root", "", "banco");
    StringBuilder jsonResponse = new StringBuilder();
    
    try {
        if (bd.conectar()) {
            boolean result = bd.insCliente(monto, cuentaOrigen, cuentaPropiaSelect, cuentaTercerosInput, concepto, mailTerceros);
            if (result) {
                jsonResponse.append("{\"status\":\"exitoso\", \"redirect\":\"paginas privadas/menupriv.jsp\"}");
            } else {
                jsonResponse.append("{")
                    .append("\"status\":\"fallido\", ")
                    .append("\"message\":\"Error al insertar datos\"")
                    .append("}");
            }
        } else {
            jsonResponse.append("{")
                .append("\"status\":\"fallido\", ")
                .append("\"message\":\"Error al conectar a la base de datos\"")
                .append("}");
        }
    } catch (Exception e) {
        e.printStackTrace();
        jsonResponse.append("{")
            .append("\"status\":\"error\", ")
            .append("\"message\":\"Se produjo un error\"")
            .append("}");
    } finally {
        try {
            bd.cerrar();
        } catch(Exception  e) {
            e.printStackTrace();
        }
    }
    
%>
