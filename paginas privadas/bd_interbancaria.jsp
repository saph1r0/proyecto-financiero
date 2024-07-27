<%@page import="java.io.IOException"%> 
<%@page import="java.sql.*"%>

<%
class base_datos {
    private String host; 
    private String usua; 
    private String pass;
    private String bd;
    
    public Connection conexion;
    public base_datos(String host, String usua, String pass, String bd) {
        this.host = host;
        this.usua = usua; 
        this.pass = pass; 
        this.bd = bd;
    }
    public boolean conectar() throws IOException, SQLException, ClassNotFoundException { 
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            this.conexion = DriverManager.getConnection ("jdbc:mariadb://" + host +"/"+ bd, usua, pass); 
            if (this.conexion == null) {
                return false;
            }
       } catch (SQLException ex) {
                return false;
            }
            return true;
    }
    
    public ResultSet getClientes () throws IOException, SQLException {
        try{
            PreparedStatement ps = this.conexion.prepareStatement("SELECT * FROM interbancaria"); 
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            return null;
        }
    }
   
public boolean insCliente (String cuentaOrigen, String cuentaDestino, String cuentaDestino2, String monto, String soles, String micuenta, String nombre, String concepto) throws IOException, SQLException { //, String terms
    try {
            PreparedStatement ps = this.conexion.prepareStatement("INSERT INTO interbancaria(cuentaOrigen, cuentaDestino, cuentaDestino2, monto, soles, micuenta, nombre , concepto) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, cuentaOrigen);
            ps.setString(2, cuentaDestino);
            ps.setString(3, cuentaDestino2);
            ps.setString(4, monto);
            ps.setString(5, soles);
            ps.setString(6, micuenta);
            ps.setString(7, nombre);
            ps.setString(8, concepto);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
}



    public void cerrar() throws SQLException {
        this.conexion.close();
    }
}
%>
