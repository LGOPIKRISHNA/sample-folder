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
import java.time.LocalDate;

@WebServlet("/check_status")
public class statuschecking extends HttpServlet {
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
        // Set response content type
        response.setContentType("text/html");

        // Retrieve form parameters
        String c_name = request.getParameter("customer_name");

        // Perform authentication
        try {
            String sql = "SELECT * FROM ordered WHERE username= ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, c_name); 
            ResultSet rs = pstmt.executeQuery();

            PrintWriter out = response.getWriter();
            out.println("<html><body>");

            out.println("<h2>Order Details:</h2>");
            out.println("<table border='1'><tr><th>BOOK-NAME</th><th>PRICE</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("price") + "</td>");
                LocalDate currentDate = LocalDate.now();
                LocalDate dateInSevenDays = currentDate.plusDays(7);
                out.println("<td>Delivery: Within 7 days of ordering (" + dateInSevenDays + ")</td>");
                out.println("</tr>");
            }

           // LocalDate currentDate = LocalDate.now(); 
             // Add 7 days to the current date
    
            //System.out.println("Current Date: " + currentDate);
            //System.out.println("Date in 7 days: " + dateInSevenDays);
    



            out.println("</table>");
            out.println("</body></html>");

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
