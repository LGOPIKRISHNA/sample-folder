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

@WebServlet("/add_staff")
public class Addstaff extends HttpServlet {
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
        String nam = request.getParameter("name");
        String rol = request.getParameter("role");
        String sal = request.getParameter("salary");
        String ph = request.getParameter("phn");
        String ad = request.getParameter("adds");
       
        // Insert user data into the database
        try {
            String sql = "INSERT INTO addstaff (name,role, salary,phn_number,address) VALUES (?,?,?,?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nam);
            statement.setString(2, rol);
            statement.setString(3, sal);
            statement.setString(4, ph);
            statement.setString(5, ad);
            statement.executeUpdate();
            statement.close();

            // Redirect to a success page
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Staff member added successfully');");
            out.println("location='admin-login.html';"); 
            out.println("</script>");
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
