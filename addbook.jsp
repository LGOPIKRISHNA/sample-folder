<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Store Admin Panel</title>
        <style>
            body {
                background-image: url('opition5.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            form {
                margin-bottom: 20px;
            }
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type=submit]:hover {
                background-color: #45a049;
            }
            nav {
                display: flex;
                justify-content: center;
                background-color: bisque;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            nav a {
                padding: 10px 20px;
                font-size: 20px;
                text-decoration: none;
                color: blue;
                transition: background-color 0.3s;
            }
            nav a:hover {
                background-color: rgb(246, 255, 196);
                border-radius: 15%;
            }
            </style>
    </head>
    <body>
    
        <script src="jquery.js"></script>
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <body>
<h3>Add New Book</h3>
    <form id="addBook" action="addingbooks" method="POST">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br>

        <label for="author">Author:</label>
        <input type="text" id="author" name="author" required><br>

        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="genre" required><br>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required><br>

        <input type="submit" value="Add Book">
    </form>

    <!-- Table to display existing books -->
    <h3>Existing Books</h3>
    <table id="bookTable">
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <!-- Book rows will be dynamically added here -->
    </table>

    <script>
        // Function to add a new book
        function addBook() {
            var title = document.getElementById("title").value;
            var author = document.getElementById("author").value;
            var genre = document.getElementById("genre").value;
            var price = document.getElementById("price").value;

            var table = document.getElementById("bookTable");
            var row = table.insertRow(-1);
            row.innerHTML = `<td>${title}</td><td>${author}</td><td>${genre}</td><td>${price}</td><td><button onclick="deleteBook(this)">Delete</button></td>`;
        }
        
        // Function to delete a book
        function deleteBook(row) {
            var rowIndex = row.parentNode.parentNode.rowIndex;
            document.getElementById("bookTable").deleteRow(rowIndex);
        }

        // Event listener for the form submission
        document.getElementById("addBookForm").addEventListener("submit", function(event) {
            event.preventDefault(); 
            addBook(); 
            this.reset(); 
        });
    </script>
    </body>
</html>