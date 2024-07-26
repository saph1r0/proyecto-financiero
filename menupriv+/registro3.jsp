<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAPAQ - Valida tu identidad</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("images/valid.png");
            background-size: cover; 
    background-repeat: no-repeat; 
    background-attachment: fixed; 
    background-position: center; 
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        main {
            display: flex;
            justify-content: flex-end;
    align-items: flex-end;
            justify-content: center;
            min-height: 650px;
            padding-left: 250px; /* Ajusta según sea necesario */
        }

        .form-container {
            background-color: white;
            max-width: 800px;
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            padding: 20px;
        }

        .right-panel {
            flex: 1;
            padding: 20px;
        }

        form {
            display: flex;
            flex-wrap: wrap;
        }

        .form-group {
            flex: 1 1 48%;
            margin-bottom: 20px;
            padding-right: 10px;
           
        }

        .form-group:nth-child(odd) {
            padding-right: 10px;
        }

        .form-group:nth-child(even) {
            padding-left: 10px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            background-color: #ffcc00;
            padding: 5px;
            border-radius: 3px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group select {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <main>
        <div class="form-container">
            <div class="right-panel">
                <form action="procesar_r3.jsp" method="post">
                    <input type="hidden" name="usuario_id" value="<%= request.getParameter("usuario_id") %>">
                    <div class="form-group">

                        <label for="dob">1. ¿Cuál es su fecha de nacimiento?</label>
                        <select id="dob-day" name="dob-day">
                            <option value="">- Día -</option>
              
                            <option value="1">1</option><option value="2">2</option>
                            <option value="3">3</option><option value="4">4</option>                           
                            <option value="5">5</option><option value="6">6</option>
                            <option value="7">7</option><option value="8">8</option>
                            <option value="9">9</option><option value="10">10</option>
                            <option value="11">11</option><option value="12">12</option>                          
                            <option value="13">13</option><option value="14">14</option>                           
                            <option value="15">15</option><option value="16">16</option>                          
                            <option value="17">17</option><option value="18">18</option>                          
                            <option value="19">19</option><option value="20">20</option>                         
                            <option value="21">21</option><option value="22">22</option>                      
                            <option value="23">23</option><option value="24">24</option>
                            <option value="25">25</option><option value="26">26</option>                
                            <option value="27">27</option><option value="28">28</option>                          
                            <option value="29">29</option><option value="30">30</option>                          
                            <option value="31">31</option>

                        </select>
                        <select id="dob-month" name="dob-month">
                            <option value="">- Mes -</option>
                            
                            <option value="1">Enero</option><option value="2">Febrero</option>
                            <option value="3">Marzo</option><option value="4">Abril</option>
                            <option value="5">Mayo</option><option value="6">Junio</option>
                            <option value="7">Julio</option><option value="8">Agosto</option>
                            <option value="9">Septiembre</option><option value="10">Octubre</option>
                            <option value="11">Noviembre</option><option value="12">Diciembre</option>
              
                        </select>
                        <select id="dob-year" name="dob-year">
                            <option value="">- Año -</option>
                            <option value="1990">1990</option><option value="1991">1991</option>
                            <option value="1992">1992</option><option value="1993">1993</option>
                            <option value="1994">1994</option><option value="1995">1995</option>
                            <option value="1996">1996</option><option value="1997">1997</option>
                            <option value="1998">1998</option><option value="1999">1999</option>
                            <option value="2000">2000</option><option value="2001">2001</option>
                            <option value="2002">2002</option><option value="2003">2003</option>
                            <option value="2004">2004</option><option value="2005">2005</option>
                            <option value="2006">2006</option><option value="2007">2007</option>
                            <option value="2008">2008</option><option value="2009">2009</option>
                            <option value="2010">2010</option><option value="2011">2011</option>
                            <option value="2012">2012</option><option value="2013">2013</option>
                            <option value="2014">2014</option><option value="2015">2015</option>
                            <option value="2016">2016</option><option value="2017">2017</option>
                            <option value="2018">2018</option><option value="2019">2019</option>
                            <option value="2020">2020</option><option value="2021">2021</option>
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="mother-name">2. ¿Cuál es el primer nombre de tu madre?</label>
                        <input type="text" id="mother-name" name="mother-name" placeholder="NOMBRE">
                    </div>
                    <div class="form-group">
                        <label for="dni-location">3. ¿Cuál es la dirección que aparece en tu DNI?</label>
                        <input type="text" id="dni-department" name="dni-department" placeholder="- Departamento -">
                        <input type="text" id="dni-province" name="dni-province" placeholder="- Provincia -">
                        <input type="text" id="dni-district" name="dni-district" placeholder="- Distrito -">
                    </div>
                    <div class="form-group">
                        <label for="product">4. ¿Tienes o has tenido un producto QAPAQ en el último año?</label>
                        <select id="product" name="product">
                            <option value="">- Si o No -</option>
                            <option value="si">Si</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <button type="submit">Enviar</button>
                </form>
            </div>
        </div>
    </main>
</body>
</html>

