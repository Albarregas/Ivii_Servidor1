/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daw2
 */
@WebServlet(urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {
    protected String nombre,apellidos,genero="";
    protected String generarPagina() {
        String pagina = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <head>\n"
                + "        <title>TODO supply a title</title>\n"
                + "        <meta charset=\"UTF-8\">\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <form  id=\"form\" action=\"../Registro\" method=\"post\">\n"
                + "            <h1>Datos Personales</h1>\n"
                + "            <div id=\"nombre\">\n"
                + "                <label for=\"nombre\">Nombre:</label>\n"
                + "                <input type=\"text\" id=\"nombre\" value=\""+nombre+"\"/>\n"
                + "            </div>\n"
                + "            <div>   \n"
                + "                <label for=\"nombre\">Apellidos:</label>\n"
                + "                <input type=\"text\" id=\"apellidos\" value=\""+apellidos+"\"/>\n"
                + "            </div>\n"
                + "            <div>\n"
                + "                <label for=\"mail\">E-mail:</label>\n"
                + "                <input type=\"email\" id=\"mail\" />\n"
                + "            </div>\n"
                + "            <div>\n"
                + "                Sexo:<br>\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"hombre\"> Hombre\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"mujer\"> Mujer\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"otro\"> Otro\n"
                + "            </div>\n"
                + "            <!--<div>\n"
                + "                Fecha:<input type=\"date\">\n"
                + "            </div>-->\n"
                + "            <div class=\"button\">\n"
                + "                <button type=\"submit\">Enviar</button>\n"
                + "                <button type=\"reset\">Cancelar</button>\n"
                + "            </div>\n"
                + "        </form>\n"
                + "    </body>\n"
                + "</html>";
        return pagina;
    }
    protected void adivinarGenero(){
        
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean on = true;
        while (on) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                nombre = request.getParameter("nombre");
                apellidos=request.getParameter("apellidos");
                genero=request.getParameter("genero");
                out.println(generarPagina());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
