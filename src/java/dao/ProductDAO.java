/*
 * 
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author HP
 */
public class ProductDAO {

    private Connection connection = null;
    private PreparedStatement st = null;
    private ResultSet rs = null;

    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM [tblProducts]";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                CategoryDAO cdao = new CategoryDAO();
                Product p = new Product(rs.getString("ID"), rs.getInt("Quantity"),
                        cdao.getCategoryById(rs.getString("CateID")),
                        rs.getString("Name"), rs.getString("Image"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),rs.getBoolean("Status"));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }
//-----------------------------------------------------------------------------

    public Product getLast() {
        String sql = "SELECT TOP 1 * FROM [tblProducts] ORDER BY [ID] DESC";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                CategoryDAO cdao = new CategoryDAO();
                return new Product(rs.getString("ID"), rs.getInt("Quantity"),
                        cdao.getCategoryById(rs.getString("CateID")),
                        rs.getString("Name"), rs.getString("Image"),
                        rs.getString("Description"), rs.getDouble("Price"),rs.getBoolean("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//-----------------------------------------------------------------------------

    public List<Product> getProductBycId(String cid) {
        String sql = "SELECT * FROM [tblProducts] WHERE [CateID] = ?";
        List<Product> products = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, cid);
            rs = st.executeQuery();
            while (rs.next()) {
                CategoryDAO cdao = new CategoryDAO();
                products.add(new Product(rs.getString("ID"), rs.getInt("Quantity"),
                        cdao.getCategoryById(rs.getString("CateID")),
                        rs.getString("Name"), rs.getString("Image"),
                        rs.getString("Description"), rs.getDouble("Price"),rs.getBoolean("Status")));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

//-----------------------------------------------------------------------------
    public Product getProductById(String id) {
        String sql = "SELECT * FROM [tblProducts] WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryById(rs.getString("CateID"));
                return new Product(rs.getString("ID"), rs.getInt("Quantity"), c,
                        rs.getString("Name"), rs.getString("Image"),
                        rs.getString("Description"), rs.getDouble("Price"),rs.getBoolean("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//-----------------------------------------------------------------------------

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
//-----------------------------------------------------------------------------

    public List<Product> searchByName(String txtSearch) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM [tblProducts] WHERE [Name] LIKE ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                CategoryDAO cdao = new CategoryDAO();
                products.add(new Product(rs.getString("ID"), rs.getInt("Quantity"),
                        cdao.getCategoryById(rs.getString("CateID")),
                        rs.getString("Name"), rs.getString("Image"),
                        rs.getString("Description"), rs.getDouble("Price"),rs.getBoolean("Status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }
//-----------------------------------------------------------------------------

    public boolean deleteProduct(String pid) {
        boolean check = false;

        String sql = "DELETE FROM [dbo].[tblProducts] WHERE ID = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, pid);
            check = st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }
//-----------------------------------------------------------------------------

    public boolean updateProduct(Product p) {
        boolean check = false;
        String sql = "UPDATE [dbo].[tblProducts]\n"
                + "   SET [CateID] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, p.getCate().getId());
            st.setString(2, p.getName());
            st.setDouble(3, p.getPrice());
            st.setInt(4, p.getQuantity());
            st.setString(5, p.getImage());
            st.setString(6, p.getDescription());
            st.setBoolean(7, p.isStatus());
            st.setString(8, p.getId());
            check = st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }
//-----------------------------------------------------------------------------

    public boolean updateImage(String id, String image) throws Exception {
        boolean check = false;

        String sql = "UPDATE [dbo].[tblProducts] SET [Image] = ? WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, image);
            st.setString(2, id);
            check = st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }
//-----------------------------------------------------------------------------

    public boolean inActiveProduct(String id) {
        boolean check = false;
        String sql = "UPDATE [dbo].[tblProducts] SET [Status] = 0  WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, id);
            check = st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }
//-----------------------------------------------------------------------------

    public boolean addProduct(Product p) {
        boolean check = false;
        String sql = "INSERT [dbo].[tblProducts] ([ID],[CateID], [Name], [Price], [Quantity], [Image], [description],[Status]) \n"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getCate().getId());
            st.setString(3, p.getName());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getQuantity());
            st.setString(6, p.getImage());
            st.setString(7, p.getDescription());
            st.setBoolean(8, p.isStatus());
            check = st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }

//    public static void main(String[] args) {
//        ProductDAO p = new ProductDAO();
//        List<Product> list = p.getAll();
//        for (Product product : list) {
//            System.out.println(product);
//        }
//        List<Product> list = p.getProductById("1");
//        for (Product product : list) {
//            System.out.println(product);
//        }
//        
//    }
}
