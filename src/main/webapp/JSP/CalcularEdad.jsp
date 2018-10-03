<%-- 
    Document   : CalcularEdad
    Created on : 01-oct-2018, 17:33:29
    Author     : Daw2
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
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


        %>

        <h1>
            <%                String fechaObtenida = request.getParameter("Fecha");
                LocalDate fechaNac;
                try {
                    fechaNac = LocalDate.parse(fechaObtenida, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                } catch (Exception e) {
                    fechaNac = LocalDate.now();
                }
                LocalDate ahora = LocalDate.now();
                Period periodo = Period.between(fechaNac, ahora);
                String salidaDias = "", salidaMeses = "", salidaAnios = "";
                int dia, mes, anios;
                dia = periodo.getDays();
                mes = periodo.getMonths();
                anios = periodo.getMonths();
                if (anios > 0) {
                    if (anios != 1) {
                        salidaAnios = anios + " años,";
                    } else {
                        salidaAnios = anios + " año,";
                    }
                } else if (anios < 0) {
                    if (anios != -1) {
                        salidaAnios = anios + " años,";
                    } else {
                        salidaAnios = anios + " año,";
                    }
                } else {

                }
                if (mes > 0) {
                    if (mes != 1) {
                        salidaMeses = mes + " meses y";
                    } else {
                        salidaMeses = mes + " mes y";
                    }
                } else if (mes < 0) {
                    if (mes != -1) {
                        salidaMeses = mes + " meses y";
                    } else {
                        salidaMeses = mes + " mes y";
                    }
                } else {

                }
                if (dia > 0) {
                    if (dia != 1) {
                        salidaDias = dia + " dias";
                    } else {
                        salidaDias = dia + " dia";
                    }
                } else if (dia < 0) {
                    if (dia != -1) {
                        salidaDias = dia + " dias";
                    } else {
                        salidaDias = dia + " dia";
                    }
                } else {

                }
                out.println("Tu edad es: " + salidaAnios + salidaMeses + salidaDias);
            %> 

        </h1>
    </body>
</html>
