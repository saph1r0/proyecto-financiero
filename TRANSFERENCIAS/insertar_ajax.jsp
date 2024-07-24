<%@ include file="base_datos.jsp"%>
            
<%
base_datos bd= new base_datos("localhost", "root", "", "banco"); 
bd.conectar();

String monto = request.getParameter("monto");
String origen = request.getParameter("origen");
String propia = request.getParameter("propia");
String terceros = request.getParameter("terceros");
String concepto = request.getParameter("concepto");
String notif = request.getParameter("notif");
//String terms = request.getParameter("terms");
//boolean isChecked = terms != null;

bd.insCliente(monto, origen, propia, terceros, concepto, notif);

bd.cerrar();
%>