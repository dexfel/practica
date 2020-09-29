<%-- 
    Document   : index
    Created on : 22/09/2020, 23:56:51
    Author     : DANY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="modelo.Marca" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    </head>


    <h1>Ingreso Productos</h1>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>

    <div class="container">
        <div class="modal fade" id="modal_empleado" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <form action="sr_productos" method="post" class="form-group">
                            <label for="lbl_id" ><b>ID</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                            <label for="lbl_producto">Producto:</label>
                            <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Galletas" required>
                            <label for="lbl_idmarca">IDMarca:</label>
                            <input type="text" name="txt_idmarca" id="txt_idmarca" class="form-control" placeholder="M003" required>
                            <label for="lbl_descripcion">Descripcion:</label>
                            <input type="text" name="txt_descripcion" id="txt_descripicion" class="form-control" placeholder="Azul" required>
                            <label for="lbl_costo">Costo:</label>
                            <input type="text" name="txt_costo" id="txt_costo" class="form-control" placeholder="Q135" required>
                            <label for="lbl_venta">Venta:</label>
                            <input type="text" name="txt_venta" id="txt_venta" class="form-control" placeholder="Q150" required>
                            <label for="lbl_existencia">Existencia:</label>
                            <input type="text" name="txt_existencia" id="txt_existencia" class="form-control" placeholder='1000' required>
                            <br>
                            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary">Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger">Eliminar</button>

                        </form>

                    </div>
                </div>

            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>

                    <th>PRODUCTO</th>
                    <th>IDMARCA</th>
                    <th>DESCRIPCION</th>
                    <th>COSTO</th>
                    <th>VENTA</th>
                    <th>EXISTENCIA</th>

                </tr>
            </thead>
            <tbody id="tbl_Productos">
                <%
                    Marca marca = new Marca();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = marca.leer();
                    for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                        out.println("</tr>");
                    }
                %>

            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


    <script type="text/javascript">
        function limpiar() {
            $("#txt_id").val(0);
            $("#txt_producto").val('');
            $("#txt_idmarca").val('');
            $("#txt_descripcion").val('');
            $("#txt_costo").val('');
            $("#txt_venta").val('');
            $("#txt_existencia").val('');

        }

        $('#tbl_productos').on('click', 'tr td', function (evt) {
            var target, id, producto, idmarca, descripcion, costo, venta, existencia;
            target = $(event.target);
            id = target.parent().data('id');
            producto = target.parent("tr").find("td").eq(0).html();
            idmarca = target.parent("tr").find("td").eq(1).html();
            descripcion = target.parent("tr").find("td").eq(2).html();
            costo = target.parent("tr").find("td").eq(3).html();
            venta = target.parent("tr").find("td").eq(4).html();
            existencia = target.parent("tr").find("td").eq(5).html();
            $("#txt_id").val(id);
            $("#txt_producto").val(producto);
            $("#txt_idmarca").val(idmarca);
            $("#txt_descripcion").val(descripcion);
            $("#txt_costo").val(costo);
            $("#txt_venta").val(venta);
            $("#txt_existencia").val(existencia);
            $("#modal_productos").modal('show');
        }
        );

    </script>

</html>

