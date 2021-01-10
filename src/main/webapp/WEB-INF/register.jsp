<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
		body {font-family: Arial, Helvetica, sans-serif;}
		form {border: 3px solid #f1f1f1;}
		
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  box-sizing: border-box;
		}
		
		button {
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
		
		button:hover {
		  opacity: 0.8;
		}
		
		.container {
		  padding: 16px;
		}
		
		span.psw {
		  float: right;
		}
		</style>
	</head>
	<body>
	
	<h2>Register</h2>
	
		<form action="register" method="post">
		  <div class="container">
		    <label for="login"><b>Username</b></label>
		    <input type="text" placeholder="Enter Username" name="login" required>
		
		    <label for="password"><b>Password</b></label>
		    <input type="password" placeholder="Enter Password" name="password" required>
		        
		    <button type="submit">Register</button>
		  </div>
		
		  <div class="container" style="background-color:#f1f1f1">
		    <span class="psw">Back to <a href="/">Login</a></span>
		  </div>
		</form>
	
	</body>
</html>
