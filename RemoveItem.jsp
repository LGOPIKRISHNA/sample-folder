<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String itemName = request.getParameter("itemToRemove");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "9573");
        
        PreparedStatement ps = con.prepareStatement("DELETE FROM ordered WHERE name = ?");
        ps.setString(1, itemName);
        
        int rowsAffected = ps.executeUpdate();
        
        con.close();
        
        if(rowsAffected == 1){
            response.sendRedirect("addcart.jsp");
        } else {
            out.println("Deletion failed");
        }
    } catch (Exception e) {
        // Log the exception for debugging purposes
        e.printStackTrace();
        
        // Display a user-friendly error message
        out.println("An error occurred while deleting the record");
        out.println(e);
    }
%>
