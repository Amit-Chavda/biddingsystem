<html>

<head>
    <title>Javascript Login Form Validation</title>
    <!-- Include CSS File Here -->
    <link rel="stylesheet" href="/css/style.css" />
    <!-- Include JS File Here -->

</head>

<body>
    <div class="container">
        <div class="main">
            <h2>Log In for Auctioneer</h2>
            
            <form id="form_id" method="post" name="myform" action="http://localhost:9192/authenticate">
                <label>Email :</label>
                <input type="email" name="userName" id="userName" />
                <label>Password :</label>
                <input type="password" name="password" id="password" />
                <button value="Submit" class="button">Login</button>
            </form>
            <!-- <span><b class="note">Note : </b>For this demo use following ussername and password. <br /><b
                    class="valid">User Name : Formget<br />Password : formget#123</b></span> -->
                    
                    	<a href="/bidder/signup">Create account</a> OR
			<a href="/bidder/login">Login as Bidder</a>
        </div>
    </div>
</body>

</html>