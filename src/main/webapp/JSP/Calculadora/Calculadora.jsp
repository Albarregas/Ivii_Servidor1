<%-- 
    Document   : calculadora
    Created on : 04-oct-2018, 21:13:59
    Author     : Ivii
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
Sume Reste Multiplique y divida en numeros reales que no deje dividir por cero
---%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculadora</h1>
        <form action="./ControlCalculadora.jsp" method="post">
        <div>
            <p>
                <label for="nombre">Nombre: </label>
                <input id="Valor1" type="text" name="Valor1" value="" placeholder="Valor 1"/>
            </p>
            <p>
                <label for="valor">Valor: </label>
                <input id="Valor2" type="text" name="Valor2" value="" placeholder="Valor 2"/> 
            </p>

            <%
                 SimpleDateFormat formateador=new SimpleDateFormat("EEEEE, dd 'de' MMMM 'de' yyyy",new Locale("ES"));
                Date fecha=new Date();
                String fechaActual=formateador.format(fecha);
                String mensaje = (request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "");
            %>
            <p><%= mensaje%></p>
            <p>
                <input type="submit" name="Enviar" value="Sumar">
                <input type="submit" name="Enviar" value="Restar">
                <input type="submit" name="Enviar" value="Multiplicar">
                <input type="submit" name="Enviar" value="Dividir">
            </p>
            <p><%= fechaActual%></p>
        </div>
        </form>
        <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
    </body>
</html>
