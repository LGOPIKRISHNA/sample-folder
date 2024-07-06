
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
            <img src="chapter-book1.webp" class="book-image" alt="Book Image">
            <h1 class="book-title">Harry Potter</h1>
            <h2 class="book-price">Price: RS.250/-(RS.<s>299</s>/-)</h2>
            <p class="book-description">"Harry Potter" is a globally acclaimed fantasy series written by J.K. Rowling. It follows the adventures of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, as they attend Hogwarts School of Witchcraft and Wizardry. The series spans seven books, chronicling Harry's journey from his discovery of his magical heritage to his final confrontation with the dark wizard Voldemort.
            Filled with themes of friendship, courage, and the battle between good and evil, "Harry Potter" captivates readers with its richly imagined wizarding world, intricate plot twists, and memorable characters. Rowling's storytelling prowess and ability to create immersive settings have made the series a cultural phenomenon, inspiring a devoted fanbase and numerous adaptations in film, theater, and merchandise.






            </p>
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
