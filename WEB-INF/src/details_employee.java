import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/employeedetails")
public class detailsemployee extends HttpServlet {
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
        String ename = request.getParameter("empname");
        

        // Perform authentication
        try {
            String sql = "SELECT * FROM addstaff WHERE name= ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, ename); 
            ResultSet rs = pstmt.executeQuery();
           


            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            while(rs.next())
            {
             
                out.println("alert('Name: " +
                rs.getString("name") + " , Role: " +
                rs.getString("role") + " , Salary: " +
                rs.getString("salary") +
                "');");
                
        } 
            out.println("</script>");

            response.getWriter().println("<html><body><h3>Please wait...</h3></body></html>");

            // Redirect to a success page after a delay
            response.getWriter().println("<script>");
            response.getWriter().println("setTimeout(function() { window.location.href = 'employee.html'; }, 3000);"); // Redirect after 3 seconds
            response.getWriter().println("</script>");




            rs.close();
            pstmt.close();
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
