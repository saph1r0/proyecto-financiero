<%@ include file="base_datos.jsp"%>
            
<%
base_datos bd= new base_datos("localhost", "root", "", "banco"); 
bd.conectar();

String dni = request.getParameter("dni");
String email = request.getParameter("email");
String celular = request.getParameter("celular");
//String terms = request.getParameter("terms");
//boolean isChecked = terms != null;

bd.insCliente(dni, email, celular);

bd.cerrar();
%>