

<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			margin-left:200px;
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
		input[type=submit]:hover{
			background-color:#d5d9dd;
		}
		.button{
			font-size:25px;		
			padding:10px;
			width:500px;
			background-color:white;
			text-align:center;
			border:none;
			cursor: pointer;
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
		#statInfo{
			float:left;
			margin:70px;
			color:white;
			margin-left:300px;
			
		}
		#statInfo > h1 {
			font-size:55px;
		}
		#results{
			padding:15px;
		  	height: 300px;
		  	overflow: auto;	
		  	font-size:25px;
		}
		table {
		  border-collapse: collapse;
		  width: 100%;
		}
		
		td, th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		tr:nth-child(even){
			background-color: #454d54;
		}
		
		tr:hover {
			background-color: #5c6770;
		}
		
		th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: #22262a;
		  color: white;
		}
		#ranking{
			padding: 15px;
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
				<h3>Hello <span id ="login">${ player.login }</span></h3>
				<h6>Logout</h6>
			</div>	
		</div>	
		<div>
			<div id = "gamePanel">
				<form action="/create" method="post">
					<input type="hidden" name="login" value="${ player.login }">
					<input type="hidden" name="id" value="${ player.id }">
					<h1>Create New Game</h1>
					<input type="submit" value ="Create a game" class = "button"/>
				</form>
				<form action="/connect" method="post">
					<input type="hidden" name="login" value="${ player.login }">
					<input type="hidden" name="id" value="${ player.id }">
					<h1>Join Existing</h1>
					<input type="text" id = "gameId" name = "gameId" placeholder = "game id">
					<br/><br/>
					<input type="submit" onclick = "return validateId()" value = "Join to game" class = "button"/>
				</form>
				<form action="/connectRandom" method="post">
					<input type="hidden" name="login" value="${ player.login }">
					<input type="hidden" name="id" value="${ player.id }">
					<h1>Join Random Game</h1>
					<input type="submit" value = "Join to random game" class = "button"/>
				</form>
			</div>		
		</div>
		<div id = "statInfo">
			<h1>Your ranking</h1>
			<div id = "ranking">
				<h2>Your score: &nbsp; &nbsp;<span style="font-weight:bold;">${ player.score }</span></h2>
				<h2>Your current ranking position: &nbsp; &nbsp;<span style="font-weight:bold;">${ranking}</span></h2>
			</div>
			<h1>Game History</h1>
			<div id = "results">
				<table>
					<tr>
					   <th>Opponent Name</th>
					   <th>Date</th>
					   <th>Result</th>
					 </tr>
					<c:forEach items = "${player.results}" var = "result">
						<tr>
							<td>${result.oponentName}</td>
							<td>${result.date}</td>
							<td>${result.result}</td>
						</tr>
					</c:forEach>
				</table>
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
