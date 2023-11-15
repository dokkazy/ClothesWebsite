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

/**
 *
 * @author HP
 */
public class CategoryDAO {

    private Connection connection = null;
    private PreparedStatement st = null;
    private ResultSet rs = null;

    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM [tblCategories]";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                categories.add(new Category(rs.getString("ID"), rs.getString("Name")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }
    //-----------------------------------------------------------------------------
    //insert a category

    public void insert(Category c) {
        String sql = "INSERT INTO [dbo].[tblCategories]([ID],[Name]) VALUES (?,?)";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//-----------------------------------------------------------------------------

    //delete a category
    public void delete(String id) {
        String sql = "DELETE FROM [tblCategories] WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//-----------------------------------------------------------------------------

    public void update(Category c) {
        String sql = "UPDATE [dbo].[tblCategories]\n"
                + "   SET [Name] = ?\n"
                + " WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, c.getName().toUpperCase());
            st.setString(2, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//-----------------------------------------------------------------------------

    public Category getCategoryById(String id) {
        String sql = "select [ID],[Name] from [tblCategories] where [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                return new Category(rs.getString("ID"), rs.getString("Name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryByName(String name) {
        String sql = "select [ID],[Name] from [tblCategories] where [Name] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            rs = st.executeQuery();
            if (rs.next()) {
                return new Category(rs.getString("ID"), rs.getString("Name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//        public static void main(String[] args) {
//        CategoryDAO p = new CategoryDAO();
//        List<Category> list = p.getAll();
//        for (Category c : list) {
//            System.out.println(c);
//        }
//    }
}
