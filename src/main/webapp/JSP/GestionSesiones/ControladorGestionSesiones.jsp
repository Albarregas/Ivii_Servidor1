<%-- 
    Document   : ControladorGestionSesiones
    Created on : 08-oct-2018, 17:05:27
    Author     : Iván
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StringBuilder sb = new StringBuilder();
    String url = "./GestionSesiones.jsp";
    String nombre = request.getParameter("Nombre");
    String valor = request.getParameter("Valor");
    Enumeration enume = session.getAttributeNames();
    HttpSession nSesion = null;
    while (enume.hasMoreElements()) {
        if (enume.nextElement().equals(nombre)) {
            nSesion = request.getSession();
        }
    }
    switch (request.getParameter("Enviar")) {
        case "Crear":
            if (nSesion == null) {
                if(valor!=""){
                  nSesion = request.getSession();
                nSesion.setMaxInactiveInterval(60 * 5);
                nSesion.setAttribute(nombre, valor);
                sb.append("Sesion creada");  
                }else{
                    sb.append("Introduce algun valor");
                }
                
            } else {
                sb.append("La sesion ya existe");
            }
            break;
        case "Visualizar":
            if (nSesion != null) {
                sb.append("La sesion tiene de nombre: " + nombre + " y de valor: " + nSesion.getAttribute(nombre + ""));
            } else {
                sb.append("La sesion no existe");
            }
            break;
        case "Modificar":
            if (nSesion != null) {
                nSesion.setAttribute(nombre + "", valor);
                sb.append("La sesion esta modificada");
            } else {
                sb.append("La sesion no se a creado");
            }
            break;
        case "Eliminar":
            if (nSesion != null) {
                nSesion.invalidate();
                session=request.getSession();
                sb.append("La sesion se a eliminado");
            } else {
                sb.append("La sesion no existe");
            }
            break;
    }

    session.setAttribute("mensaje", sb.toString());
    response.sendRedirect(url);
%>
