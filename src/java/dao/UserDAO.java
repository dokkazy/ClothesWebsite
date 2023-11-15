/*
 * 
 */
package dao;

import context.DBContext;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lib.IDUtil;
import model.Customer;
import model.Role;
import model.User;

/**
 *
 * @author HP
 */
public class UserDAO {

    private Connection connection = null;
    private PreparedStatement st = null;
    private ResultSet rs = null;

    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[tblUsers]";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
//                User u = new User();
//                u.setUsername(rs.getString(1));
//                u.setPassword(rs.getString(2));
//                Role r = getRoleById(rs.getInt(3));
//                u.setRole(r);
//                users.add(u);
                users.add(new User(rs.getString(1),
                        rs.getString(2), getRoleById(rs.getInt(3))));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }
//-----------------------------------------------------------------------------    

    public User checkLogin(String user, String pass) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Role] FROM [dbo].[tblUsers] WHERE [Username] = ? AND [Password] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2), getRoleById(rs.getInt(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//-----------------------------------------------------------------------------    

    public User checkUser(String user) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Role] FROM [dbo].[tblUsers] WHERE [Username] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2), getRoleById(rs.getInt(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//-----------------------------------------------------------------------------

    public void update(User user) {
        String sql = "UPDATE [dbo].[tblUsers] SET [Password] = ?  WHERE [Username] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, user.getPassword());
            st.setString(2, user.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//-----------------------------------------------------------------------------    

    public void signUp(String user, String pass) {
        String sql = "INSERT INTO [dbo].[tblUsers] ([Username],[Password],[Role]) VALUES(?,?,1)";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//-----------------------------------------------------------------------------    

    public Role getRoleById(int id) {
        String sql = "SELECT [ID], [Name] FROM [tblRoles] WHERE [ID] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                return new Role(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//-----------------------------------------------------------------------------
    public void addProfile(String name, String address, String phone, String email, String dob, String username) {
        String sql = "INSERT INTO [dbo].[tblCustomers]\n"
                + "           ([ID]\n"
                + "           ,[Username]\n"
                + "           ,[Name]\n"
                + "           ,[Address]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[DOB])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, IDUtil.generateCusId());
            st.setString(2, username);
            st.setString(3, name);
            st.setString(4, address);
            st.setString(5, phone);
            st.setString(6, email);
            st.setString(7, dob);
            st.executeUpdate();
        } catch (Exception o) {
            o.printStackTrace();
        }
    }
//-----------------------------------------------------------------------------

    public void updateProfile(String name, String address, String phone, String email, String dob, String username) {
        String sql = "UPDATE [tblCustomers]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[DOB] = ?\n"
                + " WHERE [Username] = ?";
        try {
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, dob);
            st.setString(6, username);
            st.executeUpdate();
        } catch (Exception o) {
            o.printStackTrace();
        }
    }
//-----------------------------------------------------------------------------

    public Customer getInfor(String user) {
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Name]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[DOB]\n"
                    + "  FROM [tblCustomers] WHERE [Username] = ?";
            connection = new DBContext().getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            rs = st.executeQuery();
            if (rs.next()) {
                Customer a = new Customer(rs.getString("ID"), rs.getString("Username"),
                        rs.getString("Name"), rs.getString("Address"),
                        rs.getString("Phone"), rs.getString("Email"),
                        rs.getDate("DOB"));
                return a;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//-----------------------------------------------------------------------------
//    public static void main(String[] args) {
//        UserDAO u = new UserDAO();
//        Customer u1 = u.getInfor("abc");
//        System.out.println(u1);
//    }
}
