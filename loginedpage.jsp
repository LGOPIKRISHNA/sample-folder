<!DOCTYPE html>
<html>
<head>
    <script src="jquery.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% String email=(String) session.getAttribute("email");
    %>
    <% out.println("welcom: "+email);
    %>
    <title>Online Book Store</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('bg.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }
        h1 {
            display: flex;
            flex-direction: left;
            margin-top: 20px;
            padding-left: 25%;

            color: white;
        }
        .search-container {
            margin-bottom: 20px;
            padding-left: 9%;
        }
        .search-container input[type=search] {
            padding: 10px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
        }
        .search-container input[type=submit] {
            padding: 10px 20px;
            font-size: 18px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .go input[type=submit] {
            padding: 10px 20px;
            font-size: 18px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .goo input[type=submit] {
            padding: 10px 20px;
            font-size: 18px;
            background-color:darkgreen;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .goo:hover input[type=submit]{
            background-color: chartreuse;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: bisque;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        nav a {
            padding: 10px 20px;
            font-size: 19px;
            text-decoration: none;
            color: blue;
            transition: background-color 0.3s;
        }
        nav a:hover {
            background-color: rgb(246, 255, 196);
            border-radius: 15%;
        }
        .picture {
            display: flex;
            justify-content:left;
        }
        .fuc {
            margin: 20px;
            cursor: pointer;
        }
        .fuc img {
            width: 300px;
            height: 300px;
            transition: width 0.3s, height 0.3s;
        }
        img:hover {
            width: 260px;
            height: 440px;
        }
        h2{
            display: flex;
            flex-direction: left;
            padding: 10px 20px;
        }
        img{
            margin-left: 30px;
        }
        footer {
        background-color:peru;
        color: #fff;
        padding: 20px;
        text-align: center;
        position:relative;
        bottom: 0;
        width: 100%;
    }
    .container {
            text-align: center;
            padding: 10px;
            
        }
        .tag {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            background-color: bisque;
        }
        .tag .high {
            margin: 10px;
            padding: 10px 20px;
            border-radius: 2px;
            cursor: pointer;
            background-color: rgb(255, 165, 0);
            color: #fff;
            font-size: 17px;
            text-decoration: none;
        }
        .tag .high:hover {
            background-color: #e218df;
        }
        .book-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            background-attachment: fixed;
        }

        .book {
            margin: 20px;
            text-align: center;
        }

        .book img {
            width: 200px;
            height: 250px;
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }

        .book img:hover {
            transform: scale(1.1);
        }

        .book p {
            font-size: 18px;
            margin-top: 10px;
        }
        .boxl{
            background-color: #ffffff;
            padding: 10px;
            margin-top: 10px;
            margin-right: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 280px;
            background-color: whitesmoke;
            }
            .boxl:hover{
                background-color:burlywood;
            }
            input[AddToCart]{
                cursor: pointer;
            }
            .side{
                display: flex;
                flex-direction: left;
            }
            .f{
                margin-left: 2%;
                display: flex;
                flex-direction: left;
            }
    </style>
</head>
<body>
    <form id="f1" action="addtocart.jsp" method="POST">
        <input type="hidden" id="t1" name="t1" value="">
        <input type="hidden" id="t2" name="t2" value="">
    </form>
    <script>
        $(document).ready(function() {
            // Attach click event handler to a static parent element (document in this case)
            $(document).on('click', '.cart', function() {
                var a = $(this).data('ff');
                var b = $(this).data('cc');
                $("#t1").val(a);
                $("#t2").val(b);
                $("#f1").submit();
            });
        });
    </script>
        
    <form id="f2" action="buy.jsp" method="POST">
        <input type="hidden" id="t3" name="t3" value="">
        <input type="hidden" id="t4" name="t4" value="">
    </form>
    <script>
        $(document).ready(function() {
            // Attach click event handler to a static parent element (document in this case)
            $(document).on('click', '.buy', function() {
                var a = $(this).data('ff');
                var b = $(this).data('cc');
                $("#t3").val(a);
                $("#t4").val(b);
                $("#f2").submit();
            });
        });
    </script>
    <h1>
        BOOKS STORE
        <div class="search-container">
            <input type="search" id="o" id="check" required placeholder="Search here">
            <input type="submit" onclick="search()" value="Search">
            
        </div>
        <div class="f">
            <form class="goo" action="ordered.jsp"><input type="submit" value="Ordered"></form>&nbsp;
        <form class="goo" action="addcart.jsp"><input type="submit" value="AddedCart"></form>
        </div>
    </h1>
    <nav>
        <a href="log.html">Home</a>
        <a href="contact2.html">Contact Us</a>
        <a href="about.html">About Us</a>
        <a href="feedback2.html">Feedback</a>
       
        <a href="maps.html" title="Our books delivered locations">Maps</a>
        
 
    <nav>
        <a href="#" onclick="toggleFiction()">Fiction</a>
    </nav>
    <nav>
        <a href="#" onclick="togglFiction()">Non-fiction</a>
    </nav>
    <nav>
        <a href="#" onclick="toggFiction()">Children's Books</a>
    </nav>
    <nav>
        <a href="#" onclick="toFiction()">Specialty Books</a>
    </nav>
    <a href="profile.html" title="Profile">Profile</a>
    </nav>




    <ul id="fictionGenres" style="display: none;">
        <li><h2><a href="#" onclick="fun()">Novels</a></h2></li>
        <li><h2><a href="#" onclick="fun0()">Short Stories</a></h2></li>
    </ul>
    <ul id="fictionGenresimg" style="display: none;">
        <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="novel-book1.jpg" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Magic Tree House</h4>
                <h3>Price: RS.120/-(RS.<s>150</s>/-)</h3>
                <input type="submit" value="AddToCart" class="cart" data-ff="Magic Tree House" data-cc="120">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Magic Tree House" data-cc="120">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="novel-book2.jpg" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: George-Orwell</h4>
                        <h3>Price: RS.100/-(RS.<s>150</s>/-)</h3>
                        <button class="cart" data-ff="George-Orwell" data-cc="100">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="George-Orwell" data-cc="100">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="novel-book3.jpg" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: The-Great-Gatsby</h4>
                                <h3>Price: RS.150/-(RS.<s>200</s>/-)</h3>
                                <button class="cart" data-ff="The-Great-Gatsby" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Great-Gatsby" data-cc="150">Buy</button></div></div><br>
        <h2><div class="boxl">
                                    <div class="book"><a href="#"><img src="novel-book4.jpg" width="240px" height="430px" alt="Book 1"></a>
                                        <hr>
                                        <h4>Book-Name: Harry-Potter</h4>
    <h3>Price: RS.250/-(RS.<s>299</s>/-)</h3>
    <button class="cart" data-ff="Harry-Potter" data-cc="250">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Harry-Potter" data-cc="250">Buy</button></div></div><br>
                                    </div>
    </ul>

    <ul id="fictionGenresimgg" style="display: none;">
        <div class="side">
            <h2><div class="boxl">
                <div class="book"><a href="#"><img src="novel2-book1.jpg" width="240px" height="430px" alt="Book 1"></a>
                    <hr>
                    <h4>Book-Name: Interpreter-of-maladies</h4>
                    <h3>Price: RS.200/-(RS.<s>250</s>/-)</h3>
                    <input type="submit" value="AddToCart" class="cart" data-ff="Interpreter-of-maladies" data-cc="200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Interpreter-of-maladies" data-cc="200">Buy</button></div></div><br>
            <h2><div class="boxl">
                        <div class="book"><a href="#"><img src="novel2-book2.jpg" width="240px" height="430px" alt="Book 1"></a>
                            <hr>
                            <h4>Book-Name: James-Joyce</h4>
                            <h3>Price: RS.150/-(RS.<s>180</s>/-)</h3>
                            <button class="cart" data-ff="James-Joyce" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="James-Joyce" data-cc="150">Buy</button></div></div><br>
            <h2><div class="boxl">
                                <div class="book"><a href="#"><img src="novel2-book3.jpg" width="240px" height="430px" alt="Book 1"></a>
                                    <hr>
                                    <h4>Book-Name: Nine-Stories</h4>
                                    <h3>Price: RS.90/-(RS.<s>150</s>/-)</h3>
                                    <button class="cart" data-ff="Nine-Stories" data-cc="90">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Nine-Stories" data-cc="90">Buy</button></div></div><br>
            <h2><div class="boxl">
                                        <div class="book"><a href="#"><img src="novel2-book4.jpg" width="240px" height="430px" alt="Book 1"></a>
                                            <hr>
                                            <h4>Book-Name: Tenth-of-decembe</h4>
        <h3>Price: RS.200/-(RS.<s>300</s>/-)</h3>
        <button class="cart" data-ff="Tenth-of-decembe" data-cc="200">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Tenth-of-decembe" data-cc="200">Buy</button></div></div><br>
                                        </div>
    </ul>

    <script>
        function toggleFiction() {
            var fictionGenres = document.getElementById("fictionGenres");
            if (fictionGenres.style.display === "none") {
                fictionGenres.style.display = "block";
            } else {
                fictionGenres.style.display = "none";
            }
        }
        function fun() {
            var fictionGenresimg = document.getElementById("fictionGenresimg");
            if (fictionGenresimg.style.display === "none") {
                fictionGenresimg.style.display = "block";
            } else {
                fictionGenresimg.style.display = "none";
            }
        }

        function fun0() {
            var fictionGenresimgg = document.getElementById("fictionGenresimgg");
            if (fictionGenresimgg.style.display === "none") {
                fictionGenresimgg.style.display = "block";
            } else {
                fictionGenresimgg.style.display = "none";
            }
        }
    </script>















<ul id="fictioGenres" style="display: none;">   
    <li><h2><a href="#" onclick="fun1()">Biography/Autobiography</a></h2></li>
    <li><h2><a href="#" onclick="fun11()">Memoir</a></h2></li>
    <li><h2><a href="#" onclick="fun111()">Travel</a></h2></li>
</ul>

<ul id="fictionGenres1" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="non-book1.jpg" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Auto/Malcolm X</h4>
    <h3>Price: RS.150/-(RS.<s>199</s>/-)</h3>
    <button class="cart" data-ff="Auto/Malcolm X" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Auto/Malcolm X" data-cc="150">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="non-book2.jpg" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Elon-Musk</h4>
                        <h3>Price: RS.320/-(RS.<s>350</s>/-)</h3>
                        <button class="cart" data-ff="Elon-Musk" data-cc="320">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff=" Elon-Musk" data-cc="320">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="non-book3.jpg" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: The-Glass-Castle</h4>
                                <h3>Price: RS.150/-(RS.<s>200</s>/-)</h3>
                                <button class="cart" data-ff="The-Glass-Castle" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Glass-Castle" data-cc="150">Buy</button></div></div><br>
        <h2><div class="boxl">
                                    <div class="book"><a href="#"><img src="non-book4.jpg" width="240px" height="430px" alt="Book 1"></a>
                                        <hr>
                                        <h4>Book-Name: Nelson-Mandela</h4>
    <h3>Price: RS.350/-(RS.<s>399</s>/-)</h3>
    <button class="cart" data-ff="Nelson-Mandela" data-cc="350">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Nelson-Mandela" data-cc="350">Buy</button></div></div><br>
                                    </div>
</ul>

<ul id="fictionGenres2" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="non-book5.jpg" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Educated</h4>
    <h3>Price: RS.90/-(RS.<s>200</s>/-)</h3>
    <button class="cart" data-ff="Educated" data-cc="90">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Educated" data-cc="90">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="non-book6.jpg" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: The-Glass-Castle</h4>
                        <h3>Price: RS.150/-(RS.<s>200</s>/-)</h3>
                        <button class="cart" data-ff="The-Glass-Castle" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Glass-Castle" data-cc="150">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="non-book7.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: Elie-Wiesel-Night</h4>
                                <h3>Price: RS.250/-(RS.<s>300</s>/-)</h3>
                                <button class="cart" data-ff="Elie-Wiesel-Night" data-cc="250">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Elie-Wiesel-Night" data-cc="250">Buy</button></div></div><br>
        <h2><div class="boxl">
                                    <div class="book"><a href="#"><img src="non-book8.jpg" width="240px" height="430px" alt="Book 1"></a>
                                        <hr>
                                        <h4>Book-Name: Angela's-Ashes</h4>
    <h3>Price: RS.130/-(RS.<s>199</s>/-)</h3>
    <button class="cart" data-ff="Angela's-Ashes" data-cc="130">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Angela's-Ashes" data-cc="130">Buy</button></div></div><br>
                                    </div>
</ul>
<ul id="fictionGenres3" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="travel-book1.jpg" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Jon-Krakauer-Into-The-Wild</h4>
    <h3>Price: RS.230/-(RS.<s>300</s>/-)</h3>
    <button class="cart" data-ff="Jon-Krakauer-Into-The-Wild" data-cc="230">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Jon-Krakauer-Into-The-Wild" data-cc="230">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="travel-book2.jpg" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: On-The-Road(Jack-Kerauac)</h4>
                        <h3>Price: RS.270/-(RS.<s>300</s>/-)</h3>
                        <button class="cart" data-ff="On-The-Road(Jack-Kerauac)" data-cc="270">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="On-The-Road(Jack-Kerauac)" data-cc="270">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="travel-book3.jpg" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: A-Walk-In-The-Woods</h4>
                                <h3>Price: RS.299/-(RS.<s>350</s>/-)</h3>
                                <button class="cart" data-ff="A-Walk-In-The-Woods" data-cc="299">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="A-Walk-In-The-Woods" data-cc="299">Buy</button></div></div><br>
        <h2><div class="boxl">
                                    <div class="book"><a href="#"><img src="travel-book4.jpg" width="240px" height="430px" alt="Book 1"></a>
                                        <hr>
                                        <h4>Book-Name: Travels-With-Cherry</h4>
    <h3>Price: RS.230/-(RS.<s>299</s>/-)</h3>
    <button class="cart" data-ff="Travels-With-Cherry" data-cc="230">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Travels-With-Cherry" data-cc="230">Buy</button></div></div><br>
                                    </div>
</ul>
<script>
    function togglFiction() {
        var fictioGenres = document.getElementById("fictioGenres");
        if (fictioGenres.style.display === "none") {
            fictioGenres.style.display = "block";
        } else {
            fictioGenres.style.display = "none";
        }
    }
    function fun11() {
            var fictionGenres2 = document.getElementById("fictionGenres2");
            if (fictionGenres2.style.display === "none") {
                fictionGenres2.style.display = "block";
            } else {
                fictionGenres2.style.display = "none";
            }
        }
    function fun1() {
            var fictionGenres1 = document.getElementById("fictionGenres1");
            if (fictionGenres1.style.display === "none") {
                fictionGenres1.style.display = "block";
            } else {
                fictionGenres1.style.display = "none";
            }
        }

    function fun111() {
            var fictionGenres3 = document.getElementById("fictionGenres3");
            if (fictionGenres3.style.display === "none") {
                fictionGenres3.style.display = "block";
            } else {
                fictionGenres3.style.display = "none";
            }
        }
</script>











<ul id="fictiGenres" style="display: none;"> 
    <li><h2><a href="#" onclick="fun22()">Picture Books</a></h2></li>
    <li><h2><a href="#" onclick="fun2()">Early Readers</a></h2></li>
    <li><h2><a href="#" onclick="fun222()">Chapter Books</a></h2></li>
</ul>
<ul id="fictionGenres11" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="pic-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Madeline</h4>
    <h3>Price: RS.100/-(RS.<s>150</s>/-)</h3>
    <button class="cart" data-ff="Madeline" data-cc="100">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Madeline" data-cc="100">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="pic-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: The-Tale-Of-Peter-Rabbit</h4>
                        <h3>Price: RS.70/-(RS.<s>100</s>/-)</h3>
                        <button class="cart" data-ff="The-Tale-Of-Peter-Rabbit" data-cc="70">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Tale-Of-Peter-Rabbit" data-cc="70">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="pic-book3.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: Blueberries-For-Sal</h4>
                                <h3>Price: RS.99/-(RS.<s>150</s>/-)</h3>
                                <button class="cart" data-ff="Blueberries-For-Sal" data-cc="99">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Blueberries-For-Sal" data-cc="99">Buy</button></div></div><br>
        
                                    </div>
</ul>

<ul id="fictionGenres22" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="ear-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Dr.Seuss(make-reading-fun)</h4>
    <h3>Price: RS.160/-(RS.<s>200</s>/-)</h3>
    <button class="cart" data-ff="Dr.Seuss(make-reading-fun)" data-cc="160">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Dr.Seuss(make-reading-fun)" data-cc="160">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="ear-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Bob-Books(set-1)</h4>
                        <h3>Price: RS.150/-(RS.<s>250</s>/-)</h3>
                        <button class="cart" data-ff="Bob-Books(set-1)" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Bob-Books(set-1)" data-cc="150">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="ear-book3.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: I-Love-My-New-Toy</h4>
                                <h3>Price: RS.199/-(RS.<s>250</s>/-)</h3>
                                <button class="cart" data-ff="I-Love-My-New-Toy" data-cc="199">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="I-Love-My-New-Toy" data-cc="199">Buy</button></div></div><br>
        
                                    </div>
</ul>
<ul id="fictionGenres33" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="chapter-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Harry-Potter</h4>
    <h3>Price: RS.250/-(RS.<s>299</s>/-)</h3>
    <button class="cart" data-ff="Harry-Potter" data-cc="250">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Harry-Potter" data-cc="250">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="chapter-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Magic-Tree-House</h4>
                        <h3>Price: RS.100/-(RS.<s>180</s>/-)</h3>
                        <button class="cart" data-ff="Magic-Tree-House" data-cc="100">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Magic-Tree-House" data-cc="100">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="chapter-book3.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: Dairy-of-a-wimpy</h4>
                                <h3>Price: RS.230/-(RS.<s>250</s>/-)</h3>
                                <button class="cart" data-ff="Dairy-of-a-wimpy" data-cc="230">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Dairy-of-a-wimpy" data-cc="230">Buy</button></div></div><br>
        
                                    </div>
</ul>

<script>
    function toggFiction() {
        var fictiGenres = document.getElementById("fictiGenres");
        if (fictiGenres.style.display === "none") {
            fictiGenres.style.display = "block";
        } else {
            fictiGenres.style.display = "none";
        }
    }
    function fun22() {
            var fictionGenres11 = document.getElementById("fictionGenres11");
            if (fictionGenres11.style.display === "none") {
                fictionGenres11.style.display = "block";
            } else {
                fictionGenres11.style.display = "none";
            }
        }
    function fun2() {
            var fictionGenres22 = document.getElementById("fictionGenres22");
            if (fictionGenres22.style.display === "none") {
                fictionGenres22.style.display = "block";
            } else {
                fictionGenres22.style.display = "none";
            }
        }

    function fun222() {
            var fictionGenres33 = document.getElementById("fictionGenres33");
            if (fictionGenres33.style.display === "none") {
                fictionGenres33.style.display = "block";
            } else {
                fictionGenres33.style.display = "none";
            }
        }
</script>




















<ul id="ficGenres" style="display: none;">
    <li><h2><a href="#" onclick="fun333()">Professional/Technical Books</a></h2></li>
    <li><h2><a href="#" onclick="fun33()">Graphic Novels/Comics</a></h2></li>
    <li><h2><a href="#" onclick="fun3()">Poetry</a></h2></li>
</ul>
<ul id="fictionGenres44" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="pro-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: The-Pragmatic-Programmer</h4>
    <h3>Price: RS.200/-(RS.<s>299</s>/-)</h3>
    <button class="cart" data-ff="The-Pragmatic-Programmer" data-cc="200">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Pragmatic-Programmer" data-cc="200">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="pro-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Clean-Architecture</h4>
                        <h3>Price: RS.290/-(RS.<s>380</s>/-)</h3>
                        <button class="cart" data-ff="Clean-Architecture" data-cc="290">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Clean-Architecture" data-cc="290">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="pro-book3.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: Arificial-Intelligence(AI)</h4>
                                <h3>Price: RS.280/-(RS.<s>350</s>/-)</h3>
                                <button class="cart" data-ff="Arificial-Intelligence(AI)" data-cc="280">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Arificial-Intelligence(AI)" data-cc="280">Buy</button></div></div><br>
                                <h2><div class="boxl">
                                    <div class="book"><a href="#"><img src="pro-book4.webp" width="240px" height="430px" alt="Book 1"></a>
                                        <hr>
                                        <h4>Book-Name: Introduction-To-Algorithms</h4>
                                        <h3>Price: RS.350/-(RS.<s>450</s>/-)</h3>
                                        <button class="cart" data-ff="Introduction-To-Algorithms" data-cc="350">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Introduction-To-Algorithms" data-cc="350">Buy</button></div></div><br>           
        
                                    </div>
</ul>

<ul id="fictionGenres444" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="Gra-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: Maus</h4>
    <h3>Price: RS.120/-(RS.<s>199</s>/-)</h3>
    <button class="cart" data-ff="Maus" data-cc="120">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Maus" data-cc="120">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="Gra-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Sand-Man</h4>
                        <h3>Price: RS.220/-(RS.<s>250</s>/-)</h3>
                        <button class="cart" data-ff="Sand-Man" data-cc="220">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Sand-Man" data-cc="220">Buy</button></div></div><br>
        <h2><div class="boxl">
                            <div class="book"><a href="#"><img src="Gra-book3.webp" width="240px" height="430px" alt="Book 1"></a>
                                <hr>
                                <h4>Book-Name: Saga</h4>
                                <h3>Price: RS.210/-(RS.<s>250</s>/-)</h3>
                                <button class="cart" data-ff="Saga" data-cc="210">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Saga" data-cc="210">Buy</button></div></div><br>
        
                                    </div>
</ul>
<ul id="fictionGenres4" style="display: none;">
    <div class="side">
        <h2><div class="boxl">
            <div class="book"><a href="#"><img src="Poetry-book1.webp" width="240px" height="430px" alt="Book 1"></a>
                <hr>
                <h4>Book-Name: The-Waste-Land</h4>
    <h3>Price: RS.220/-(RS.<s>299</s>/-)</h3>
    <button class="cart" data-ff="The-Waste-Land" data-cc="220">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="The-Waste-Land" data-cc="220">Buy</button></div></div><br>
        <h2><div class="boxl">
                    <div class="book"><a href="#"><img src="Poetry-book2.webp" width="240px" height="430px" alt="Book 1"></a>
                        <hr>
                        <h4>Book-Name: Leaves-Of-Grass</h4>
                        <h3>Price: RS.190/-(RS.<s>240</s>/-)</h3>
                        <button class="cart" data-ff="Leaves-Of-Grass" data-cc="190">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Leaves-Of-Grass" data-cc="190">Buy</button></div></div><br>
        
                                    </div>
</ul>

<script>
    function toFiction() {
        var ficGenres = document.getElementById("ficGenres");
        if (ficGenres.style.display === "none") {
            ficGenres.style.display = "block";
        } else {
            ficGenres.style.display = "none";
        }
    }
    function fun33() {
            var fictionGenres444 = document.getElementById("fictionGenres444");
            if (fictionGenres444.style.display === "none") {
                fictionGenres444.style.display = "block";
            } else {
                fictionGenres444.style.display = "none";
            }
        }
    function fun3() {
            var fictionGenres4 = document.getElementById("fictionGenres4");
            if (fictionGenres4.style.display === "none") {
                fictionGenres4.style.display = "block";
            } else {
                fictionGenres4.style.display = "none";
            }
        }

    function fun333() {
            var fictionGenres44 = document.getElementById("fictionGenres44");
            if (fictionGenres44.style.display === "none") {
                fictionGenres44.style.display = "block";
            } else {
                fictionGenres44.style.display = "none";
            }
        }
</script>


<hr>
<div class="book-container">
    
    <div class="boxl">
    <div class="book">
    <img src="chapter-book2.webp"></div>
    <hr>
    <h3>Book-Name: Magic-Tree-House</h3>
        <h2>Price: RS.100/-(RS.<s>180</s>/-)</h2>
        <button class="cart" data-ff="Magic Tree House" data-cc="100">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Magic Tree House" data-cc="100">Buy</button>
    </div>
    
   
   <div class="boxl">
        <div class="book"><img src="pic-book1.webp" class="cart" data-ff="Magic Tree House" data-cc="100"></div>
        <hr>
        <h3>Book-Name: Madeline</h3>
        <h2>Price: RS.120/-(RS.<s>200</s>/-)</h2>
        <button class="cart" data-ff="Madeline" data-cc="120">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Madeline" data-cc="120">Buy</button>
    </div>
    
    <div class="boxl"> <div class="book"><img src="non-book1.jpg"></div>
    <hr>
    <h3>Book-Name: Auto/Malcolm X</h3>
    <h2>Price: RS.150/-(RS.<s>199</s>/-)</h2>
    <button class="cart" data-ff="Auto/Malcolm X" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Auto/Malcolm X" data-cc="150">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="novel-book1.jpg"></div><hr>
    <h3>Book-Name: To-Kill-A-Monkingbrid</h3>
    <h2>Price: RS.120/-(RS.<s>150</s>/-)</h2>
    <button class="cart" data-ff="To-Kill-A-Monkingbrid" data-cc="120">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="To-Kill-A-Monkingbrid" data-cc="120">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="novel-book2.jpg"></div><hr>
    <h3>Book-Name: George Orwell</h3>
    <h2>Price: RS.150/-(RS.<s>200</s>/-)</h2>
    <button class="cart" data-ff="George-Orwell" data-cc="150">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="George Orwell" data-cc="150">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="pic-book3.webp"></div><hr>
    <h3>Book-Name: BlueBerries For Sal</h3>
    <h2>Price: RS.180/-(RS.<s>220</s>/-)</h2>
    <button  class="cart" data-ff="BlueBerries For Sal" data-cc="180">AddToCarts</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="BlueBerries For Sal" data-cc="180">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="ear-book1.webp"></div><hr>
    <h3>Book-Name: Dr.Seuss Fun Book</h3>
    <h2>Price: RS.160/-(RS.<s>250</s>/-)</h2>
    <button class="cart" data-ff="Dr.seuss Fun Bokk" data-cc="160">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Dr.Seuss Fun Book" data-cc="160">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="ear-book2.webp"></div><hr>
    <h3>Book-Name: Bob Book(part I)</h3>
    <h2>Price: RS.200/-(RS.<s>280</s>/-)</h2>
    <button class="cart" data-ff="Bob Bokk(part I)" data-cc="200">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Bob Book(part I)" data-cc="200">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="chapter-book1.webp"></div><hr>
    <h3>Book-Name: Harry-Potter</h3>
    <h2>Price: RS.250/-(RS.<s>299</s>/-)</h2>
    <button class="cart" data-ff="Harry-Potter" data-cc="250">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Harry-Potter" data-cc="250">Buy</button></div>
    <div class="boxl">
    <div class="book"><img src="chapter-book3.webp"></div><hr>
    <h3>Book-Name: Dairy-of-a-wimpy </h3>
    <h2>Price: RS.230/-(RS.<s>250</s>/-)</h2>
    <button class="cart" data-ff="Dairy-of-a-wimpy" data-cc="230">AddToCart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="buy" data-ff="Dairy-of-a-wimpy" data-cc="230">Buy</button></div>
 
</div>



    <script>
        function search() {
            var input = document.getElementById("o").value.toLowerCase();
            switch (input) {
                case "Magic Tree House":
                case "magic":
                case "tree house":
                case "magic house":
                case "George Orwell":
                case "george":
                case "orwell":
                case "george orwekk":
                case "The Great Gatsby":
                case "the great gatsby":
                case "great gatsby":
                case "gatsby":  
                case "Harry Potter":
                case "harry potter":
                case "harry":
                case "potter":
                case "novels":
                    onclick=fun();
                    break;
                case "Interpreter-of-maladies":
                case "interpreter of maladies":
                case "interpreter":
                case "maladies":
                case "short stories":
                case "stories":
                case "James-Joyce":
                case "james":
                case "joyce":
                case "Nine-Stories":
                case "nine stories":
                case "nine":
                case "Tenth-of-decembe":
                case "tenth of decembe":
                case "tenth":
                    onclick=fun0();
                    break;
                case "Auto/Malcolm X":
                case "auto":
                case "malcolm x":
                case "auto/malcolm":
                case "Elon-Musk":
                case "elcon musk":
                case "elcon":
                case "musk":
                case "Elcon Musk":
                case "The-Glass-Castle":
                case "the glass castle":
                case "glass castle":
                case "castle":
                case "Nelson-Mandela":
                case "nelson mandela":
                case "mandela":
                    onclick=fun1();
                    break;
                case "Educated":
                case "The-Glass-Castle":
                case "Elie-Wiesel-Night":
                case "Angela's-Ashes":
                case "education":
                case "the glass castle":
                case "elie wiesel night":
                case "elie":
                case "wiesel":
                case "night":
                case "angelas":
                case "ashes":
                case "memoir":
                case "Memoir":
                    onclick=fun11();
                    break;
                case "Jon-Krakauer-Into-The-Wild":
                case "On-The-Road(Jack-Kerauac)":
                case "A-Walk-In-The-Woods":
                case "Travels-With-Cherry":
                case "jon krakauer into the wild":
                case "jon krakauer":
                case "the wild":
                case "on the road":
                case "jack kerauac":
                case "a walk in the woods":
                case "in the woods":
                case "travels with cherry":
                case "travels":
                case "the cherry":
                case "travel":
                case "Travel":
                    onclick=fun111();
                    break;
                default:
                    alert("no books");
                    break;
            }
        }
    </script>
    <footer>
        <p>Thank you for visiting our bookstore. We appreciate your support!</p>
        <p>&copy; 2024 Our Bookstore. All rights reserved.</p>
    </footer>
</body>
</html>
