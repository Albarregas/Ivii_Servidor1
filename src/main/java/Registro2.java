/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ivan9
 */
@WebServlet(urlPatterns = {"/Registro"})
public class Registro2 extends HttpServlet {

    protected String mostrarDatos(Map datos) {
        Set se = datos.keySet();
        StringBuilder sb = new StringBuilder();
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        sb.append("<h1>Datos Guardados</h1>");
        for (Iterator iterator = se.iterator(); iterator.hasNext();) {
            String dato = (String) iterator.next();
            String resultado[] = (String[]) datos.get(dato);

            if (!dato.equals("Enviar") && !dato.equals("Dia") && !dato.equals("Mes") && !dato.equals("Anios")) {
                sb.append("<p>");
                sb.append(dato);
                sb.append(": ");

                for (int i = 0; i < resultado.length; i++) {

                    if (i > 0) {
                        sb.append(",");
                        sb.append(resultado[i]);
                    } else {
                        sb.append(resultado[i]);
                    }
                }

                sb.append("</p>");
            }
            if (dato.equals("Dia")) {
                sb.append("<p>Fecha de nacimiento: ");
                sb.append(resultado[0]);
                sb.append(" de ");
            } else if (dato.equals("Mes")) {
                sb.append(meses[Integer.parseInt(resultado[0]) - 1]);
                sb.append(" de ");
            } else if (dato.equals("Anios")) {
                sb.append(resultado[0]);
                sb.append("</p>");
            }

        }
        return sb.toString();
    }

