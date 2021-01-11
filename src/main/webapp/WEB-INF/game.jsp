 <!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
			body{
				background-color:#343a40; 
			}
			.chessboard {
			    width: 640px;
			    height: 640px;
			    margin: 20px;
			    border: 25px solid #333;
			    float:left;
			}
			
			.playerPieces{
				width:640px;
				margin: 20px;
			    border: 12px solid #333;
			    float:left;
			}
			
			#player1, #player2{
				width:640px;
				margin:20px;
				margin-bottom:0;
			    float:left;
			    color:white;
			    font-weight:bold;
			}
			
			#inputDiv{
				float:left;
				margin-left:20px;
				margin-top:20px;	
			}
			.black, .playerBlack{
			    float: left;
			    width: 80px;
			    height: 80px;
			    background-color: #999;
			    font-size:50px;
			    text-align:center;
			    display: table-cell;
			    vertical-align:middle;
			}
			.white, .playerWhite{
			    float: left;
			    width: 80px;
			    height: 80px;
			    background-color: #fff;
			    font-size:50px;
			    text-align:center;
			    display: table-cell;
			    vertical-align:middle;
			}
			
			.blackSelected {
				background-color: #808080;
				font-weight: bold;
			}
			
			.whiteSelected {
				background-color: #e6e6e6;
				font-weight: bold;
			}
			
			
			.black:hover{
				cursor: pointer;
			  	background: #808080;
			}
			
			.white:hover{
				cursor: pointer;
			  	background: #e6e6e6;
			}
		</style>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	</head>
	<body style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;">
	 <input type="hidden" id="action" name="custId" value="${ action }">
	 <input type="hidden" id="login" name="custId" value="${ login }">
	 <input type="hidden" id="gameId" name="custId" value="${ gameId }">
	<div class="chessboard">

			<div class="white" id="0_0" onclick="selectPiece(this)"></div>
			<div class="black" id="0_1" onclick="selectPiece(this)"></div>
			<div class="white" id="0_2" onclick="selectPiece(this)"></div>
			<div class="black" id="0_3" onclick="selectPiece(this)"></div>
			<div class="white" id="0_4" onclick="selectPiece(this)"></div>
			<div class="black" id="0_5" onclick="selectPiece(this)"></div>
			<div class="white" id="0_6" onclick="selectPiece(this)"></div>
			<div class="black" id="0_7" onclick="selectPiece(this)"></div>
	
			<div class="black" id="1_0" onclick="selectPiece(this)"></div>
			<div class="white" id="1_1" onclick="selectPiece(this)"></div>
			<div class="black" id="1_2" onclick="selectPiece(this)"></div>
			<div class="white" id="1_3" onclick="selectPiece(this)"></div>
			<div class="black" id="1_4" onclick="selectPiece(this)"></div>
			<div class="white" id="1_5" onclick="selectPiece(this)"></div>
			<div class="black" id="1_6" onclick="selectPiece(this)"></div>
			<div class="white" id="1_7" onclick="selectPiece(this)"></div>
			
			<div class="white" id="2_0" onclick="selectPiece(this)"></div>
			<div class="black" id="2_1" onclick="selectPiece(this)"></div>
			<div class="white" id="2_2" onclick="selectPiece(this)"></div>
			<div class="black" id="2_3" onclick="selectPiece(this)"></div>
			<div class="white" id="2_4" onclick="selectPiece(this)"></div>
			<div class="black" id="2_5" onclick="selectPiece(this)"></div>
			<div class="white" id="2_6" onclick="selectPiece(this)"></div>
			<div class="black" id="2_7" onclick="selectPiece(this)"></div>
			
			<div class="black" id="3_0" onclick="selectPiece(this)"></div>
			<div class="white" id="3_1" onclick="selectPiece(this)"></div>
			<div class="black" id="3_2" onclick="selectPiece(this)"></div>
			<div class="white" id="3_3" onclick="selectPiece(this)"></div>
			<div class="black" id="3_4" onclick="selectPiece(this)"></div>
			<div class="white" id="3_5" onclick="selectPiece(this)"></div>
			<div class="black" id="3_6" onclick="selectPiece(this)"></div>
			<div class="white" id="3_7" onclick="selectPiece(this)"></div>
		
			<div class="white" id="4_0" onclick="selectPiece(this)"></div>
			<div class="black" id="4_1" onclick="selectPiece(this)"></div>
			<div class="white" id="4_2" onclick="selectPiece(this)"></div>
			<div class="black" id="4_3" onclick="selectPiece(this)"></div>
			<div class="white" id="4_4" onclick="selectPiece(this)"></div>
			<div class="black" id="4_5" onclick="selectPiece(this)"></div>
			<div class="white" id="4_6" onclick="selectPiece(this)"></div>
			<div class="black" id="4_7" onclick="selectPiece(this)"></div>

			<div class="black" id="5_0" onclick="selectPiece(this)"></div>
			<div class="white" id="5_1" onclick="selectPiece(this)"></div>
			<div class="black" id="5_2" onclick="selectPiece(this)"></div>
			<div class="white" id="5_3" onclick="selectPiece(this)"></div>
			<div class="black" id="5_4" onclick="selectPiece(this)"></div>
			<div class="white" id="5_5" onclick="selectPiece(this)"></div>
			<div class="black" id="5_6" onclick="selectPiece(this)"></div>
			<div class="white" id="5_7" onclick="selectPiece(this)"></div>
			
			<div class="white" id="6_0" onclick="selectPiece(this)"></div>
			<div class="black" id="6_1" onclick="selectPiece(this)"></div>
			<div class="white" id="6_2" onclick="selectPiece(this)"></div>
			<div class="black" id="6_3" onclick="selectPiece(this)"></div>
			<div class="white" id="6_4" onclick="selectPiece(this)"></div>
			<div class="black" id="6_5" onclick="selectPiece(this)"></div>
			<div class="white" id="6_6" onclick="selectPiece(this)"></div>
			<div class="black" id="6_7" onclick="selectPiece(this)"></div>
		
			<div class="black" id="7_0" onclick="selectPiece(this)"></div>
			<div class="white" id="7_1" onclick="selectPiece(this)"></div>
			<div class="black" id="7_2" onclick="selectPiece(this)"></div>
			<div class="white" id="7_3" onclick="selectPiece(this)"></div>
			<div class="black" id="7_4" onclick="selectPiece(this)"></div>
			<div class="white" id="7_5" onclick="selectPiece(this)"></div>
			<div class="black" id="7_6" onclick="selectPiece(this)"></div>
			<div class="white" id="7_7" onclick="selectPiece(this)"></div>
  	</div>
  	<div>
  		<div id="player1">
  			Waiting for player...
  		</div>	
  		<div class="playerPieces"> 			
  			<div class = "playerWhite player" id = "p1_0_0"></div>
  			<div class = "playerBlack player" id = "p1_0_1"></div>
  			<div class = "playerWhite player" id = "p1_0_2"></div>
  			<div class = "playerBlack player" id = "p1_0_3"></div>
  			<div class = "playerWhite player" id = "p1_0_4"></div>
  			<div class = "playerBlack player" id = "p1_0_5"></div>
  			<div class = "playerWhite player" id = "p1_0_6"></div>
  			<div class = "playerBlack player" id = "p1_0_7"></div>
  			
  			<div class = "playerBlack player" id = "p1_1_0"></div>
  			<div class = "playerWhite player" id = "p1_1_1"></div>
  			<div class = "playerBlack player" id = "p1_1_2"></div>
  			<div class = "playerWhite player" id = "p1_1_3"></div>
  			<div class = "playerBlack player" id = "p1_1_4"></div>
  			<div class = "playerWhite player" id = "p1_1_5"></div>
  			<div class = "playerBlack player" id = "p1_1_6"></div>
  			<div class = "playerWhite player" id = "p1_1_7"></div>
  		</div>
  		<div id="player2">
  			Waiting for player...
  		</div>	
  		<div class="playerPieces"> 			
  			<div class = "playerWhite player" id = "p2_0_0"></div>
  			<div class = "playerBlack player" id = "p2_0_1"></div>
  			<div class = "playerWhite player" id = "p2_0_2"></div>
  			<div class = "playerBlack player" id = "p2_0_3"></div>
  			<div class = "playerWhite player" id = "p2_0_4"></div>
  			<div class = "playerBlack player" id = "p2_0_5"></div>
  			<div class = "playerWhite player" id = "p2_0_6"></div>
  			<div class = "playerBlack player" id = "p2_0_7"></div>
  			
  			<div class = "playerBlack player" id = "p2_1_0"></div>
  			<div class = "playerWhite player" id = "p2_1_1"></div>
  			<div class = "playerBlack player" id = "p2_1_2"></div>
  			<div class = "playerWhite player" id = "p2_1_3"></div>
  			<div class = "playerBlack player" id = "p2_1_4"></div>
  			<div class = "playerWhite player" id = "p2_1_5"></div>
  			<div class = "playerBlack player" id = "p2_1_6"></div>
  			<div class = "playerWhite player" id = "p2_1_7"></div>
  		</div>
  	</div>
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  	<script>
  		var board = [
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0]
		];
		
		let whiteMap = [
			"PAWN_WHITE",
			"ROOK_WHITE",
			"KNIGHT_WHITE",
			"BISHOP_WHITE",
			"QUEEN_WHITE",
			"KING_WHITE"
		];
		
		let blackMap = [
			"PAWN_BLACK",
			"ROOK_BLACK",
			"KNIGHT_BLACK",
			"BISHOP_BLACK",
			"QUEEN_BLACK",
			"KING_BLACK"
		];
		
		var turn = 1;
		var isWhite;
		var player1Pieces;
		var player2Pieces;
		var isSelectedPrev = false;
		var isSelectedNew = false;
		let prevVal, nextVal;
		let piece;
		let prevX, prevY, newY, newX;
		
		function assignSelectedClass(element){
			if(element.classList.contains("white")){
				element.classList.add("whiteSelected");
			}else{
				element.classList.add("blackSelected");
			}
		}
		
		function removeSelectedClass(element){
			if(element.classList.contains("white")){
				element.classList.remove("whiteSelected");
			}else{
				element.classList.remove("blackSelected");
			}
		}
		
		function getPiece(value){
			if(value > 0)
				return whiteMap[--value];		
			else{
				value *= -1;
				return blackMap[--value];
			}
		}
		
		function selectPiece(element){
			if((isWhite && (turn%2 == 1)) || (!isWhite && (turn%2 == 0))){
				let tempY = parseInt(element.id.charAt(0));
				let tempX = parseInt(element.id.charAt(2));
				if(!isSelectedPrev){
					if((isWhite && board[tempY][tempX] > 0) || (!isWhite && board[tempY][tempX] < 0)){
						console.log("setting prev");
						if(element.innerHTML.length != 0){
							prevY = tempY;
							prevX = tempX;
							assignSelectedClass(element);
							isSelectedPrev = true;
							prevVal = board[prevY][prevX];
							console.log("prev:", prevY, prevX);
						}
					}
				}else if(tempY == prevY && tempX == prevX){
					console.log("removing prev");
					removeSelectedClass(element)
					isSelectedPrev = false;
				}else{
					console.log("setting new")
					nextVal = board[tempY][tempX];
					if(nextVal == 0 || (prevVal < 0 && nextVal > 0) || (prevVal > 0 && nextVal < 0 )){
						newY = tempY;
						newX = tempX;
						console.log("new", newY, newX);
						isSelectedNew = true;
						piece = getPiece(prevVal);
						isTurn = false;
						removeSelectedClass(document.getElementById(prevY+"_"+prevX));
						makeMove(piece, newX, newY, prevX, prevY);
					}
				}
			}
		}
		
		function selectMove(value){
			switch(value) {
				case 1:
				break;
				case 2:
				break;
				
			}
		}
		
		const url = 'http://localhost:8080';
		let stompClient;
		let gameId;
		
		function connectToSocket(gameId){
			console.log("Connectiong to the game");
			let socket = new SockJS(url + "/gameTurn");
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function(frame){
				console.log("connected to the frame:" + frame);
				stompClient.subscribe("/topic/gameProgress/" + gameId, function(response){
					let data = JSON.parse(response.body);
					console.log("response!");
					turn++;
					refreshView(data);
					isSelectedPrev = false;
					isSelectedNew = false;
				})
			})
		}
		
		function displayCreateInfo(gameId){
			let html = "<h2>Your game id:</h2><input type=\"text\" value=" + gameId+  " readonly style = \"width:400px; font-size:20px;\">";
			Swal.fire({
			  title: '<strong>Game created successfully!</strong>',
			  icon: 'success',
			  html:
			    html,
			  showCloseButton: true,
			  focusConfirm: false,
			  confirmButtonText:
			    'ok',
			  confirmButtonAriaLabel: 'Thumbs up, great!',
			})
		}
		
		function create(){
			let login = document.getElementById("login").value;
			if(login == null || login === ''){
				alert("Please eneter a login");
			}else{
				$.ajax({
					url: url + "/game/start",
					type: 'POST',
					dataType: "json",
					contentType: "application/json",
					data : JSON.stringify({
						"login" : login
					}),
					success: function(data){
						gameId = data.gameId;
						
						isWhite = data.player1White;
						refreshView(data)
						
						connectToSocket(gameId);
						displayCreateInfo(data.gameId);
					},
					error: function(error){
						console.log(error);
					}
				})
			}
		}
		
		function displayPlayer(player){
			let html = "<h2>You are playing with <strong>" + player +  "</strong> <h2\">";
			Swal.fire({
			  title: '<strong>Connect to game successfully!</strong>',
			  icon: 'success',
			  html:
			    html,
			  showCloseButton: true,
			  focusConfirm: false,
			  confirmButtonText:
			    'ok',
			  confirmButtonAriaLabel: 'Thumbs up, great!',
			})
		}
		
		function connect(){
			let login = document.getElementById("login").value;
			let gameIdInput = document.getElementById("gameId").value;
			if(login == null || login === '')
				alert("Please eneter a login");
			else if(gameIdInput == null || gameIdInput === '')
				alert("Please eneter a gameID");
			else{
				$.ajax({
					url: url + "/game/connect",
					type: 'POST',
					dataType: "json",
					contentType: "application/json",
					data : JSON.stringify({
						"player" : {
							"login" : login
						},
						"gameId" : gameIdInput
					}),
					success: function(data){
						gameId = data.gameId;
						
						isWhite = !data.player1White;
						refreshView(data)
						
						connectToSocket(gameId);
						
						displayPlayer(data.player1.login);
					},
					error: function(error){
						console.log(error);
					}
				})
			}
		}
		
		function connectRandom(){
			let login = document.getElementById("login").value;
			if(login == null || login === ''){
				alert("Please eneter a login");
			}else{
				$.ajax({
					url: url + "/game/connect/random",
					type: 'POST',
					dataType: "json",
					contentType: "application/json",
					data : JSON.stringify({
						"login" : login
					}),
					success: function(data){
						gameId = data.gameId;
						
						isWhite = !data.player1White;
						refreshView(data)
						
						connectToSocket(gameId);
						displayPlayer(player.login);
					},
					error: function(error){
						console.log(error);
					}
				})
			}
		}
		
		function makeMove(pieceType, newX, newY, oldX, oldY){
		
			$.ajax({
				url: url + "/game/gameTurn",
				type: 'POST',
				dataType: "json",
				contentType: "application/json",
				data : JSON.stringify({
					"piece": pieceType,
				    "newX" : newX,
				    "newY" : newY,
				    "prevX" : oldX,
				    "prevY" : oldY,
				    "gameId": gameId
				}),
				success: function(data){
					refreshView(data);
				},
				error: function(error){
					console.log(error);
				}
			})
		}
		
		function refreshView(data){
			console.log("refreshing");
			let boardData = data.board;
			let player1Pieces = data.player1Pieces;
			let player2Pieces = data.player2Piece;
			player1Pieces = data.player1Pieces;
			player2Pieces = data.player2Pieces;
			
			document.getElementById("player1").innerHTML = data.player1.login;
			if(data.player2 != null)
				document.getElementById("player2").innerHTML = data.player2.login;
			
			for(let i = 0; i <player1Pieces.length; i++){
				for(let j=0; j<player1Pieces[i].length; j++){
					let id = "p1_" + i + "_" + j;
					document.getElementById(id).innerHTML = player1Pieces[i][j].symbol; 
				}
			}
			
			for(let i = 0; i <player2Pieces.length; i++){
				for(let j=0; j<player2Pieces[i].length; j++){
					let id = "p2_" + i + "_" + j;
					document.getElementById(id).innerHTML = player2Pieces[i][j].symbol; 
				}
			}
			
			for(let i = 0; i <boardData.length; i++){
				for(let j=0; j<boardData[i].length; j++){
					let id = i + "_" + j;
					document.getElementById(id).innerHTML = boardData[i][j].symbol; 
					board[i][j] = boardData[i][j].value;
				}
			}
		}
  	</script>
  	<script>
  		(function() {
  			let action = document.getElementById("action").value;
  			if(action == "create")
  				create();
  			else if(action == "connect")
  				connect();
  			else if(action == "connectRandom")		
  				connectRandom();	
		})();
  	</script>
	</body>
</html> 