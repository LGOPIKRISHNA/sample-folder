<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            background-color: #ff7f0e;
            padding: 10px;
            border-radius: 8px;
        }

        .profile-info {
            display: grid;
            grid-template-columns: 1fr 3fr;
            grid-gap: 10px;
        }

        .info-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            background-color: #fcf8e3;
            border-radius: 5px;
        }

        .label {
            font-weight: bold;
            width: 120px;
            color: #ff4136; /* Red */
        }

        .value {
            color: #2ecc40; /* Green */
        }

    </style>
</head>
<body>
    <% String email=(String) session.getAttribute("email");
         String pass=(String) session.getAttribute("password");
         String phno=(String) session.getAttribute("phone");
         String adds=(String) session.getAttribute("address");
         String pincoded=(String) session.getAttribute("pincode");
         String name=(String) session.getAttribute("fullname");
         %>
    <div class="container">
        <h1>User Profile</h1>
        <div class="profile-info">
            <div class="info-item">
                <span class="label">Full Name:</span>
                <span class="value"><%= name %></span>
            </div>
            <div class="info-item">
                <span class="label">Email:</span>
                <span class="value"><%= email %></span>
            </div>
            <div class="info-item">
                <span class="label">Password:</span>
                <span class="value"><%= pass %></span>
            </div>
            <div class="info-item">
                <span class="label">Phone Number:</span>
                <span class="value"><%= phno %></span>
            </div>
            <div class="info-item">
                <span class="label">Address:</span>
                <span class="value"><%= adds %></span>
            </div>
            <div class="info-item">
                <span class="label">Pin Code:</span>
                <span class="value"><%= pincoded %></span>
            </div>
        </div>
    </div>
</body>
</html>
