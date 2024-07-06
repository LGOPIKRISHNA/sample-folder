import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve book details from the request
        String title = request.getParameter("title");
        String price = request.getParameter("price");

        // Get the session
        HttpSession session = request.getSession();
        
        // Retrieve the cart from the session or create a new one if it doesn't exist
        String cart = (String) session.getAttribute("cart");
        if (cart == null) {
            cart = new String();
            session.setAttribute("cart", cart);
        }

        // Add the book to the cart
        cart.addBook(title, price);

        // Redirect to cart.jsp
        response.sendRedirect("cart.jsp");
    }
}
