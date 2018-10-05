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
    <%
        String mensaje = "";
        int contador = 0;
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("CONTADOR")) {
                cookie = cookies[i];
                break;
            }
        }
        if (cookies == null) {
            contador = 1;
            cookie = new Cookie("CONTADOR", "" + contador);
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
            mensaje = "Nombre:" + cookie.getName() + " Valor: " + cookie.getValue()
                    + " Ruta: " + cookie.getPath() + " Duracion: " + cookie.getMaxAge() + " Dominio: " + cookie.getDomain();

        } else if (request.getParameter("Enviar").equals("Eliminar")) {
            if (cookies != null) {
                cookie.setMaxAge(0);
                cookie = null;
                mensaje = "La cookie se a eliminado";
            }
        } else {
            contador++;
            mensaje = " Nombre: " + cookie.getName() + " Valor: " + contador;
        }
        mensaje.replace(" ", "%20");
    %>
    <body>
        <h1>Hello World!</h1>
        <div><p>
                <%=mensaje%>
            </p>
            <p>
                <a href="./ContadorCookie.jsp"><input type="submit" name="Enviar" value="Recargar"></a>
                <a href="./ContadorCookie.jsp"><input type="submit" name="Enviar" value="Eliminar"></a>
                <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
            </p>
        </div>
    </body>
</html>
