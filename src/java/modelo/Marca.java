/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;



/**
 *
 * @author DANY
 */
public class Marca extends Productos{
    private Conexion cn;
   

    public Marca() {}

    public Marca( int id, String producto, String idmarca, String descripcion, String costo, String venta, String existencia) {
        super(id, producto, idmarca, descripcion, costo, venta, existencia);
       
    }

    
    

   


    /**
     *
     * @return
     */
    @Override
    public int agregar (){
        
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="INSERT INTO productos(producto,idMarca,descripcion,precio_costo,precio_venta,existencia) VALUES (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setString(2, getIdmarca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getCosto());
            parametro.setString(5, getVenta());
            parametro.setString(6, getExistencia()); 
            parametro.executeUpdate();
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
       return 0; 
    }
 
    
    @Override
    public int modificar(){
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="UPDATE productos set producto=?,idMarca=?,Descripcion=?,precio_costo=?,precio_venta=?,existencia=?) where idproducto =?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setString(2, getIdmarca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getCosto());
            parametro.setString(5, getVenta());
            parametro.setString(6, getExistencia());
            
            
            parametro.executeUpdate();
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
    

    @Override
    public int eliminar(){
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="DELETE from productos where idproducto =?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            
            parametro.executeUpdate();
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }   
    /**
     *
     * @return
     */
 public DefaultTableModel leer(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT p.idproducto as id,p.producto,p.idmarca,p.descripcion,p.precio_costo,p.precio_venta,p.existencia FROM productos as p inner join marcas as m on p.idmarca = m.idmarca;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","producto","idmarca","descripcion","precio_costo","precio_venta","existencia","marca","idmarca"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[7];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("producto");
          datos[2] = consulta.getString("idmarca");
          datos[3] = consulta.getString("descripcion");
          datos[4] = consulta.getString("precio_costo");
          datos[5] = consulta.getString("precio_venta");
          datos[6] = consulta.getString("existencia");
          
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
    
}
