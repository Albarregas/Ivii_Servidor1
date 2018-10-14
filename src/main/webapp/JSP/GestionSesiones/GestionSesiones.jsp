<%-- 
    Document   : GestionSesiones
    Created on : 08-oct-2018, 17:01:43
    Author     : Iván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ControladorGestionSesiones.jsp" method="POST">

            <h1>JSP Page</h1>
            <p>
                <label for="nombre">Nombre: </label>
                <input id="nombre" type="text" name="Nombre" value="" placeholder="Nombre"/>
            </p>
            <p>
                <label for="valor">Valor: </label>
                <input id="valor" type="text" name="Valor" value="" placeholder="Valor"/> 
            </p>
            <%

                HttpSession sesion = request.getSession();

            %>
            <p>
                <%=(sesion.getAttribute("mensaje") != null) ? sesion.getAttribute("mensaje") : ""%> 
            </p>
            <p>
                <input type="submit" name="Enviar" value="Crear">
                <input type="submit" name="Enviar" value="Visualizar">
                <input type="submit" name="Enviar" value="Modificar">
                <input type="submit" name="Enviar" value="Eliminar">
            </p>
            <p>

            </p>


        </div>
    </form>
    <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
</body>
</html>
