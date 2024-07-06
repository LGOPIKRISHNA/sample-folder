import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
        String fullname = request.getParameter("t1");
        String password = request.getParameter("t2");

        // Perform authentication
        try {
            String sql = "SELECT email,phn, address,pincode FROM customers WHERE fullname = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Authentication successful
                String email = resultSet.getString("email");
                String phn = resultSet.getString("phn");
                String address = resultSet.getString("address");
                String pincode = resultSet.getString("pincode");
                // Store user information in session
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("password", password);
                session.setAttribute("fullname",fullname);
                session.setAttribute("phone",phn);
                session.setAttribute("address",address);
                session.setAttribute("pincode",pincode);
                response.sendRedirect("log.html");
            } else {
                // Authentication failed
                response.getWriter().println("<html><body><h3>Your login creditions are not valid.Please wait...</h3></body></html>");

                // Redirect to a success page after a delay
                response.getWriter().println("<script>");
                response.getWriter().println("setTimeout(function() { window.location.href = 'login.html'; }, 3000);"); // Redirect after 3 seconds
                response.getWriter().println("</script>");
            }

            statement.close();
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


//onclick="return display()"