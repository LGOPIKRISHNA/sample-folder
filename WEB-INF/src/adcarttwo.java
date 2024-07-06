import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bcart")
public class adcarttwo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USER = "system";
    private static final String JDBC_PASSWORD = "9573";

    // JDBC variables for opening and managing connection
    private Connection connection;

    // Method to establish a connection to the database
    public void init() throws ServletException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String cartid = request.getParameter("t1");
        String qunt = request.getParameter("t2");
        String phn = request.getParameter("t3");
        String username = request.getParameter("t4");
        String lang = request.getParameter("t5");
        String name_book = request.getParameter("t6");
        String loct = request.getParameter("t7");
        String pincode = request.getParameter("t8");
        String couple_code = request.getParameter("t9");

        // Insert user data into the database
        try {
            String sql = "INSERT INTO cart (cart_id, quantity,phn_number,user_name,language,book_name,location,pincode,couple_code) VALUES (?, ?, ?,?, ?, ?,?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, cartid);
            statement.setString(2, qunt);
            statement.setString(3, phn);
            statement.setString(4, username);
            statement.setString(5, lang);
            statement.setString(6, name_book);
            statement.setString(7, loct);
            statement.setString(8, pincode);
            statement.setString(9, couple_code);
            statement.executeUpdate();
            statement.close();
            response.sendRedirect("paymenttwo.html");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // Method to close the connection
    public void destroy() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
