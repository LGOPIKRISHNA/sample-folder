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

        String sql = "SELECT * FROM customers";
        pstmt = connection.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Details</title>
    </head>
    <body>
        <center>
        <h2>Customers Details:</h2>
        <table border='1'>
            <tr>
                <th>FULL-NAME</th>
                <th>EMAIL-ID</th>
                <th>PASSWORD</th>
                <th>PHONE-NUMBER</th>
                <th>ADDRESS</th>
                <th>PIN-CODE</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("fullname") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("password") %></td>
                <td><%= rs.getString("phn") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("pincode") %></td>
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
