<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="modelo.Item"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <h:head>
        <title>Carrito de Compras</title>
        <%@include file="assets.jsp"%>
    </h:head>
    <h:body>
        <%@include file="menu.jsp"%>
        <div class="container">
            <h1>Carrito de Compras</h1>
            <div class="row">
                <div class="col-md-10">
                    <div class="border">
                        <h3>INGRESO DE PRODUCTOS</h3>

                        <form action="Productos" method="POST">
                                <div class="form-group p-2">
                                    <label for="producto">Nombre del Producto:</label>
                                    <input id="producto" name="producto" class="form-control" value="${Item.nombre}" title="Producto" required="true" requiredMessage="Nombre del producto es requerido." />
                                </div>
                                <div class="form-group p-2">
                                    <label for="precio">Precio del Producto</label>
                                    <input  id="precio" name="precio" class="form-control" value="${Item.precio}" title="Precio" required="true" requiredMessage="El precio del producto es requerido." />
                                </div>
                                <div class="form-group p-2">
                                    <label for="cantidad">Cantidad</label>
                                    <input id="cantidad" name="cantidad" class="form-control" value="${Item.cantidad}" title="Cantidad" required="true" requiredMessage="La cantidad es requerida." />
                                </div>
                                <div class="text-center p-2">
                                    <input type="submit" class="btn btn-success w-25" name="accion" value="AGREGAR"/>
                                    <a class="btn btn-danger" href="VaciarCarrito">RESET</a>
                                </div>                                     
                            <form>

                    </div>
                    <div>
                        <h3>ESTADO DEL CARRITO DE COMPRA</h3>
                       <table class="table table-bordered" id="tablaCarrito" headerClass="text-center">
                           <thead>
                               <tr class="text-center">
                                   <th>Nombre del Producto</th>
                                   <th>Precio</th>
                                   <th>Unidades</th>
                                   <th>Precio Producto</th>
                                   <th>Acciones</th>
                               </tr>
                           </thead>
                           <tbody>
                               <c:forEach items="${carritoCompras}" var="prod">
                                   <tr>
                                       <td>${prod.nombre}</td>
                                       <td class="text-right">$ ${prod.precio}</td>
                                       <td class="text-right">${prod.cantidad}</td>
                                       <td class="total text-right">$ ${prod.precio * prod.cantidad}</td>
                                       <td class="text-center"><a class="btn btn-sm btn-danger" href="EliminarItem?ItemName=${prod.nombre}">Eliminar</a></td>
                                   </tr>
                               </c:forEach>
                           </tbody>                           
                       </table>                              
                    </div>
                    <div class="row justify-content-end pr-3">
                    <div class="pr-2">
                        <span> Total Carrito: </span>  
                    </div>
                    <div class="border rounded w-25 text-right">
                        <span class="font-weight-bold pr-3" id="sum"></span>
                    </div>                                
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
               var sum = 0;
            
            $(".total").each(function(){
                sum += parseFloat($(this).text().replace("$ ",""));
            });
            
            $("#sum").html("$ " +sum);
            
            $("#cantidad").val(1);
        </script>      
    </h:body>    
</html>
