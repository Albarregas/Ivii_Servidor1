<%-- 
    Document   : ControlContador
    Created on : 07-oct-2018, 16:51:35
    Author     : ivan9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        String mensaje = "";
        int contador = 0;
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("CONTADOR")) {
                    cookie = cookies[i];
                    break;
                }
            }
        }
        if (cookie == null) {
            contador = 1;
            cookie = new Cookie("CONTADOR", "" + contador);
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
            mensaje = "Nombre:" + cookie.getName() + " Valor: " + cookie.getValue()
                    + " Ruta: " + cookie.getPath() + " Duracion: " + cookie.getMaxAge() + " Dominio: " + cookie.getDomain();
        }else if (request.getParameter("Enviar").equals("Eliminar")) {
                if (cookie != null) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    mensaje = "La cookie se a eliminado";
                } else {
                    mensaje = "La cookie no existe";
                }
            
        } else {
            
            contador = Integer.parseInt(cookie.getValue());
            contador++;
            cookie.setValue(contador + "");
            response.addCookie(cookie);
            mensaje = " Nombre: " + cookie.getName() + " Valor: " + contador;
        }
        mensaje.replace(" ", "%20");
        response.sendRedirect("ContadorCookie.jsp?mensaje="+mensaje);
    %>
