<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.util.*" %>
<%
            String fullname = request.getParameter("t1");
            String password = request.getParameter("t2");
            Connection connection;

            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","9573");
            String sql = "SELECT email FROM customers WHERE fullname = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String email = resultSet.getString("email");
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("password", password);
                
                response.sendRedirect("log.html");
            } else {
                response.getWriter().println("<html><body><h3>Your login creditions are not valid.Please wait...</h3></body></html>");
            }

            statement.close();
%>