    protected String mostrarErrores(Map datos) {
        Set se = datos.keySet();
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>Error en el formulario</h1>"
                + "<form action=\"Registro\" method>");
        for (Iterator iterator = se.iterator(); iterator.hasNext();) {
            String dato = (String) iterator.next();
            String resultado[] = (String[]) datos.get(dato);
            for (int i = 0; i < resultado.length; i++) {
                sb.append("<input type=\"hidden\" name=\""+dato+"\" value=\""+resultado[i]+"\"");
            }
            
        }
        sb.append("<input type=\"submit\" name=\"Enviar\" value=\"Enviar\">");
        sb.append("</form>");
        return sb.toString();
    }

    protected ArrayList<String> consultarErrores(Map datos) {
        Set se = datos.keySet();
        ArrayList<String> errores = new ArrayList<String>();
        int dia = 0, mes = 0, anio = 0;
        int i = 0;
        for (Iterator iterator = se.iterator(); iterator.hasNext();) {
            String dato = (String) iterator.next();
            String resultado[] = (String[]) datos.get(dato);
            if (resultado[0].equals("")) {
                errores.add(dato);
            }
            if (dato.equals("dia")) {
                dia = Integer.parseInt(resultado[0]);
            }
            if (dato.equals("mes")) {
                mes = Integer.parseInt(resultado[0]) - 1;
            }
            if (dato.equals("anio")) {
                anio = Integer.parseInt(resultado[0]);
            }
            i++;
        }
        if (!consultarFecha(dia, mes, anio)) {
            errores.add("fecha");
        }
        return errores;
    }

    protected boolean consultarFecha(int dia, int mes, int anio) {
        boolean diaCorrecto = false;
        int[] diaMeses = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        if ((anio % 4 == 0) && (anio % 100 != 0)) {
            diaMeses[1] = 29;
        }

        if (diaMeses[mes] > dia) {
            diaCorrecto = true;
        }
        diaMeses[1] = 28;
        return diaCorrecto;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. ArrayList<String> errores = consultarErrores(datos); for (Object
     * object : errores) { out.print("
     * <p>
     * " + object + "</p>"); } datos.get("dia"); se sacaria el dia
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String correcto = "Correcto";
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");
            out.println("</head>");
            out.println("<body>");
            Map<String, String[]> datos = request.getParameterMap();
            ArrayList<String> errores = consultarErrores(datos);
            if (errores.isEmpty()) {
                String url = "<a href=\"" + request.getContextPath() + "\"><button>Volver</button></a>";
                out.println(mostrarDatos(datos) + url);

            } else {
                out.println(mostrarErrores(datos));
                out.println("<form  id=\"form\" action=\"Registro\" method=\"post\">\n"
                        + "            <h1>Datos Personales</h1>\n"
                        + "            <div id=\"nombre\">\n"
                        + "                <label for=\"nombre\">Nombre:</label>\n");
                if (errores.contains("Nombre")) {
                    correcto = "X";
                }
                out.println("              <input type=\"text\" name=\"Nombre\" value=\"" + request.getParameter("Nombre") + "\"/>" + correcto + "\n"
                        + "            </div>\n"
                        + "            <div>\n"
                        + "                <label for=\"nombre\">Apellidos:</label>\n"
                        + "                <input type=\"text\" name=\"Apellidos\" value=\"" + request.getParameter("Apellidos") + "\"/>\n"
                        + "            </div>");
                String H = "", M = "";
                if (request.getParameter("Genero").equals("hombre")) {
                    H = "checked";
                } else {
                    M = "checked";
                }
                out.println("<div>\n"
                        + "                Sexo:<br>\n"
                        + "                <input type=\"radio\" name=\"Genero\" value=\"hombre\" " + H + "> Hombre\n"
                        + "                <input type=\"radio\" name=\"Genero\" value=\"mujer\"" + M + "> Mujer\n"
                        + "            </div>");
                out.println("<div>\n"
                        + "                Fecha:\n"
                        + "                <select name=\"Dia\">");
                for (int i = 1; i <= 31; i++) {
                    if (Integer.parseInt(request.getParameter("Dia")) == i) {
                        out.println("<option value=\"" + i + "\" selected>" + i + "</option>");
                    } else {
                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                    }
                }
                out.println("</select> \n"
                        + "                <select name=\"Mes\">");
                for (int i = 1; i <= 12; i++) {
                    if (Integer.parseInt(request.getParameter("Mes")) == i) {
                        out.println("<option value=\"" + i + "\" selected>" + i + "</option>");
                    } else {
                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                    }
                }
                out.println("</select> \n"
                        + "                <select name=\"Anios\">");
                for (int i = 1970; i <= 2000; i++) {
                    if (Integer.parseInt(request.getParameter("Anios")) == i) {
                        out.println("<option value=\"" + i + "\" selected>" + i + "</option>");
                    } else {
                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                    }
                }
                out.println("  </select> \n"
                        + "            </div>\n"
                        + "            <h1>Datos de acceso</h1>\n");
                correcto = "Correcto";
                if (errores.contains("Usuario")) {
                    correcto = "X";

                }
                out.println("<label for=\"usuario\">Usuario  <input id=\"usuario\" type=\"text\" name=\"Usuario\" value=\"" + request.getParameter("Usuario") + "\">" + correcto + "</label><br>");
                correcto = "Correcto";
                if (errores.contains("Password")) {
                    correcto = "X";
                }
                out.println("<label for=\"pass\">Contraseña  <input id=\"pass\" type=\"password\" name=\"Password\" value=\"" + request.getParameter("Password") + "\">" + correcto + "</label>\n"
                        + "            <h1>Informacion General</h1>\n"
                        + "            <div>");

                String[] prefMarcadas = datos.get("Preferencia");
                String[] preferencias = {"Deportes", "Lectura", "Compras", "Cocinar"};

                for (int i = 0; i < preferencias.length; i++) {
                    out.println("<input type=\"checkbox\" name=\"Preferencia\" value=\"" + preferencias[i] + "\"");
                    if (prefMarcadas != null) {
                        for (int j = 0; j < prefMarcadas.length; j++) {
                            if (preferencias[i].equals(prefMarcadas[j])) {
                                out.println("checked");
                            }
                        }
                    }
                    out.println("> " + preferencias[i] + "<br>");
                }
                out.println("<div class=\"button\">\n"
                        + "                <input type=\"submit\" name=\"Enviar\" value=\"Enviar\">\n"
                        + "                <a href=\"Registro.html\"><button>Limpiar</button></a>\n"
                        + "            </div>");
                out.println("</form>");
            }
            out.println("</body>");
            out.println("</html>");
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
