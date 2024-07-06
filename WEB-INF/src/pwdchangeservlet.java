import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/change_password")
public class pwdchangeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String userEmail = request.getParameter("useremail");
        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("confirmpassword");

        // Check if new password matches confirm password
        if (!newPassword.equals(confirmPassword)) {
            showErrorPage(response, "New password and confirm password do not match.");
            return;
        }

        // Update password in the database
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUsername = "system";
        String dbPassword = "9573";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String updateQuery = "UPDATE customers SET password = ? WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(updateQuery)) {
                statement.setString(1, newPassword);
                statement.setString(2, userEmail);
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    
                    response.getWriter().println("<html><body><h3>Password successfully changed!. Please wait...</h3></body></html>");

                    // Redirect to a success page after a delay
                    response.getWriter().println("<script>");
                    response.getWriter().println("setTimeout(function() { window.location.href = 'profile.html'; }, 3000);"); // Redirect after 3 seconds
                    response.getWriter().println("</script>");
                } else {
                    showErrorPage(response, "Error updating password.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            showErrorPage(response, "Database error.");
        }
    }

    // Method to show error page
    private void showErrorPage(HttpServletResponse response, String errorMessage) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h2>Error: " + errorMessage + "</h2></body></html>");
    }

    // Method to show success page
    private void showSuccessPage(HttpServletResponse response, String successMessage) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h2>" + successMessage + "</h2></body></html>");
    }
}
