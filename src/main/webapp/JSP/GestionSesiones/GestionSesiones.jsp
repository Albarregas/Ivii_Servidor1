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
        <h1>Hello World!</h1>
        <p>
            <label for="nombre">Nombre: </label>
            <input id="nombre" type="text" name="Nombre" value="" placeholder="Nombre"/>
        </p>
        <p>
            <label for="valor">Valor: </label>
            <input id="valor" type="text" name="Valor" value="" placeholder="Valor"/> 
        </p>
        <%
        //HTTPSession sesion=request.getSession();
        
        %>
        <% %> 
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
</body>s
</html>
