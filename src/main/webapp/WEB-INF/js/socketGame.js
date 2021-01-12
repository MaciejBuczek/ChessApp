
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
	Swal.fire(
	  'Good job!',
	  'You clicked the button!',
	  'success'
	)
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
				displayCreateInfo();
				
				connectToSocket(gameId);
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