import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Clear any session attributes
            session.removeAttribute("email");
            session.removeAttribute("password");

            // Invalidate the session
            session.invalidate();
        }

        // Clear any cookies associated with the session
        // Note: This code clears all cookies. Adjust it to clear only specific cookies if needed.
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

        // Prevent caching of the login page
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // Disable session restoration
        response.setHeader("Clear-Site-Data", "\"cache\", \"cookies\", \"storage\"");

        // Redirect the user to the login page
        response.sendRedirect("login.html"); 
    }
}
