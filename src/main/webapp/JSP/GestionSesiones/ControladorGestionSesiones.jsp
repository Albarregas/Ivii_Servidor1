<%-- 
    Document   : ControladorGestionSesiones
    Created on : 08-oct-2018, 17:05:27
    Author     : Iván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getParameter("enviar").equals("Inicio")){
    
}else{
    if(nombre.length()!0){
    String string=(String) sesion.getAttribute(nombre);
    switch(request.getParameter("enviar")){
        case "Crear":
            if(string==null){
                sesion.setAttribute(nombre,request.getParameter("valor"));
                //mensaje
            }else{
                
            }
            break;
        case "Visualizar":
            if(string!=null){
                //String
            }
            break;
        case "Modificar":
            if
            break;
        case "Eliminar":
            break;
    }
}
}
sesion.setAtributte();
%>