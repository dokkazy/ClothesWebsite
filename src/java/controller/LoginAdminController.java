/*
 * 
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lib.MD5;
import model.User;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginAdminController", urlPatterns = {"/admin/login"})
public class LoginAdminController extends HttpServlet {

    private static final String ADMIN = "../admin/dashboard";
    private static final String USER = "../HomeController";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Logger LOGGER = Logger.getLogger(LoginAdminController.class);

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
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("../WEB-INF/views/admin/login/login.jsp").forward(request, response);

        } else {
            if (action.equalsIgnoreCase("logout")) {
                doGet_Logout(request, response);
            } else if (action.equalsIgnoreCase("profile")) {
                doGet_Profile(request, response);
            }
        }
    }

    protected void doGet_Logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(USER);
    }

    protected void doGet_Profile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username_admin");
        UserDAO udb = new UserDAO();
        User u = udb.checkUser(username);
        request.setAttribute("account", u);
        request.getRequestDispatcher("../WEB-INF/views/admin/login/profile.jsp").forward(request, response);
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
        } else if (action.equalsIgnoreCase("profile")) {
            doPost_Profile(request, response);
        }
    }

    protected void doPost_Profile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO udb = new UserDAO();
        String user = request.getParameter("username");
        String repass = request.getParameter("rePassword");
        User u = udb.checkUser(user);
        if (!request.getParameter("password").isEmpty() && repass.equals(request.getParameter("password"))) {
            u.setPassword(MD5.getMD5(request.getParameter("password")));
            udb.update(u);
            HttpSession session = request.getSession();
            session.invalidate();
            response.getWriter().print("<script>\n"
                    + "	window.location = \"../HomeController\";\n"
                    + "	alert(\"Change password successfully\");\n"
                    + "	</script>");

        } else {
            request.setAttribute("ERROR", "Confirm password fail!!!");
            doGet_Profile(request, response);
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
                session.setAttribute("ROLE", role);
                session.setAttribute("acc", u);
                session.setMaxInactiveInterval(60 * 60 * 10);
                if (role.equalsIgnoreCase("admin")) {
                    session.setAttribute("username_admin", u.getUsername());
                    response.sendRedirect(ADMIN);
                } else if (role.equalsIgnoreCase("user")) {
                    response.sendRedirect(USER);
                }
            } else {
                request.setAttribute("ERROR", "Invalid Username or Password");
                request.getRequestDispatcher("../WEB-INF/views/admin/login/login.jsp").forward(request, response);
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
