 <!DOCTYPE html>
<html>
	<head>
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
			
			.avaibleMove{
				background-color: #FF8C00;
			}
			
			.avaibleAttack{
				background-color: #DC143C;
			}
			
			.avaibleWhite{
				background-color: #ffddb3;
			}
			
			.avaibleBlack{
				background-color: #ffaf4d;
			}
			
		</style>
	    <!--    libs for stomp and sockjs-->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	    <!--    end libs for stomp and sockjs-->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	</head>
	<body style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;">
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
  	<div id="inputDiv">
  		<input type="text" id = "login" placeholder = "login">
  		<br/>
  		<button onclick="create()">Create new lobby</button>
  		<br/>
  		<button onclick="connectRandom()">Connect to random lobby</button>
  		<br/>
  		<input id="gameId" placeholder = "game ID">
  		<br/>
  		<button onclick="connect()">Connect to lobby</button>
  		<br/>
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
		var bottomColor;
		
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
							selectMove(board[tempY][tempX]);
							isSelectedPrev = true;
							prevVal = board[prevY][prevX];
							console.log("prev:", prevY, prevX);
						}
					}
				}else if(tempY == prevY && tempX == prevX){
					console.log("removing prev");
					removeSelectedClass(element)
					isSelectedPrev = false;
					for(var i = 0; i < 8; i++) {
						for(var j = 0; j < 8; j++) {
							document.getElementById(i + "_" + j).classList.remove("avaibleWhite");
							document.getElementById(i + "_" + j).classList.remove("avaibleBlack");
							document.getElementById(i + "_" + j).classList.remove("avaibleAttack");
						}
					}
				}else{
					console.log("setting new")
					nextVal = board[tempY][tempX];
					if(element.classList.contains("avaibleWhite") || element.classList.contains("avaibleBlack") || element.classList.contains("avaibleAttack"))
						if(nextVal == 0 || (prevVal < 0 && nextVal > 0) || (prevVal > 0 && nextVal < 0 )){
							newY = tempY;
							newX = tempX;
							console.log("new", newY, newX);
							isSelectedNew = true;
							piece = getPiece(prevVal);
							isTurn = false;
							removeSelectedClass(document.getElementById(prevY+"_"+prevX));
							makeMove(piece, newX, newY, prevX, prevY);
							for(var i = 0; i < 8; i++) {
								for(var j = 0; j < 8; j++) {
									document.getElementById(i + "_" + j).classList.remove("avaibleWhite");
									document.getElementById(i + "_" + j).classList.remove("avaibleBlack");
									document.getElementById(i + "_" + j).classList.remove("avaibleAttack");
								}
							}
						}
				}
			}
		}
		
		function addMoveClass(element) {
			if(element.classList.contains("white")) {
				element.classList.add("avaibleWhite");
			}
			else {
				element.classList.add("avaibleBlack");
			}
		}
		
		
		function movePawn(value){
			if(bottomColor == 1) {
				if(prevY - 1 >= 0) {
					if(board[prevY - 1][prevX] == 0 && turn %2 == 1) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX)));
					}
					if(prevX - 1 >= 0) {
						if(board[prevY - 1][prevX - 1] < 0 && turn %2 == 1) {
							document.getElementById((prevY - 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					if(prevX + 1 < 8) {
						if(board[prevY - 1][prevX + 1] < 0 && turn %2 == 1) {
							document.getElementById((prevY - 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevY + 1 < 8) {
					if(board[prevY + 1][prevX] == 0 && turn %2 == 0) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX)));
					}
					if(prevX - 1 >= 0) {
						if(board[prevY + 1][prevX - 1] > 0 && turn %2 == 0) {
							document.getElementById((prevY + 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					if(prevX + 1 < 8) {
						if(board[prevY + 1][prevX + 1] > 0 && turn %2 == 0) {
							document.getElementById((prevY + 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevY == 6 && turn %2 == 1) {
					if(board[prevY - 1][prevX] == 0 && board[prevY - 2][prevX] == 0) {
						addMoveClass(document.getElementById((prevY - 2) + "_" + (prevX)));
					}
				}
				if(prevY == 1 && turn %2 == 0) {
					if(board[prevY + 1][prevX] == 0 && board[prevY + 2][prevX] == 0) {
							addMoveClass(document.getElementById((prevY + 2) + "_" + (prevX)));
					}
				}
			}
			else {
				if(prevY - 1 >= 0) {
					if(board[prevY - 1][prevX] == 0 && turn %2 == 0) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX)));
					}
					if(prevX - 1 >= 0) {
						if(board[prevY - 1][prevX - 1] > 0 && turn %2 == 0) {
							document.getElementById((prevY - 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					if(prevX + 1 < 8) {
						if(board[prevY - 1][prevX + 1] > 0 && turn %2 == 0) {
							document.getElementById((prevY - 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevY + 1 < 8) {
					if(board[prevY + 1][prevX] == 0 && turn %2 == 1) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX)));
					}
					if(prevX - 1 >= 0) {
						if(board[prevY + 1][prevX - 1] < 0 && turn %2 == 1) {
							document.getElementById((prevY + 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					if(prevX + 1 < 8) {
						if(board[prevY + 1][prevX + 1] < 0 && turn %2 == 1) {
							document.getElementById((prevY + 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevY == 6 && turn %2 == 0) {
					if(board[prevY - 1][prevX] == 0 && board[prevY - 2][prevX] == 0) {
						addMoveClass(document.getElementById((prevY - 2) + "_" + (prevX)));
					}
				}
				if(prevY == 1 && turn %2 == 1) {
					if(board[prevY + 1][prevX] == 0 && board[prevY + 2][prevX] == 0) {
							addMoveClass(document.getElementById((prevY + 2) + "_" + (prevX)));
					}
				}
			}
		}
		
		function moveRook(value){
			for(var y = prevY - 1; y >= 0; y--) {
				if(board[y][prevX] == 0) {
					addMoveClass(document.getElementById((y) + "_" + (prevX)));
				}
				else {
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				if(board[y][prevX] == 0) {
					addMoveClass(document.getElementById((y) + "_" + (prevX)));
				}
				else {
					break;
				}
			}
			for(var x = prevX - 1; x >= 0; x--) {
				if(board[prevY][x] == 0) {
					addMoveClass(document.getElementById((prevY) + "_" + (x)));
				}
				else {
					break;
				}
			}
			for(var x = prevX + 1; x < 8; x++) {
				if(board[prevY][x] == 0) {
					addMoveClass(document.getElementById((prevY) + "_" + (x)));
				}
				else {
					break;
				}
			}
			
			//attack
			for(var y = prevY - 1; y >= 0; y--) {
				if(turn %2 == 1 && board[y][prevX] < 0) {
					if(y + 1 < 8) {
						if(board[y + 1][prevX] >= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[y][prevX] > 0){
					if(y + 1 < 8) {
						if(board[y + 1][prevX] <= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[y][prevX] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[y][prevX] < 0) {
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				if(turn %2 == 1 && board[y][prevX] < 0) {
					if(y - 1 >= 0) {
						if(board[y - 1][prevX] >= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[y][prevX] > 0) {
					if(y - 1 >= 0) {
						if(board[y - 1][prevX] <= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[y][prevX] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[y][prevX] < 0) {
					break;
				}
			}
			for(var x = prevX - 1; x >= 0; x--) {
				if(turn %2 == 1 && board[prevY][x] < 0) {
					if(x + 1 < 8) {
						if(board[prevY][x + 1] >= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[prevY][x] > 0) {
					if(x + 1 < 8) {
						if(board[prevY][x + 1] <= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[prevY][x] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] < 0) {
					break;
				}
			}
			for(var x = prevX + 1; x < 8; x++) {
				if(turn %2 == 1 && board[prevY][x] < 0) {
					if(x - 1 >= 0) {
						if(board[prevY][x - 1] >= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
					document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] > 0) {
					if(x - 1 >= 0) {
						if(board[prevY][x - 1] <= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[prevY][x] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] < 0) {
					break;
				}
			}
			
		}
		
		function moveKnight(value){
			if(prevY - 2 >= 0) {
				if(prevX - 1 >= 0) {
					if(board[prevY - 2][prevX - 1] == 0) {
						addMoveClass(document.getElementById((prevY - 2) + "_" + (prevX - 1)));
					}
					else if(turn %2 == 1 && board[prevY - 2][prevX - 1] < 0) {
						document.getElementById((prevY - 2) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY - 2][prevX - 1] > 0) {
						document.getElementById((prevY - 2) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
				}
				if(prevX + 1 < 8) {
					if(board[prevY - 2][prevX + 1] == 0) {
						addMoveClass(document.getElementById((prevY - 2) + "_" + (prevX + 1)));
					}
					else if(turn %2 == 1 && board[prevY - 2][prevX + 1] < 0) {
						document.getElementById((prevY - 2) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY - 2][prevX + 1] > 0) {
						document.getElementById((prevY - 2) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
				}
			}
			if(prevY + 2 < 8) {
				if(prevX - 1 >= 0) {
					if(board[prevY + 2][prevX - 1] == 0) {
						addMoveClass(document.getElementById((prevY + 2) + "_" + (prevX - 1)));
					}
					else if(turn %2 == 1 && board[prevY + 2][prevX - 1] < 0) {
						document.getElementById((prevY + 2) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY + 2][prevX - 1] > 0) {
						document.getElementById((prevY + 2) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
				}
				if(prevX + 1 < 8) {
					if(board[prevY + 2][prevX + 1] == 0) {
						addMoveClass(document.getElementById((prevY + 2) + "_" + (prevX + 1)));
					}
					else if(turn %2 == 1 && board[prevY + 2][prevX + 1] < 0) {
						document.getElementById((prevY + 2) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY + 2][prevX + 1] > 0) {
						document.getElementById((prevY + 2) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
				}
			}
			if(prevX - 2 >= 0) {
				if(prevY - 1 >= 0) {
					if(board[prevY - 1][prevX - 2] == 0) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX - 2)));
					}
					else if(turn %2 == 1 && board[prevY - 1][prevX - 2] < 0) {
						document.getElementById((prevY - 1) + "_" + (prevX - 2)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY - 1][prevX - 2] > 0) {
						document.getElementById((prevY - 1) + "_" + (prevX - 2)).classList.add("avaibleAttack");
					}
				}
				if(prevY + 1 < 8) {
					if(board[prevY + 1][prevX - 2] == 0) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX - 2)));
					}
					else if(turn %2 == 1 && board[prevY + 1][prevX - 2] < 0) {
						document.getElementById((prevY + 1) + "_" + (prevX - 2)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY + 1][prevX - 2] > 0) {
						document.getElementById((prevY + 1) + "_" + (prevX - 2)).classList.add("avaibleAttack");
					}
				}
			}
			if(prevX + 2 < 8) {
				if(prevY - 1 >= 0) {
					if(board[prevY - 1][prevX + 2] == 0) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX + 2)));
					}
					else if(turn %2 == 1 && board[prevY - 1][prevX + 2] < 0) {
						document.getElementById((prevY - 1) + "_" + (prevX + 2)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY - 1][prevX + 2] > 0) {
						document.getElementById((prevY - 1) + "_" + (prevX + 2)).classList.add("avaibleAttack");
					}
				}
				if(prevY + 1 < 8) {
					if(board[prevY + 1][prevX + 2] == 0) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX + 2)));
					}
					else if(turn %2 == 1 && board[prevY + 1][prevX + 2] < 0) {
						document.getElementById((prevY + 1) + "_" + (prevX + 2)).classList.add("avaibleAttack");
					}
					else if(turn %2 == 0 && board[prevY + 1][prevX + 2] > 0) {
						document.getElementById((prevY + 1) + "_" + (prevX + 2)).classList.add("avaibleAttack");
					}
				}
			}
		}
		
		function moveBishop(value){
			var temp = 0;
			for(var y = prevY - 1; y >= 0; y--) {
				for(var x = prevX - 1; x >= 0; x--) {
					if(x - y == prevX - prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY - 1; y >= 0; y--) {
				for(var x = prevX + 1; x < 8; x++) {
					if(x + y == prevX + prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				for(var x = prevX - 1; x >= 0; x--) {
					if(x + y == prevX + prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				for(var x = prevX + 1; x < 8; x++) {
					if(x - y == prevX - prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
		}
		
		function moveQueen(value){
			for(var y = prevY - 1; y >= 0; y--) {
				if(board[y][prevX] == 0) {
					addMoveClass(document.getElementById((y) + "_" + (prevX)));
				}
				else {
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				if(board[y][prevX] == 0) {
					addMoveClass(document.getElementById((y) + "_" + (prevX)));
				}
				else {
					break;
				}
			}
			for(var x = prevX - 1; x >= 0; x--) {
				if(board[prevY][x] == 0) {
					addMoveClass(document.getElementById((prevY) + "_" + (x)));
				}
				else {
					break;
				}
			}
			for(var x = prevX + 1; x < 8; x++) {
				if(board[prevY][x] == 0) {
					addMoveClass(document.getElementById((prevY) + "_" + (x)));
				}
				else {
					break;
				}
			}
			
			//attack
			for(var y = prevY - 1; y >= 0; y--) {
				if(turn %2 == 1 && board[y][prevX] < 0) {
					if(y + 1 < 8) {
						if(board[y + 1][prevX] >= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[y][prevX] > 0){
					if(y + 1 < 8) {
						if(board[y + 1][prevX] <= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[y][prevX] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[y][prevX] < 0) {
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				if(turn %2 == 1 && board[y][prevX] < 0) {
					if(y - 1 >= 0) {
						if(board[y - 1][prevX] >= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[y][prevX] > 0) {
					if(y - 1 >= 0) {
						if(board[y - 1][prevX] <= 0) {
							document.getElementById((y) + "_" + (prevX)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[y][prevX] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[y][prevX] < 0) {
					break;
				}
			}
			for(var x = prevX - 1; x >= 0; x--) {
				if(turn %2 == 1 && board[prevY][x] < 0) {
					if(x + 1 < 8) {
						if(board[prevY][x + 1] >= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 0 && board[prevY][x] > 0) {
					if(x + 1 < 8) {
						if(board[prevY][x + 1] <= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[prevY][x] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] < 0) {
					break;
				}
			}
			for(var x = prevX + 1; x < 8; x++) {
				if(turn %2 == 1 && board[prevY][x] < 0) {
					if(x - 1 >= 0) {
						if(board[prevY][x - 1] >= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
					document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] > 0) {
					if(x - 1 >= 0) {
						if(board[prevY][x - 1] <= 0) {
							document.getElementById((prevY) + "_" + (x)).classList.add("avaibleAttack");
							break;
						}
					}
				}
				else if(turn %2 == 1 && board[prevY][x] > 0) {
					break;
				}
				else if(turn %2 == 0 && board[prevY][x] < 0) {
					break;
				}
			}
			var temp = 0;
			for(var y = prevY - 1; y >= 0; y--) {
				for(var x = prevX - 1; x >= 0; x--) {
					if(x - y == prevX - prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY - 1; y >= 0; y--) {
				for(var x = prevX + 1; x < 8; x++) {
					if(x + y == prevX + prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				for(var x = prevX - 1; x >= 0; x--) {
					if(x + y == prevX + prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
			for(var y = prevY + 1; y < 8; y++) {
				for(var x = prevX + 1; x < 8; x++) {
					if(x - y == prevX - prevY) {
						if(turn %2 == 1 && board[y][x] < 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] > 0) {
							document.getElementById((y) + "_" + (x)).classList.add("avaibleAttack");
							temp = 1;
							break;
						}
						else if(turn %2 == 1 && board[y][x] > 0) {
							temp = 1;
							break;
						}
						else if(turn %2 == 0 && board[y][x] < 0) {
							temp = 1;
							break;
						}
						else if(board[y][x] == 0) {
							addMoveClass(document.getElementById((y) + "_" + (x)));
						}
					}
				}
				if(temp == 1) {
					temp = 0;
					break;
				}
			}
		}
		
		function moveKing(value){
			if(prevY - 1 >= 0) {
				if(turn %2 == 1) {
					if(board[prevY - 1][prevX] == 0) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX)));
					}
					else if(board[prevY - 1][prevX] < 0) {
						document.getElementById((prevY - 1) + "_" + (prevX)).classList.add("avaibleAttack");
					}
				}
				else {
					if(board[prevY - 1][prevX] == 0) {
						addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX)));
					}
					else if(board[prevY - 1][prevX] > 0) {
						document.getElementById((prevY - 1) + "_" + (prevX)).classList.add("avaibleAttack");
					}
				}
				if(prevX - 1 >= 0) {
					if(turn %2 == 1) {
						if(board[prevY - 1][prevX - 1] == 0) {
							addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX - 1)));
						}
						else if(board[prevY - 1][prevX - 1] < 0) {
							document.getElementById((prevY - 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					else {
						if(board[prevY - 1][prevX - 1] == 0) {
							addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX - 1)));
						}
						else if(board[prevY - 1][prevX - 1] > 0) {
							document.getElementById((prevY - 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevX + 1 < 8) {
					if(turn %2 == 1) {
						if(board[prevY - 1][prevX + 1] == 0) {
							addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX + 1)));
						}
						else if(board[prevY - 1][prevX + 1] < 0) {
							document.getElementById((prevY - 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
					else {
						if(board[prevY - 1][prevX + 1] == 0) {
							addMoveClass(document.getElementById((prevY - 1) + "_" + (prevX + 1)));
						}
						else if(board[prevY - 1][prevX + 1] > 0) {
							document.getElementById((prevY - 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
			}
			if(prevY + 1 < 8) {
				if(turn %2 == 1) {
					if(board[prevY + 1][prevX] == 0) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX)));
					}
					else if(board[prevY + 1][prevX] < 0) {
						document.getElementById((prevY + 1) + "_" + (prevX)).classList.add("avaibleAttack");
					}
				}
				else {
					if(board[prevY + 1][prevX] == 0) {
						addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX)));
					}
					else if(board[prevY + 1][prevX] > 0) {
						document.getElementById((prevY + 1) + "_" + (prevX)).classList.add("avaibleAttack");
					}
				}
				if(prevX - 1 >= 0) {
					if(turn %2 == 1) {
						if(board[prevY + 1][prevX - 1] == 0) {
							addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX - 1)));
						}
						else if(board[prevY + 1][prevX - 1] < 0) {
							document.getElementById((prevY + 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
					else {
						if(board[prevY + 1][prevX - 1] == 0) {
							addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX - 1)));
						}
						else if(board[prevY + 1][prevX - 1] > 0) {
							document.getElementById((prevY + 1) + "_" + (prevX - 1)).classList.add("avaibleAttack");
						}
					}
				}
				if(prevX + 1 < 8) {
					if(turn %2 == 1) {
						if(board[prevY + 1][prevX + 1] == 0) {
							addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX + 1)));
						}
						else if(board[prevY + 1][prevX + 1] < 0) {
							document.getElementById((prevY + 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
					else {
						if(board[prevY + 1][prevX + 1] == 0) {
							addMoveClass(document.getElementById((prevY + 1) + "_" + (prevX + 1)));
						}
						else if(board[prevY + 1][prevX + 1] > 0) {
							document.getElementById((prevY + 1) + "_" + (prevX + 1)).classList.add("avaibleAttack");
						}
					}
				}
			}
			if(prevX - 1 >= 0) {
				if(turn %2 == 1) {
					if(board[prevY][prevX - 1] == 0) {
						addMoveClass(document.getElementById((prevY) + "_" + (prevX - 1)));
					}
					else if(board[prevY][prevX - 1] < 0) {
						document.getElementById((prevY) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
				}
				else {
					if(board[prevY][prevX - 1] == 0) {
						addMoveClass(document.getElementById((prevY) + "_" + (prevX - 1)));
					}
					else if(board[prevY][prevX - 1] > 0) {
						document.getElementById((prevY) + "_" + (prevX - 1)).classList.add("avaibleAttack");
					}
				}
			}
			if(prevX + 1 < 8) {
				if(turn %2 == 1) {
					if(board[prevY][prevX + 1] == 0) {
						addMoveClass(document.getElementById((prevY) + "_" + (prevX + 1)));
					}
					else if(board[prevY][prevX + 1] < 0) {
						document.getElementById((prevY) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
				}
				else {
					if(board[prevY][prevX + 1] == 0) {
						addMoveClass(document.getElementById((prevY) + "_" + (prevX + 1)));
					}
					else if(board[prevY][prevX + 1] > 0) {
						document.getElementById((prevY) + "_" + (prevX + 1)).classList.add("avaibleAttack");
					}
				}
			}
		}
		
		function selectMove(value){
			switch(value) {
				case 1:
				case -1:
					movePawn(value);
				break;
				case 2:
				case -2:
					moveRook(value);
				break;
				case 3:
				case -3:
					moveKnight(value);
				break;
				case 4:
				case -4:
					moveBishop(value);
				break;
				case 5:
				case -5:
					moveQueen(value);
				break;
				case 6:
				case -6:
					moveKing(value);
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
						if(isWhite)
							bottomColor = 1;
						else
							bottomColor = -1;
						refreshView(data)
						
						connectToSocket(gameId);
						alert("Game lobby created \n Lobby id: " + data.gameId);
					},
					error: function(error){
						console.log(error);
					}
				})
			}
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
						if(isWhite)
							bottomColor = -1;
						else
							bottomColor = 1;
						refreshView(data)
						
						connectToSocket(gameId);
						alert("Connected \n You are playing with " + data.player1.login);
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
						if(isWhite)
							bottomColor = -1;
						else
							bottomColor = 1;
						refreshView(data)
						
						connectToSocket(gameId);
						alert("Connected \n You are playing with " + data.player1.login);
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
	</body>
</html> 