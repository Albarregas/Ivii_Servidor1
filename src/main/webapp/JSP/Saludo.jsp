<%-- 
    Document   : Saludo
    Created on : 01-oct-2018, 16:56:01
    Author     : Ivii
--%>

<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            String tratamiento="";
            if(request.getParameter("Genero").equals("Hombre")){
                tratamiento="señor";
            }else{
                tratamiento="señora";
            }
            
            int hora=LocalTime.now().getHour();
            String saludo="";
            if(hora>=8 && hora<13){
                saludo="Buenos dias";
            }else if(hora>=13 && hora <19){
                saludo="Buenas tardes";
            }else{
                saludo="Buenas noches";
            }
         %>
         
         <h1>
             <% out.println(saludo+" "+tratamiento+" "+request.getParameter("Nombre")); %> 
             
         </h1>
             <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
    </body>
</html>
