
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

@WebServlet("/prof")
public class profileservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Here, you would write code to fetch the user's profile from your data source
        // For example, you might query a database to retrieve the profile information
        
        // Once you have the profile information, you can forward the request to a JSP page
        // where you can display the profile details
        
        // For demonstration purposes, let's assume you have profile details in variables
        String username = "John Doe";
        String email = "john@example.com";
        String phoneNumber = "123-456-7890";
        
        // Set the attributes to be accessed in the JSP page
        request.setAttribute("username", "JohnDoe");
        request.setAttribute("email", "john.doe@example.com");
        request.setAttribute("phoneNumber", "123-456-7890");
        
        
        
        // Forward the request to the profile.jsp page
        request.getRequestDispatcher("/view1.jsp").forward(request, response);
    }
}

