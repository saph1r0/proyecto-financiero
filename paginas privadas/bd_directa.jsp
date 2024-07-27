<%@page import="java.sql.*"%>

<%
class BaseDatos {
    private String host; 
    private String usua; 
    private String pass;
    private String bd;
    
    private Connection conexion;
    
    public BaseDatos(String host, String usua, String pass, String bd) {
        this.host = host;
        this.usua = usua; 
        this.pass = pass; 
        this.bd = bd;
    }

    public boolean conectar() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            this.conexion = DriverManager.getConnection("jdbc:mariadb://" + host + "/" + bd, usua, pass); 
            return this.conexion != null;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Registrar el error para diagnóstico
            return false;
        }
    }
    
    public ResultSet getClientes() {
        try {
            PreparedStatement ps = this.conexion.prepareStatement("SELECT * FROM tdirecta"); 
            return ps.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace(); // Registrar el error para diagnóstico
            return null;
        }
    }
   
    public boolean insCliente(String monto, String cuentaOrigen, String propia, String terceros, String concepto, String notif) {
        try {
            PreparedStatement ps = this.conexion.prepareStatement("INSERT INTO tdirecta (monto, origen, propia, terceros, concepto, notif) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, monto);
            ps.setString(2, cuentaOrigen);
            ps.setString(3, propia);
            ps.setString(4, terceros);
            ps.setString(5, concepto);
            ps.setString(6, notif);
            ps.executeUpdate();
            ps.close(); // Cerrar el PreparedStatement
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace(); // Registrar el error para diagnóstico
            return false;
        }
    }

    public void cerrar() {
        try {
            if (this.conexion != null && !this.conexion.isClosed()) {
                this.conexion.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Registrar el error para diagnóstico
        }
    }
}
%>
