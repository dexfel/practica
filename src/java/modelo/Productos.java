/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author DANY
 */
abstract class Productos {
    private int id;
    private String producto,idmarca,descripcion,costo,venta,existencia;
    public Productos(){}
    public Productos(int id, String producto, String idmarca, String descripcion, String costo, String venta, String existencia) {
        this.id = id;
        this.producto = producto;
        this.idmarca = idmarca;
        this.descripcion = descripcion;
        this.costo = costo;
        this.venta = venta;
        this.existencia = existencia;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getIdmarca() {
        return idmarca;
    }

    public void setIdmarca(String idmarca) {
        this.idmarca = idmarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public String getVenta() {
        return venta;
    }

    public void setVenta(String venta) {
        this.venta = venta;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }
    
    public int agregar(){return 0;
}
    public int modificar(){return 0;
}
    public int eliminar(){return 0;
}
}
