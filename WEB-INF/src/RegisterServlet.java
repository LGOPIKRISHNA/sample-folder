import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
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
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ph = request.getParameter("phn");
        String addr = request.getParameter("address");
        String pin = request.getParameter("pin");

        // Perform validation
        if (fullName == null || fullName.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            // If any field is empty, show error message
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Please fill all the fields.</h3></body></html>");
            return;
        }

        // Insert user data into the database
        try {
            String sql = "INSERT INTO customers (fullname, email, password,phn,address,pincode) VALUES (?, ?, ?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, ph);
            statement.setString(5, addr);
            statement.setString(6, pin);
            statement.executeUpdate();
            statement.close();
            HttpSession session = request.getSession();
                session.setAttribute("fullname",fullName);
                session.setAttribute("email",email);
                session.setAttribute("phone",ph);
                session.setAttribute("address",addr);
                session.setAttribute("pincode",pin);
                session.setAttribute("password", password);
            // Redirect to a success page
            response.getWriter().println("<html><body><h3>Registration completed. Please wait...</h3></body></html>");

        // Redirect to a success page after a delay
        response.getWriter().println("<script>");
        response.getWriter().println("setTimeout(function() { window.location.href = 'login.html'; }, 3000);"); // Redirect after 3 seconds
        response.getWriter().println("</script>");


           // response.sendRedirect("login.html");
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
