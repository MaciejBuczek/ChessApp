package com.java;

import java.util.Arrays;
import java.util.Random;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.java.model.Game;
import com.java.model.GameMove;
import com.java.model.GameStatus;
import com.java.model.Piece;
import com.java.model.PieceInfo;
import com.java.model.Player;

import controller.dto.GameFindRequest;
import lombok.AllArgsConstructor;
import storage.GameStorage;

@Service
@AllArgsConstructor
public class GameService {
	public Game createGame(Player player) {
		Game game = new Game();
		
		game.setBoard(new Piece[8][8]);
		for(var row : game.getBoard())
			Arrays.fill(row, new Piece(PieceInfo.NO_PIECE));	
		
		game.setPlayer1White(new Random().nextBoolean());
		if(game.isPlayer1White()) {
			game.setPlayer1Pieces(getWhitePieces());
			game.setPlayer2Pieces(getBlackPieces());
		}
		else {
			game.setPlayer1Pieces(getBlackPieces());
			game.setPlayer2Pieces(getWhitePieces());
		}
		
		initializeBoard(game.getBoard(), game.getPlayer1Pieces(), game.getPlayer2Pieces());
			
		game.setGameId(UUID.randomUUID().toString());
		game.setPlayer1(player);
		game.setGamestatus(GameStatus.NEW);
		
		GameStorage.getInstance().setGame(game);
		
		return game;
	}
	
	public Game connectToGame(Player player, String gameId) throws Exception {
		
		if(!GameStorage.getInstance().getGames().containsKey(gameId))
			throw new Exception ("Game with provided id doesn't exists");
		
		Game game = GameStorage.getInstance().getGame(gameId);
		if(game.getGamestatus().equals(GameStatus.IN_PROGRESS))
			throw new Exception ("Game is already in progress");
		
		game.setPlayer2(player);
		game.setGamestatus(GameStatus.IN_PROGRESS);
		
		return game;
	}
	
	public Game connectToRandomGame(Player player) throws Exception {
		
		Game game = GameStorage.getInstance().getRandomGame();
		game.setPlayer2(player);
		game.setGamestatus(GameStatus.IN_PROGRESS);
		GameStorage.getInstance().setGame(game);
		
		return game;
	}
	
	public Game gameTurn(GameMove move) throws Exception {
		
		if(!GameStorage.getInstance().getGames().containsKey(move.getGameId()))
			throw new Exception ("Game with provided id doesn't exists");
		Game game = GameStorage.getInstance().getGame(move.getGameId());
		
		if(game.getGamestatus().equals(GameStatus.FINISHED))
			throw new Exception ("Game is already finished");
		
		processMove(game, move);
		
		if(checkForWinner(game.getPlayer2Pieces()))
			game.setWinner(game.getPlayer1());
		if(checkForWinner(game.getPlayer1Pieces()))
			game.setWinner(game.getPlayer2());
		
		GameStorage.getInstance().setGame(game);
		
		return game;
	}
	
	public GameFindRequest validateGame(String id) {
		GameFindRequest gameFindRequest = new GameFindRequest();
		gameFindRequest.setIsCorrectID(GameStorage.getInstance().isIdCorrect(id));
		gameFindRequest.setAreAvilableGames(GameStorage.getInstance().areAvilableGames());
		return gameFindRequest;
	}
	
	private Piece[][] getWhitePieces() {
		Piece[][] pieces = new Piece[2][8];
		for(int i = 0 ; i <pieces[0].length; i++) {
			pieces[0][i] = new Piece(PieceInfo.PAWN_WHITE);
		}
		pieces[1][0] = new Piece(PieceInfo.ROOK_WHITE);
		pieces[1][1] = new Piece(PieceInfo.KNIGHT_WHITE);
		pieces[1][2] = new Piece(PieceInfo.BISHOP_WHITE);
		pieces[1][3] = new Piece(PieceInfo.QUEEN_WHITE);
		pieces[1][4] = new Piece(PieceInfo.KING_WHITE);
		pieces[1][5] = new Piece(PieceInfo.BISHOP_WHITE);
		pieces[1][6] = new Piece(PieceInfo.KNIGHT_WHITE);
		pieces[1][7] = new Piece(PieceInfo.ROOK_WHITE);
		
		return pieces;
	}
	
	private Piece[][] getBlackPieces() {
		Piece[][] pieces = new Piece[2][8];
		for(int i = 0 ; i <pieces[0].length; i++) {
			pieces[0][i] = new Piece(PieceInfo.PAWN_BLACK);
		}
		pieces[1][0] = new Piece(PieceInfo.ROOK_BLACK);
		pieces[1][1] = new Piece(PieceInfo.KNIGHT_BLACK);
		pieces[1][2] = new Piece(PieceInfo.BISHOP_BLACK);
		pieces[1][3] = new Piece(PieceInfo.QUEEN_BLACK);
		pieces[1][4] = new Piece(PieceInfo.KING_BLACK);
		pieces[1][5] = new Piece(PieceInfo.BISHOP_BLACK);
		pieces[1][6] = new Piece(PieceInfo.KNIGHT_BLACK);
		pieces[1][7] = new Piece(PieceInfo.ROOK_BLACK);
		
		return pieces;
	}
	
	private void initializeBoard(Piece[][] board, Piece[][] player1Pieces, Piece[][] player2Pieces) {
		int i = 0;
		int j = 1;
		for(var row : player2Pieces) {
			for(var piece : row) {
				board[j][i] = piece;
				if(++i == board[0].length) {
					i = 0;
					j = 0;
				}
			}	
		}
		j = 6;
		for(var row : player1Pieces) {
			for(var piece : row) {
				board[j][i] = piece;
				if(++i == board[0].length) {
					i = 0;
					j++;
				}
			}	
		}
	}
	
	private void processMove(Game game, GameMove move) {
		
		if(game.getBoard()[move.getNewY()][move.getNewX()].getValue() > 0) {
			if(game.isPlayer1White())
				removePlayerPiece(game.getPlayer1Pieces(), game.getBoard()[move.getNewY()][move.getNewX()]);
			else
				removePlayerPiece(game.getPlayer2Pieces(), game.getBoard()[move.getNewY()][move.getNewX()]);
		}
		else if(game.getBoard()[move.getNewY()][move.getNewX()].getValue() < 0) {
			if(!game.isPlayer1White())
				removePlayerPiece(game.getPlayer1Pieces(), game.getBoard()[move.getNewY()][move.getNewX()]);
			else
				removePlayerPiece(game.getPlayer2Pieces(), game.getBoard()[move.getNewY()][move.getNewX()]);
		}
		
		game.getBoard()[move.getNewY()][move.getNewX()] = new Piece(move.getPiece());
		game.getBoard()[move.getPrevY()][move.getPrevX()] = new Piece(PieceInfo.NO_PIECE);
		
	}
	
	private void removePlayerPiece(Piece[][] playerPieces, Piece piece) {
		for(int i=0; i< playerPieces.length; i++) {
			for(int j =0 ; j< playerPieces[i].length; j++) {
				if(playerPieces[i][j].getValue() == piece.getValue()) {
					playerPieces[i][j] = new Piece(PieceInfo.NO_PIECE);
					break;
				}
			}
		}
	}
	
	private boolean checkForWinner(Piece[][] playerPieces) {
		return playerPieces[1][4].getValue() == PieceInfo.NO_PIECE.getValue();
	}

}
