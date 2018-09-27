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

    protected String nombre, apellidos, genero, hombre, mujer, otro = "";
    protected int dia, mes, anio=0;

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
                + "                <input type=\"text\" id=\"nombre\" value=\"" + nombre + "\"/>\n"
                + "            </div>\n"
                + "            <div>   \n"
                + "                <label for=\"nombre\">Apellidos:</label>\n"
                + "                <input type=\"text\" id=\"apellidos\" value=\"" + apellidos + "\"/>\n"
                + "            </div>\n"
                + "            <div>\n"
                + "                <label for=\"mail\">E-mail:</label>\n"
                + "                <input type=\"email\" id=\"mail\" />\n"
                + "            </div>\n"
                + "            <div>\n"
                + "                Sexo:<br>\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"hombre\" " + hombre + "> Hombre\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"mujer\" " + mujer + "> Mujer\n"
                + "                <input type=\"radio\" name=\"genero\" value=\"otro\" " + otro + "> Otro\n"
                + "            </div>\n"
                + "            <div>\n"
                + "                Fecha:\n"
                + "                <select>\n"
                + "                    <option value=\"1\">1</option>\n"
                + "                    <option value=\"2\">2</option>\n"
                + "                    <option value=\"3\">3</option>\n"
                + "                    <option value=\"4\">4</option>\n"
                + "                    <option value=\"5\">5</option>\n"
                + "                    <option value=\"6\">6</option>\n"
                + "                    <option value=\"7\">7</option>\n"
                + "                    <option value=\"8\">8</option>\n"
                + "                    <option value=\"9\">9</option>\n"
                + "                    <option value=\"10\">10</option>\n"
                + "                    <option value=\"11\">11</option>\n"
                + "                    <option value=\"12\">12</option>\n"
                + "                    <option value=\"13\">13</option>\n"
                + "                    <option value=\"14\">14</option>\n"
                + "                    <option value=\"15\">15</option>\n"
                + "                    <option value=\"16\">16</option>\n"
                + "                    <option value=\"17\">17</option>\n"
                + "                    <option value=\"18\">18</option>\n"
                + "                    <option value=\"19\">19</option>\n"
                + "                    <option value=\"20\">20</option>\n"
                + "                    <option value=\"21\">21</option>\n"
                + "                    <option value=\"22\">22</option>\n"
                + "                    <option value=\"23\">23</option>\n"
                + "                    <option value=\"24\">24</option>\n"
                + "                    <option value=\"25\">25</option>\n"
                + "                    <option value=\"26\">26</option>\n"
                + "                    <option value=\"27\">27</option>\n"
                + "                    <option value=\"28\">28</option>\n"
                + "                    <option value=\"29\">29</option>\n"
                + "                    <option value=\"30\">30</option>\n"
                + "                    <option value=\"31\">31</option>\n"
                + "                </select> \n"
                + "                <select>\n"
                + "                    <option value=\"01\">01</option>\n"
                + "                    <option value=\"02\">02</option>\n"
                + "                    <option value=\"03\">03</option>\n"
                + "                    <option value=\"04\">04</option>\n"
                + "                    <option value=\"05\">05</option>\n"
                + "                    <option value=\"06\">06</option>\n"
                + "                    <option value=\"07\">07</option>\n"
                + "                    <option value=\"08\">08</option>\n"
                + "                    <option value=\"09\">09</option>\n"
                + "                    <option value=\"10\">10</option>\n"
                + "                    <option value=\"11\">11</option>\n"
                + "                    <option value=\"12\">12</option>\n"
                + "                </select> \n"
                + "                <select>\n"
                + "                    <option value=\"1970\">1970</option>\n"
                + "                    <option value=\"1971\">1971</option>\n"
                + "                    <option value=\"1972\">1972</option>\n"
                + "                    <option value=\"1973\">1973</option>\n"
                + "                    <option value=\"1974\">1974</option>\n"
                + "                    <option value=\"1975\">1975</option>\n"
                + "                    <option value=\"1976\">1976</option>\n"
                + "                    <option value=\"1977\">1977</option>\n"
                + "                    <option value=\"1978\">1978</option>\n"
                + "                    <option value=\"1979\">1979</option>\n"
                + "                    <option value=\"1980\">1980</option>\n"
                + "                    <option value=\"1981\">1981</option>\n"
                + "                    <option value=\"1982\">1982</option>\n"
                + "                    <option value=\"1983\">1983</option>\n"
                + "                    <option value=\"1984\">1984</option>\n"
                + "                    <option value=\"1985\">1985</option>\n"
                + "                    <option value=\"1986\">1986</option>\n"
                + "                    <option value=\"1987\">1987</option>\n"
                + "                    <option value=\"1988\">1988</option>\n"
                + "                    <option value=\"1989\">1989</option>\n"
                + "                    <option value=\"1990\">1990</option>\n"
                + "                    <option value=\"1991\">1991</option>\n"
                + "                    <option value=\"1992\">1992</option>\n"
                + "                    <option value=\"1993\">1993</option>\n"
                + "                    <option value=\"1994\">1994</option>\n"
                + "                    <option value=\"1995\">1995</option>\n"
                + "                    <option value=\"1996\">1996</option>\n"
                + "                    <option value=\"1997\">1997</option>\n"
                + "                    <option value=\"1998\">1998</option>\n"
                + "                    <option value=\"1999\">1999</option>\n"
                + "                    <option value=\"2000\">2000</option>\n"
                + "                    <option value=\""+anio+"\">"+anio+"</option>\n"
                + "                </select> \n"
                + "            </div>\n"
                + "            <div class=\"button\">\n"
                + "                <button type=\"submit\">Enviar</button>\n"
                + "                <button type=\"reset\">Cancelar</button>\n"
                + "            </div>\n"
                + "        </form>\n"
                + "    </body>\n"
                + "</html>";
        return pagina;
    }

    protected void adivinarGenero() {
        if (genero.equals("Hombre")) {
            hombre = "checked=\"\"";
        } else if (genero.equals("Mujer")) {
            mujer = "checked=\"\"";
        } else {
            otro = "checked=\"\"";
        }
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
                apellidos = request.getParameter("apellidos");
                genero = request.getParameter("genero");
                adivinarGenero();
                //dia=request.getParameter("dia");
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
