<%-- 
    Document   : LoginOUT
    Created on : 14-oct-2018, 18:54:38
    Author     : Iván
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Enumeration enume = session.getAttributeNames();
    HttpSession nSesion = null;
    while (enume.hasMoreElements()) {
        if (enume.nextElement().equals("DENTRO")) {
            nSesion = request.getSession();
        }
    }
    nSesion.invalidate();
    response.sendRedirect("./Login.jsp");
%>