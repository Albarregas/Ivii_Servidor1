<%-- 
    Document   : ContadorCookie
    Created on : 05-oct-2018, 16:17:30
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
        <h1>Contador con Cookies</h1>
        <form action="ControlContador.jsp" method="post">
        
        
        <%String mensaje = (request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "");%>
        <div>
            <p>
                <%=mensaje%>
            </p>
            <p>
                <a href="./ContadorCookie.jsp"><input type="submit" name="Enviar" value="Recargar"></a>
               <input type="submit" name="Enviar" value="Eliminar">
                
            </p>
        </div>
        </form>
            <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
    </body>
</html>
