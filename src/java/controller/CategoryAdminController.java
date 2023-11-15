/*
 * 
 */
package controller;

import dao.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lib.IDUtil;
import model.Category;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
@WebServlet(name = "CategoryAdminController", urlPatterns = {"/admin/category"})
public class CategoryAdminController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CategoryAdminController.class);

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
//        processRequest(request, response);
        String action = request.getParameter("action");
        if (action == null) {
            doGet_List(request, response);
        } else {
            if (action.equalsIgnoreCase("add")) {
                doGet_Add(request, response);
            } else if (action.equalsIgnoreCase("delete")) {
                doGet_Delete(request, response);
            } else if (action.equalsIgnoreCase("edit")) {
                doGet_Edit(request, response);
            }
        }
    }

    protected void doGet_List(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdb = new CategoryDAO();
//        List<Category> cates = cdb.getAll();
        request.setAttribute("categories", cdb.getAll());
        request.getRequestDispatcher("../WEB-INF/views/admin/category/list.jsp").forward(request, response);

    }

    protected void doGet_Add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../WEB-INF/views/admin/category/add.jsp").forward(request, response);

    }

    protected void doGet_Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdb = new CategoryDAO();
        String cid = request.getParameter("cid");
        Category c = cdb.getCategoryById(cid);
        request.setAttribute("category", c);
        request.getRequestDispatcher("../WEB-INF/views/admin/category/edit.jsp").forward(request, response);

    }

    protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryDAO cdb = new CategoryDAO();
            cdb.delete(request.getParameter("cid").trim());
        } catch (NumberFormatException e) {
            LOGGER.error("Error at CategoryAdminController: " + e.getMessage());
        } finally {
            response.sendRedirect("category");
        }

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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("add")) {
            doPost_Add(request, response);
        } else if (action.equalsIgnoreCase("edit")) {
            doPost_Edit(request, response);
        }

    }

    protected void doPost_Add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("cname");
            CategoryDAO cdb = new CategoryDAO();
            Category c = cdb.getCategoryByName(name);

            if (c != null) {
                request.setAttribute("ERROR", name.toUpperCase() + " Existed!!!");
                request.getRequestDispatcher("../WEB-INF/views/admin/category/add.jsp").forward(request, response);
            } else {
                Category cNew = new Category(IDUtil.generateCategoryId(), name.toUpperCase());
                cdb.insert(cNew);
                response.sendRedirect("category");

            }
//            if (c == null) {
//                Category cNew = new Category(id, name.toUpperCase());
//                cdb.insert(cNew);
//                response.sendRedirect("category");
//            } else {
//                request.setAttribute("error", id + " Existed!!!");
//                request.getRequestDispatcher("../WEB-INF/views/admin/category/add.jsp").forward(request, response);
//            }
        } catch (Exception e) {
            LOGGER.error("Error at CategoryAdminController - doPost_Add: " + e.getMessage());
        }
    }

    protected void doPost_Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String cname = request.getParameter("cname");
        CategoryDAO cdb = new CategoryDAO();
        Category c = cdb.getCategoryByName(cname);
        try {
            if (c != null) {
                request.setAttribute("ERROR", cname.toUpperCase() + " Existed!!!");
                request.setAttribute("cid", cid);
                request.setAttribute("cname", cname);
                request.getRequestDispatcher("../WEB-INF/views/admin/category/edit.jsp").forward(request, response);
            } else {
                Category cNew = new Category(cid, cname);
                cdb.update(cNew);
                response.sendRedirect("category");

            }
        } catch (Exception e) {
            LOGGER.error("Error at CategoryAdminController: " + e.getMessage());
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
