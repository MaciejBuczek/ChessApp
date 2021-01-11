

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
		*{
			margin:0;
			padding:0;
		}
		body {
			font-family: Arial, Helvetica, sans-serif;
			background-color:#343a40; 
		}
		#nav{
			padding-top:25px;
			padding-bottom:20px;
			color:white;
			width:100%;
			background-color:#22262a;
			font-size:30px;
			height: 90px;
		}
		#nav > h1{
			float:left;
			margin-left:50px;
		}
		#account{
			margin-right:100px;
			float:right;
		}
		#account > h6{
			text-decoration:underline;
		}
		#gamePanel{
			float:left;
			color:white;
			margin:50px;
		}
		#gamePanel > form > h1{
			font-size:55px;
			margin-bottom:20px;
			margin-top:20px;
		}
		
		input{
			font-size:25px;
			padding:10px;
			width:480px;
		}
		.button{
			font-size:25px;		
			padding:10px;
			width:500px;
			background-color:white;
			text-align:center;
			border:none;
		}
		a > div:hover{
			background-color:#e6e6e6;
		}
		#footer{
			position:fixed;
			bottom:0;
			background-color:#22262a;
			width:100%;
			padding:15px;
			color:white;
			font-size:20px;
		}
		
		</style>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	</head>
	<body>
		<div id = "nav">
			<h1>ChessApp</h1>
			<div id = "account">
				<h3>Hello <span id ="login">${ login }</span></h3>
				<h6>Logout</h6>
			</div>	
		</div>	
		<div>
			<div id = "gamePanel">
				<form action="/create" method="post">
					<input type="hidden" name="login" value="${ login }">
					<h1>Create New Game</h1>
					<input type="submit" value ="Create a game" class = "button"/>
				</form>
				<form action="/connect" method="post">
					<input type="hidden" name="login" value="${ login }">
					<h1>Join Existing</h1>
					<input type="text" id = "gameId" name = "gameId" placeholder = "game id">
					<br/><br/>
					<input type="submit" onclick = "return validateId()" value = "Join to game" class = "button"/>
				</form>
				<form action="/connectRandom" method="post">
					<input type="hidden" name="login" value="${ login }">
					<h1>Join Random Game</h1>
					<input type="submit" value = "Join to random game" class = "button"/>
				</form>
			</div>		
		</div>		
		<div id = "footer">Created by Maciej Buczek & Kamil Galuszka 2020</div>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	</body>
	<script>
		function validateId(){
			isCorrect = false;
			let gameId = document.getElementById("gameId").value;
			if(gameId == null || gameId === ''){
				Swal.fire(
				  'No Id',
				  'Please provide game id',
				  'error'
				)
				return false;
			}
			else{
				return true;
			}
		}
	</script>
</html>
