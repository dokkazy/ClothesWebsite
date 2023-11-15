/*
 * 
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Cart;
import model.CartItems;
import model.Product;

/**
 *
 * @author HP
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/add-cart"})
public class AddToCartController extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("acc") == null) {
                request.setAttribute("ERROR", "Please login before shopping");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                Cart cart = new Cart(new ArrayList<CartItems>(), 0);
                if (session.getAttribute("cart") != null) {
                    cart = (Cart) session.getAttribute("cart");
                }
                String pid = request.getParameter("pid");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                ProductDAO pdao = new ProductDAO();
                Product product = pdao.getProductById(request.getParameter("pid"));
                CartItems item = new CartItems(product, quantity);
                cart.addItem(item);
                session.setAttribute("cart", cart);

                response.getWriter().print("<script>\n"
                        + "	window.location = \"./HomeController\";\n"
                        + "	alert(\"Add to cart successfully\");\n"
                        + "	</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
