<%-- 
    Document   : Login
    Created on : 14-oct-2018, 18:47:53
    Author     : Iván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Identificacion</title>
    </head>
    <body>
        <h1>Identificacion</h1>
        <form action="./LoginIN.jsp" method="POST">
            <p>
                <label for="nombre">Usuario: </label>
                <input id="nombre" type="text" name="Usuario" value="" placeholder="Usuario"/>
            </p>
            <p>
                <label for="valor">Contraseña: </label>
                <input id="valor" type="text" name="Pass" value="" placeholder="Pass"/> 
            </p>
            
            <p>
                <input type="checkbox" name="Recordar"> ¿Quiere recordar el usuario?
            </p>
            <p>
                <input type="submit" name="Entrar" value="Entrar">
            </p>
            <p>
                <%= (request.getParameter("mensaje")!=null)? request.getParameter("mensaje"):""  %>
            </p>

       
    </form>
    <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
</body>
</html>
