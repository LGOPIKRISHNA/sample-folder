<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "9573");

        String sql = "SELECT * FROM payment";
        pstmt = connection.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>ordered Details</title>
    </head>
    <body><center>
        <h2>Ordered Details:</h2>
        <table border='1'>
            <tr>
                <th>ACCOUNT-NUMBER</th>
                <th>HOLDER-NAME</th>
                <th>QUANTITY</th>
                <th>BOOK-NAME</th>
                <th>PAY</th>                                           ,,,,
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("account_number") %></td>
                <td><%= rs.getString("holder_name") %></td>
                <td><%= rs.getString("quantity") %></td>
                <td><%= rs.getString("bookname") %></td>
                <td><%= rs.getString("pay") %></td>
            </tr>
<%
        }
%>
        </table>
        </center>
    </body>
</html>
<%
    } catch (ClassNotFoundException | SQLException e) {
        throw new ServletException(e);
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
