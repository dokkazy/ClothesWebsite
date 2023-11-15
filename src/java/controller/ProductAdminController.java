/*
 * 
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import lib.IDUtil;
import model.Product;
import model.ProductErrorObj;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
@WebServlet(name = "ProductAdminController", urlPatterns = {"/admin/product"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, //10MB
        maxFileSize = 1024 * 1024 * 50, //50MB
        maxRequestSize = 1024 * 1024 * 100) //100MB
public class ProductAdminController extends HttpServlet {

    private static final String ERROR = "../WEB-INF/views/admin/product/error.jsp";
    private static final String REQLIST = "../WEB-INF/views/admin/product/list.jsp";
    private static final String RESLIST = "product";
    private static final String REQADD = "../WEB-INF/views/admin/product/add.jsp";
    private static final String REQEDIT = "../WEB-INF/views/admin/product/edit.jsp";

    private static final List<String> IMAGE_EXTENSIONS = Arrays.asList(new String[]{"tiff", "tif", "bmp", "jpg", "jpeg", "png", "eps", "raw", "psd", "gif"});

    private static final Logger LOGGER = Logger.getLogger(ProductAdminController.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            } else if (action.equalsIgnoreCase("disProduct")) {
                doGet_disPro(request, response);
            } else if (action.equalsIgnoreCase("enProduct")) {
                doGet_enPro(request, response);
            }
        }
    }

    protected void doGet_disPro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            ProductDAO pdb = new ProductDAO();
            Product p = pdb.getProductById(id);
            p.setStatus(false);
            pdb.updateProduct(p);
            request.setAttribute("products", pdb.getAll());
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_disPro: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(REQLIST).forward(request, response);
        }
    }

    protected void doGet_enPro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            ProductDAO pdb = new ProductDAO();
            Product p = pdb.getProductById(id);
            p.setStatus(true);
            pdb.updateProduct(p);
            request.setAttribute("products", pdb.getAll());
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_enPro: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(REQLIST).forward(request, response);
        }
    }

    protected void doGet_List(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDAO pdb = new ProductDAO();
            request.setAttribute("products", pdb.getAll());
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_List: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(REQLIST).forward(request, response);
        }
    }

    protected void doGet_Add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryDAO cdb = new CategoryDAO();
            request.setAttribute("clist", cdb.getAll());

        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_Add: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(REQADD).forward(request, response);
        }
    }

    protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            ProductDAO pdao = new ProductDAO();
            String pid = request.getParameter("id");
            if (pdao.deleteProduct(pid)) {
                request.setAttribute("products", pdao.getAll());
                url = REQLIST;
            } else {
                request.setAttribute("ERROR", "Delete Failed");
            }
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_Delete: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    protected void doGet_Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDAO pdao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            String pid = request.getParameter("id");
            Product p = pdao.getProductById(pid);

            request.setAttribute("clist", cdao.getAll());
            request.setAttribute("product", p);
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doGet_Edit: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(REQEDIT).forward(request, response);
        }
    }

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
        String url = ERROR;
        try {
            request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("name");
            String stringQuantity = request.getParameter("quantity");
            String stringPrice = request.getParameter("price");
            String description = request.getParameter("description");
            boolean status = request.getParameter("status") != null;
            String cid = request.getParameter("category");
            Part imagePart = request.getPart("image");

            ProductDAO pdb = new ProductDAO();
            CategoryDAO cdb = new CategoryDAO();

            ProductErrorObj productErrorObj = new ProductErrorObj();
            Product product;
            String validPrice = "^\\d+.\\d+";
            String validQuantity = "^\\d+$";

            int quantity = 0;
            double price = 0;
            boolean valid = true;
            if (stringPrice.matches(validPrice) || stringPrice.matches(validQuantity)) {
                if (Double.parseDouble(stringPrice) > 0) {
                    price = Double.parseDouble(stringPrice);
                } else {
                    productErrorObj.setPriceError("Price must over than 0");
                    valid = false;
                }
            } else {
                productErrorObj.setPriceError("Price must be a number and over 0");
                valid = false;
            }
            if (stringQuantity.matches(validQuantity)) {
                quantity = Integer.parseInt(stringQuantity);
            } else {
                productErrorObj.setQuantityError("Quantity must be an integer number");
                valid = false;
            }
            int lastIndexBeforeExtension = imagePart.getSubmittedFileName().lastIndexOf(".");
            String imageExtension = imagePart.getSubmittedFileName().substring(lastIndexBeforeExtension + 1);
            if (!IMAGE_EXTENSIONS.contains(imageExtension)) {
                productErrorObj.setImageError("Extensions of Image must be .jpg, .png, ...!");
                valid = false;
            }
            if (valid) {
                product = new Product(IDUtil.generateProductId(), quantity, cdb.getCategoryById(cid), name, "", description, price, status);
                if (!pdb.addProduct(product)) {
                    request.setAttribute("ERROR", "Insert Failed!");
                } else {
                    ServletContext sc = getServletContext();
                    String imageName = product.getId() + "." + imageExtension;
                    String imageFolder = (String) sc.getAttribute("IMAGE_FOLDER");
                    imagePart.write(imageFolder + imageName);

                    String relativePath = sc.getInitParameter("imageFolderName") + "/" + imageName;

                    if (pdb.updateImage(product.getId(), relativePath)) {
                        request.setAttribute("MESSAGE", "Insert Successfully");
                    } else {
                        request.setAttribute("MESSAGE", "Insert Image Failed");
                    }
                }
            } else {
                request.setAttribute("INVALID", productErrorObj);
            }
            url = REQADD;
            request.setAttribute("clist", cdb.getAll());
        } catch (Exception e) {
            LOGGER.error("Error at ProductAdminController - doPost_Add: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    protected void doPost_Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String id = request.getParameter("txtId");
            String name = request.getParameter("name");
            String stringQuantity = request.getParameter("quantity");
            String stringPrice = request.getParameter("price");
            String description = request.getParameter("description");
            boolean status = request.getParameter("status") != null;
            String cid = request.getParameter("category");
            String image = request.getParameter("txtImage");
            Part imagePart = request.getPart("image");

            ProductDAO pdao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            ProductErrorObj productErrorObj = new ProductErrorObj();
            Product product;
            String validPrice = "^\\d+.\\d+";
            String validQuantity = "^\\d+$";

            int quantity = 0;
            double price = 0;
            boolean valid = true;

            if (stringPrice.matches(validPrice) || stringPrice.matches(validQuantity)) {
                if (Double.parseDouble(stringPrice) > 0) {
                    price = Double.parseDouble(stringPrice);
                } else {
                    productErrorObj.setPriceError("Price must over than 0");
                    valid = false;
                }
            } else {
                productErrorObj.setPriceError("Price must be a number and over 0");
                valid = false;
            }
            if (stringQuantity.matches(validQuantity)) {
                quantity = Integer.parseInt(stringQuantity);
            } else {
                productErrorObj.setQuantityError("Quantity must be an integer number");
                valid = false;
            }
            int lastIndexBeforeExtension = imagePart.getSubmittedFileName().lastIndexOf(".");
            String imageExtension = imagePart.getSubmittedFileName().substring(lastIndexBeforeExtension + 1);

            product = new Product(id, quantity, cdao.getCategoryById(cid), name, image, description, price, status);
            if (valid) {
                if (!(imageExtension.equals(""))) {
                    ServletContext sc = getServletContext();
                    String imageName = id + "." + imageExtension;
                    String imageFolder = (String) sc.getAttribute("IMAGE_FOLDER");
                    imagePart.write(imageFolder + imageName);

                    String relativePath = sc.getInitParameter("imageFolderName") + File.separator + imageName;
                    product.setImage(relativePath);
                }
                if (pdao.updateProduct(product)) {
                    request.setAttribute("MESSAGE", "Update Successfully");
                } else {
                    request.setAttribute("ERROR", "Update Failed");
                }
            } else {
                request.setAttribute("INVALID", productErrorObj);
            }
            url = REQEDIT;
            request.setAttribute("product", product);
            request.setAttribute("clist", cdao.getAll());
        } catch (NumberFormatException e) {
            LOGGER.error("Error at ProductAdminController - doPost_Edit: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
