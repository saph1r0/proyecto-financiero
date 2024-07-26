<!DOCTYPE html>
<html>
<head>
  <title>Qapaq - Cuentas Digitales</title>
  <style>
    body {
      font-family: sans-serif;
      background-image: url("images/tiposcuenta.png");
      background-size: cover; 
    background-repeat: no-repeat; 
    background-attachment: fixed; 
    background-position: center; 
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: row;
      padding: 2rem;
      margin-top: 70px;
      margin-left: 290px;
    }

    h1 {
      font-size: 20px;
      text-align: center;
      margin-top: 40px;
    }

    .account-cards {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%; 
    }

    .account-card {
      background-color: #FFFFFF;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
      flex-basis: 25%; 
      margin: 7px;
      text-align: left;
    }

    .account-card h2 {
      font-size: 1.5rem;
      margin-bottom: 1rem;
    }

    .account-card ul {
      list-style: disc;
      padding-left: 20px;
      margin-bottom: 1rem;
    }

    .account-card button {
      background-color: #FFD700;
      color: #FFFFFF;
      padding: 1rem 2rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .account-card button:hover {
      background-color: #FFC107;
    }
  </style>
</head>
<body>
  <h1>Elige la cuenta que se acomode a tus necesidades.</h1>
  <div class="container">
    <div class="account-cards">
      <div class="account-card">
        <h2>Insuperable de Qapaq</h2>
        <ul>
          <li>Tasa de interés de hasta 6.25%</li>
          <li>Monto mínimo de S/ 8.000</li>
          <li>Máxima rentabilidad para tus retiros de CTS o AFP</li>
        </ul>
        <form action="guardarCuenta.jsp" method="post">
            <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
          <input type="hidden" name="accountType" value="Insuperable de Qapaq">
          <button type="submit">La quiero</button>
        </form>
      </div>
      <div class="account-card">
        <h2>Qapital+ de Qapaq</h2>
        <ul>
          <li>Tasa de interés de hasta 4.25%</li>
          <li>Monto mínimo de S/ 4.000</li>
          <li>Le damos un Plus de interés a tu capital</li>
        </ul>
        <form action="guardarCuenta.jsp" method="post">
           <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
          <input type="hidden" name="accountType" value="Qapital+ de Qapaq">
          <button type="submit">La quiero</button>
        </form>
      </div>
      <div class="account-card">
        <h2>La MagnifiQa de Qapaq</h2>
        <ul>
          <li>Tasa de interés de 3.00%</li>
          <li>Monto mínimo de S/ 1.500</li>
          <li>La cuenta ideal para empezar a ahorrar en grande</li>
        </ul>
        <form action="guardarCuenta.jsp" method="post">
           <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
          <input type="hidden" name="accountType" value="La MagnifiQa de Qapaq">
          <button type="submit">La quiero</button>
        </form>
      </div>
      <div class="account-card">
        <h2>Ahorro Soles Digital</h2>
        <ul>
          <li>Costo de mantenimiento cero por mes</li>
          <li>Tu dinero disponible en cualquier momento.</li>
          <li>6 transacciones en ventanilla sin costo al mes.</li>
        </ul>
        <form action="guardarCuenta.jsp" method="post">
            <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
          <input type="hidden" name="accountType" value="Ahorro Soles Digital">
          <button type="submit">La quiero</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
