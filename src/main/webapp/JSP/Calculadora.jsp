<%-- 
    Document   : calculadora
    Created on : 04-oct-2018, 21:13:59
    Author     : Daw2
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

                String mensaje = "";
                double valor1 = 0;
                double valor2 = 0;
                try {
                    valor1 = Integer.parseInt(request.getParameter("Valor1"));
                    valor2 = Integer.parseInt(request.getParameter("Valor2"));
                } catch (NumberFormatException e) {
                    mensaje = "Por favor ingrese un numero correcto";
                } catch (Exception e) {
                    mensaje = "Error del sistema";
                }
                SimpleDateFormat formateador=new SimpleDateFormat("EEEEE, dd 'de' MMMM 'de' yyyy",new Locale("ES"));
                Date fecha=new Date();
                String fechaActual=formateador.format(fecha);
                if (request.getParameter("Enviar").equals("Sumar")) {
                    mensaje = "La Suma da como resultado: " + (valor1 + valor2);
                } else if (request.getParameter("Enviar").equals("Restar")) {
                    mensaje = "La Resta da como resultado: " + (valor1 - valor2);
                } else if (request.getParameter("Enviar").equals("Multiplicar")) {
                    mensaje = "La Multiplicacion da como resultado: "+(valor1 * valor2);
                } else if (request.getParameter("Enviar").equals("Dividir")) {
                    mensaje = "La Division da como resultado: "+(valor1 / valor2);
                } else {
                    mensaje = "Error al hacer la cuenta";
                }
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
        <a href="<%= request.getContextPath()%>"><input type="submit" name="Enviar" value="Volver"></a>
    </body>
</html>
