<%-- 
    Document   : index
    Created on : 30/04/2018, 01:38:22 PM
    Author     : juanvargas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Gestión de productos |  Crea e-Commerce JAVA EE con pagos Online Paypal y Payu</title>
        <%@include file="../../WEB-INF/css.jsp"  %>
    </head><!--/head-->

    <body>
        <!-- Import Header--->	
        <%@include file="../../WEB-INF/header.jsp"  %>



        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">

                    </div>
                    <div class="col-sm-10 clearfix">

                        <h3>Gestionar producto</h3>
                        <form action="ControlProducto" method="POST">
                            <div class="form-one">
                                Nombre: <input type="text" name="nombre" placeholder="Nombre producto"  value="" requiered/>
                                Precio: <input type="number" name="precio" placeholder="Precio del producto" value="0" min="0" requiered/>
                                Precio promo:<input type="number" name="precionuevo" placeholder="Precio del producto" value="0" min="0" requiered/>
                                stock: <input type="number" name="cantidad" placeholder="cantidad" value="1" min="1"/>
                                Marca: <select name="marca">
                                    <option></option>
                                    <option></option>
                                </select>
                                Categoria: <select name="categoria">
                                    <option></option>
                                    <option></option>
                                </select>
                                Descripción<textarea name="descripcion" rows="4" cols="20" placeholder="Descripcion del producto" requiered>
                                </textarea>
                                Nuevo?:<input type="checkbox" name="nuevo" value="ON" checked="checked" />
                                Recomendado?:<input type="checkbox" name="recomendado" value="OFF" />
                                Visible?:<input type="checkbox" name="visible" value="ON" checked="checked" />
                                <input type="file" name="imagen" value="seleccionar una imagen" requiered />
                                <input class="btn btn-success" name="accion" type="submit" value="Registrar" />
                                <input class="btn btn-primary" name="accion" type="submit" value="Consultar" />
                                <input class="btn btn-warning" name="accion" type="submit" value="Actualizar" />
                                <input class="btn btn-danger" name="accion" type="submit" value="Borrar" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </section>
        <!-- Import Footer -->  
        <%@include file="../../WEB-INF/footer.jsp"  %>

        <!-- Import js -->  
        <%@include file="../../WEB-INF/js.jsp"  %>
    </body>
</html>
