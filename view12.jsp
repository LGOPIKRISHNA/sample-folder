<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            background-image: url('bg.jpg');
            background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
            padding: 0;
        }
        p{
            color: red;
        }
        .container {
            max-width: 800px;
            background-image: url('bg.jpg');
            background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    border-color:darkorange;
            margin-left: 30%;
            margin-right: 30%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .book-details {
            text-align: center;
        }
        .book-image {
            max-width: 300px;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .book-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }
        .book-price {
            font-size: 18px;
            color: #666;
            margin-bottom: 20px;
        }
        .book-description {
            font-size: 16px;
            color:black;
            font-size: 20px;
        }
        button{
            font-size: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="book-details">
            <img src="non-book1.jpg" class="book-image" alt="Book Image">
            <h1 class="book-title">malcolam x(bio-grapy)</h1>
            <h2 class="book-price">Price: RS.150/-(RS.<s>199</s>/-)</h2>
            <p class="book-description">Malcolm X was a prominent figure in the civil rights movement in the United States during the 1950s and 1960s. He advocated for Black empowerment, self-defense, and self-determination. Malcolm X initially rose to prominence as a spokesperson for the Nation of Islam, but later broke away from the organization and embraced Sunni Islam. He was known for his powerful oratory skills and his unwavering commitment to fighting against racial injustice. Malcolm X's ideas continue to influence discussions on race, equality, and human rights today. </p>
            <button onclick="fun()">Buy</button>
        </div>
    </div>
    <script>
        function fun()
        {
            window.history.back('index.html');
            alert("You have to login! so please login");
        }
    </script>
</body>
</html>
