<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
            String ff=request.getParameter("t3");
            String cc=request.getParameter("t4");
            String c_name=(String) session.getAttribute("fullname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <style>
        body {
            
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.container {
    width: 50%;
    margin: 50px auto;
    background-image: url('bg.jpg');
            background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
}

form {
    margin-top: 20px;
}

label {
    font-weight: bold;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 15px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #45a049;
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Page</h1>
        <form action="process_payment" method="POST">
            <label for="account_number">Account Number</label>
            <input type="text" id="account_number" name="card_number" placeholder="Enter account number" required>

            <label for="to_account_number">To Account Number</label>
<input type="text" id="to_account_number" name="to_account_number" 
       placeholder="XXXX XXXX XX99" disabled>
            
            <label for="quant">Quantity</label>
            <input type="text" id="pin" placeholder="ENTER QUANTITY" name="quant" required onblur="fun()">


            <label for="pay">PAY</label>
            <input  type="text" id="price" name="payment">

            <label for="accountholder_name">Account Name</label>
            <input type="text" id="accountholder_name" name="accountholder_name" value="<%= c_name %>" readonly>

            <label for="bookname">BOOK NAME</label>
            <input type="text" id="bookname" name="bookname" value="<%= ff %>" readonly>

            <button type="submit">Pay Now</button>
        </form>
    </div>
    <script>
        function fun(){
            var a=parseInt(document.getElementById("pin").value);
            var b=<%=cc%>;
            document.getElementById("price").value=a*b;
        }
    </script>
</body>
</html>
