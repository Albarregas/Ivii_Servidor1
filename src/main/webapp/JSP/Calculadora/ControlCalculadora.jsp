<%-- 
    Document   : ControlCalculadora
    Created on : 07-oct-2018, 16:36:26
    Author     : ivan9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String mensaje = "";
    double valor1 = 0;
    double valor2 = 0;
    try {
        valor1 = Double.parseDouble(request.getParameter("Valor1"));
        valor2 = Double.parseDouble(request.getParameter("Valor2"));
    } catch (NumberFormatException e) {
        mensaje = "Por favor ingrese un numero correcto";
    } catch (Exception e) {
        mensaje = "Error del sistema";
    }

    if (request.getParameter("Enviar").equals("Sumar")) {
        mensaje = "La Suma da como resultado: " + (valor1 + valor2);
    } else if (request.getParameter("Enviar").equals("Restar")) {
        mensaje = "La Resta da como resultado: " + (valor1 - valor2);
    } else if (request.getParameter("Enviar").equals("Multiplicar")) {
        mensaje = "La Multiplicacion da como resultado: " + (valor1 * valor2);
    } else if (request.getParameter("Enviar").equals("Dividir")) {
        mensaje = "La Division da como resultado: " + (valor1 / valor2);
    } else {
        mensaje = "Error al hacer la cuenta";
    }
    mensaje.replace(" ","%20");
    response.sendRedirect("Calculadora.jsp?mensaje=" + mensaje);
%>
