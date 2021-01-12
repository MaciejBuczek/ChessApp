<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
				background-color: #343a40;
				color: white;
				margin: 0 auto;
				padding: 0 auto;
			}
			
			h2 {
				font-size: 64px;
				text-align: center;
			}
			
			input[type=text], input[type=password] {
			  width: 100%;
			  padding: 12px 20px;
			  margin: 8px 0;
			  display: inline-block;
			  border: 1px solid #ccc;
			  box-sizing: border-box;
			}
			
			#footer {
	            position:fixed;
	            bottom:0;
	            background-color:#22262a;
	            width:100%;
	            padding:15px;
	            color:white;
	            font-size:20px;
	            
	        }
	        
			#nav{
	            padding-bottom:20px;
	            width:100%;
	            background-color:#22262a;
	            font-size:30px;
	            height: 12vh;
	        }
	        
	        #nav > h1{
	            float:left;
	            margin-left:50px;
	        }
	        
	        #container {
	        	padding: 16px;
	        }
	        
	        #container > form {
	        	font-size:28px;
	        	border-style: solid;
	        	border-radius: 25px;
				background: #343a40;
				padding: 20px;
				margin: 40px;
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
			
			a:visited {
				color: #4CAF50;
			}
			
			a {
				color: #4CAF50;
			}
	        
		</style>
	</head>
	<body>
		<div id = "nav">
            <h1>ChessApp</h1>
        </div>
		<div id = "container">
		<form action="/login" method="post">
			<div>
				<h2>Login</h2>
			    <label for="login"><b>Username</b></label>
			    <br />
			    <input type="text" placeholder="Enter Username" name="login" required>
				<br />
			    <label for="password"><b>Password</b></label>
			    <br />
			    <input type="password" placeholder="Enter Password" name="password" required>
			    <br />
			    <button type="submit">Login</button>
			</div>
		    <span>Feel Free to <a href="registerForm">Register</a></span>
		</form>
	</div>	
	<div id = "footer">Created by Maciej Buczek & Kamil Galuszka 2020</div>
	</body>
</html>