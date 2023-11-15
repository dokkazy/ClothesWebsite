/*
 * 
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import lib.MD5;
import model.Customer;
import model.User;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ADMIN = "admin/dashboard";
    private static final String USER = "HomeController";
    private static final String INVALID = "login.jsp";
    private static final Logger LOGGER = Logger.getLogger(LoginController.class);

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
        if (action.equalsIgnoreCase("login")) {
            doPost_Login(request, response);
        }
    }

  
    protected void doPost_Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String user = request.getParameter("user");
            String pass = request.getParameter("pass");

            UserDAO udb = new UserDAO();
            User u = udb.checkLogin(user, MD5.getMD5(pass));
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            if (u != null) {
                String role = u.getRole().getRole();
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(60 * 60 * 10);
                session.setAttribute("ROLE", role);
                session.setAttribute("acc", u);
                if (role.equalsIgnoreCase("admin")) {
                    session.setAttribute("username_admin", u.getUsername());
                    response.sendRedirect(USER);
                } else if (role.equalsIgnoreCase("user")) {
                    String rem = request.getParameter("remember");

                    //Tao 3 cookie: username, password, remember me
                    Cookie cUser = new Cookie("cUser", user);
                    Cookie cPass = new Cookie("cPass", pass);
                    Cookie cRem = new Cookie("cRem", rem);
                    if (rem != null) {
                        cUser.setMaxAge(60 * 60 * 24 * 7);//7 ngay
                        cPass.setMaxAge(60 * 60 * 24 * 7);//7 ngay
                        cRem.setMaxAge(60 * 60 * 24 * 7);//7 ngay
                    } else {
                        cUser.setMaxAge(0);
                        cPass.setMaxAge(0);
                        cRem.setMaxAge(0);
                    }
                    //luu vao browser
                    response.addCookie(cUser);
                    response.addCookie(cPass);
                    response.addCookie(cRem);
                    response.sendRedirect(USER);
                }
            } else {
                request.setAttribute("ERROR", "Invalid Username or Password");
                request.getRequestDispatcher(INVALID).forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.error("ERROR at LoginAdminController: " + e.getMessage());
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
