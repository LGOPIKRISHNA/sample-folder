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

@WebServlet("/process_payment")
public class payment_process extends HttpServlet {
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
        String number = request.getParameter("card_number");
        String amnt = request.getParameter("payment");
        String accname = request.getParameter("accountholder_name");
        String qua = request.getParameter("quant");
        String book_name = request.getParameter("bookname");

        // Insert user data into the database
        try {
            String sql = "INSERT INTO payment (account_number,holder_name,quantity,pay,bookname) VALUES (?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, number);
           //statement.setString(2, amnt);
            statement.setString(2, accname);
            statement.setString(3, qua);
            statement.setString(4, amnt);
            statement.setString(5, book_name);
            statement.executeUpdate();
            statement.close();
            response.getWriter().println("<html><body><h3>Payment Successfully Done.Please wait...</h3></body></html>");

            // Redirect to a success page after a delay
            response.getWriter().println("<script>");
            response.getWriter().println("setTimeout(function() { window.location.href = 'loginedpage.jsp'; }, 2000);"); // Redirect after 3 seconds
            response.getWriter().println("</script>");
            //response.sendRedirect("sample.html");
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
