<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    .form-group {
        margin-bottom: 15px;
    }
    .btn-print {
        background-color: #f02d3a;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        margin: 20px 0;
        font-size: 16px;
    }
    .btn-print:hover {
        background-color: #d12832;
    }
  </style>
</head>
<body>

<div class="content">
    <h1>Movimiento por fecha</h1>
    <p>Compra venta de divisas</p>
    <p>Compra: 3.7340 - Venta: 3.7760</p>
  
    <div class="form-group">
        <label for="cuenta" class="form-label">Nro. cuenta</label>
        <select id="cuenta" class="form-input">
            <option value="1326500061355">AHORROS SOLES DIGITAL: 2147483647 (S$ 0.00)</option>
        </select>
    </div>

    <div class="form-group">
        <label for="inicio" class="form-label">Fecha inicio</label>
        <input type="date" id="inicio" class="form-input" value="2024-06-10">
    </div>

    <div class="form-group">                  
        <label for="fin" class="form-label">Fecha fin</label>
        <input type="date" id="fin" class="form-input" value="2024-07-10">
    </div>

    <p class="note">Nota: La fecha de fin no puede ser mayor a 30 días de la fecha de inicio.</p>

    <button id="consultar" class="form-button">Consultar</button>

    <div class="account-info">
        <p>DNI: 72750022</p>
        <p>Cuenta Numero: 2147483647</p>
        <p>CCI: 09335332650006135510</p>
    </div>

    <div class="no-info">
        <p>No existe información para la presente cuenta</p>
        <button class="btn-print">Imprimir</button>
    </div>

</div>

<%
    // Aquí puedes realizar tu lógica de negocio, por ejemplo:
    // Si hay algún resultado de una operación, puedes mostrar el alert y redirigir.

    // Ejemplo de manejo de resultado:
    boolean movimientoExitoso = true; // Esto debería ser el resultado real de tu operación

    if (movimientoExitoso) {
        out.println("<script>");
        out.println("alert('Movimiento realizado con éxito');");
        out.println("window.location='menupriv.jsp';"); // Redirige a la página deseada
        out.println("</script>");
    }
%>

<script>
document.getElementById('consultar').addEventListener('click', function() {
    alert('Movimiento realizado con éxito');
});
</script>

</body>
</html>
