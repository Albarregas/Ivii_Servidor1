<%-- 
    Document   : InterfazCookies
    Created on : 04-oct-2018, 20:50:00
    Author     : Daw2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="./ControlCookies.jsp" method="post">
            <h2>Control de Cookies</h2>
            <div>
                <p>
                    <label for="nombre">Nombre: </label>
                    <input id="nombre" type="text" name="Nombre" value="" placeholder="Nombre"/>
                </p>
                <p>
                    <label for="valor">Valor: </label>
                    <input id="valor" type="text" name="Valor" value="" placeholder="Valor"/> 
                </p>
                <%
                    String mensaje = (request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "");
                %>
                <p><%=mensaje%></p>
                <p>
                    <input type="submit" name="Enviar" value="Crear">
                    <input type="submit" name="Enviar" value="Visualizar">
                    <input type="submit" name="Enviar" value="Modificar">
                    <input type="submit" name="Enviar" value="Eliminar">
                </p>
                <p>
                    <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
                </p>


            </div>
        </form>
    </body>
</html>
