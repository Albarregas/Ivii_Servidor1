<%-- 
    Document   : LoginIN
    Created on : 14-oct-2018, 18:55:01
    Author     : Iván
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String UsuarioGuardado = "admin", PassGuardada = "admin";
    String Usuario = request.getParameter("Usuario");
    String Pass = request.getParameter("Pass");
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    if (Usuario.equals(UsuarioGuardado) && Pass.equals(PassGuardada)) {

        HttpSession dentro = request.getSession();
        dentro.setAttribute("DENTRO", "ESTA DENTRO");
        if (request.getParameter("Recordar") != null) {
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals(Usuario)) {
                        cookie = cookies[i];
                        break;
                    }
                }
                if (cookie == null) {
                    cookie = new Cookie(Usuario, Pass);

                    
                } else {
                    cookie.setValue(Pass);
                }
            }
            /*if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("FECHA")) {
                    cookie = cookies[i];
                    break;
                }
            }
            if (cookie == null) {
                SimpleDateFormat formateador = new SimpleDateFormat("hh:mm EEEEE, dd 'de' MMMM 'de' yyyy", new Locale("ES"));
                Date fecha = new Date();
                String fechaActual = formateador.format(fecha);
                response.sendRedirect("./Menu.jsp?fecha=" + fechaActual);
            } else {
                
            }
             */
        } else {
            response.sendRedirect("./Login.jsp?mensaje=" + "Error,usuario o contrasenia incorrectos");
        }

%>