<%-- 
    Document   : CalcularEdad
    Created on : 01-oct-2018, 17:33:29
    Author     : Daw2
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fecha = request.getParameter("Fecha");
            

        %>

        <h1>
            <% out.println("La edad de " + request.getParameter("Nombre") + " es: " +fecha);%> 

        </h1>
    </body>
</html>
