<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>Cart Details</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<%
    String c_name = (String) session.getAttribute("fullname");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "9573");
        String sql = "SELECT * FROM ordered WHERE username= ?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, c_name);
        ResultSet rs = pstmt.executeQuery();
%>

<h2>Cart Details:</h2>
<table border='1'>
    <tr>
        <th>Book-Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Action</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("price") %></td>
        <td>
            <input type="button" value="-" onclick="sub(<%= rs.getRow() %>)">
            <input type="text" id="quantity_<%= rs.getRow() %>" value="1" disabled>
            <input type="button" value="+" onclick="add(<%= rs.getRow() %>)">
        </td>
        <td>
            <input type="text" id="total_<%= rs.getRow() %>" value="<%= rs.getInt("price") %>" disabled>
        </td>
        <td>
            <input type="button" value="Remove" class="bts" data-rr="<%= rs.getString("name") %>">
        </td>
    </tr>
    <%
        }
        rs.close();
        pstmt.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    %>
</table>

<form id="removeForm" method="post" action="RemoveItem.jsp">
    <input type="hidden" id="itemToRemove" name="itemToRemove">
</form>

<script>
    function add(index) {
        var quantityInput = document.getElementById("quantity_" + index);
        var totalInput = document.getElementById("total_" + index);
        var quantity = parseInt(quantityInput.value);
        var price = parseInt(totalInput.value) / quantity;
        quantity++;
        quantityInput.value = quantity;
        totalInput.value = price * quantity;
    }

    function sub(index) {
        var quantityInput = document.getElementById("quantity_" + index);
        var totalInput = document.getElementById("total_" + index);
        var quantity = parseInt(quantityInput.value);
        var price = parseInt(totalInput.value) / quantity;
        if (quantity > 1) {
            quantity--;
            quantityInput.value = quantity;
            totalInput.value = price * quantity;
        }
    }

    $(".bts").click(function () {
        var itemToRemove = $(this).data('rr');
        $('#itemToRemove').val(itemToRemove);
        $('#removeForm').submit();
    });
</script>

</body>
</html>
