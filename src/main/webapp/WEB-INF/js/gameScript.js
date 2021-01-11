
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
		case 1:
		break;
		
	}
}
