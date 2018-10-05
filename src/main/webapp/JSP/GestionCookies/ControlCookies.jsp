<%-- 
    Document   : ControlCookies
    Created on : 04-oct-2018, 20:35:05
    Author     : Daw2
    crear cookies visualizar modificar eliminar
    llamar de una pagina jsp a otra
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    String nombre = request.getParameter("Nombre");
    String valor=request.getParameter("Valor");
    Cookie cookie = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if(cookies[i].getName().equals(nombre)){
                cookie=cookies[i];
                break;
            }
        }
    }
    if(request.getParameter("Enviar").equals("Crear")){
        if(cookies==null){
            cookie=new Cookie(nombre,request.getParameter("Valor"));
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
            mensaje="Nombre:"+cookie.getName()+" Valor: "+cookie.getValue();
            
        }else{
            mensaje="Cookie no creada";
        }
    }else if(request.getParameter("Enviar").equals("Visualizar")){
        if(cookies!=null){
            //cookie=new Cookie(nombre,cookie.getValue());
            mensaje="La cookie: "+cookie.getName()+" tiene de valor: "+cookie.getValue();
        }else{
            mensaje="La cookie no existe";
        }
    }else if(request.getParameter("Enviar").equals("Modificar")){
        if(cookies!=null){
            cookie.setValue(valor);
            response.addCookie(cookie);
            mensaje="Nombre:"+cookie.getName()+" Valor: "+cookie.getValue();
        }else{
            mensaje="La cookie no existe";
        }
    }else if(request.getParameter("Enviar").equals("Eliminar")){
        if(cookies!=null){
            cookie.setMaxAge(0);
            mensaje="La cookie se a eliminado";
        }else{
            mensaje="La cookie no existe";
        }
    }
    mensaje.replace(" ","%20");
    response.sendRedirect("InterfazCookies.jsp?mensaje="+mensaje);
%>

