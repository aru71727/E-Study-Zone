/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;
import MyPackage.ConnectionManager;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import oracle.net.aso.e;

/**
 *
 * @author Aradhana
 */
@MultipartConfig
@WebServlet(name = "upload", urlPatterns = {"/upload"})
public class upload extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet upload at " + request.getContextPath() + "</h1>");
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
        try {
            String subject = request.getParameter("subject");
            String description = request.getParameter("description");
            Part p = request.getPart("file");
            String filename = p.getSubmittedFileName();
            InputStream is = p.getInputStream();
            ConnectionManager cm = new ConnectionManager();
            ResultSet rs = cm.selectQuery("select nvl(max(id),0)+1 from Studymaterial");
            rs.next();
            int id = rs.getInt(1);
            String cdate = new java.text.SimpleDateFormat("dd/MM/yyyy hh:mm:ss").format(new java.util.Date());
            String query = "insert into studymaterial values('" + id + "','" + subject + "','" + description + "','" + (id + filename) + "','" + cdate + "')";
            if (cm.executeNonQuery(query) == true) {
                File f = new File(request.getRealPath("/upload"), id + filename);
                Files.copy(is, f.toPath());
                response.sendRedirect("adminzone/studymaterialupload.jsp?s=saved");
            } else {
                response.sendRedirect("adminZone/studymaterialupload.jsp?s=not");
            }
        } catch (Exception e) {
            response.sendRedirect("adminzone/studymaterialupload.jsp?err=" + e);
        }

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
