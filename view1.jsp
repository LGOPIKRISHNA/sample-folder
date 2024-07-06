<html>
    <head>
        <style>
            .boxl {
                background-color: #ffffff;
                padding: 20px 10px;
                margin-top: 10px;
                margin-left: 30%;
                margin-right: 10px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                transform: scale(1.1);
                background-color: whitesmoke;
            }
            .boxl:hover {
                background-color: burlywood;
            }
            button {
                cursor: pointer;
            }
            .sidebyside {
                display: flex;
                flex-direction: left;
            }
            .dat {
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="sidebyside">
            <div class="boxl">
                <div class="book">
                    <img src="pic-book1.webp">
                </div>
                <hr>
                <h2>Price: RS.100/-(RS.<s>180</s>/-)</h2>
                <!-- Modify the button to call the JavaScript function -->
                <button onclick="addToCart()">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>Buy</button>
            </div>
            <div class="dat">
                <h2><u>Details:</u></h2>
                <h3>
                    Price: RS.120<br>
                    <br>
                    Language: English<br><br>
                    Description:</h3><h4>The Magic Tree House by Mary Pope Osborne: Siblings Jack and Annie discover a magical tree house that transports them through time and space on various adventures throughout history. </h4>      
            </div>
        </div>
        <!-- Create a hidden form to send data to cart.jsp -->
        <form id="addToCartForm" action="cart.jsp" method="post" style="display: none;">
            <input type="hidden" name="price" id="price" value="100">
            <input type="hidden" name="description" value="The Magic Tree House by Mary Pope Osborne: Siblings Jack and Annie discover a magical tree house that transports them through time and space on various adventures throughout history.">
        </form>

        <script>
            function addToCart() {
                // Submit the form when AddToCart button is clicked
                document.getElementById("addToCartForm").submit();
                // Optionally, you can also show an alert
                alert("Successfully added to cart");
            }
        </script>
    </body>
</html>
