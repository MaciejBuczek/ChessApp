package com.java;

import java.util.Arrays;
import java.util.Random;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.java.model.Game;
import com.java.model.GameMove;
import com.java.model.GameStatus;
import com.java.model.Piece;
import com.java.model.Player;

import lombok.AllArgsConstructor;
import storage.GameStorage;

@Service
@AllArgsConstructor
public class GameService {
	public Game createGame(Player player) {
		Game game = new Game();
		
		game.setBoard(new Piece[8][8]);
		for(var row : game.getBoard())
			Arrays.fill(row, Piece.NO_PIECE);	
		
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
	
	private Piece[][] getWhitePieces() {
		Piece[][] pieces = new Piece[2][8];
		for(int i = 0 ; i <pieces[0].length; i++) {
			pieces[0][i] = Piece.PAWN_WHITE;
		}
		pieces[1][0] = Piece.ROOK_WHITE;
		pieces[1][1] = Piece.KNIGHT_WHITE;
		pieces[1][2] = Piece.BISHOP_WHITE;
		pieces[1][3] = Piece.QUEEN_WHITE;
		pieces[1][4] = Piece.KING_WHITE;
		pieces[1][5] = Piece.BISHOP_WHITE;
		pieces[1][6] = Piece.KNIGHT_WHITE;
		pieces[1][7] = Piece.ROOK_WHITE;
		
		return pieces;
	}
	
	private Piece[][] getBlackPieces() {
		Piece[][] pieces = new Piece[2][8];
		for(int i = 0 ; i <pieces[0].length; i++) {
			pieces[0][i] = Piece.PAWN_BLACK;
		}
		pieces[1][0] = Piece.ROOK_BLACK;
		pieces[1][1] = Piece.KNIGHT_BLACK;
		pieces[1][2] = Piece.BISHOP_BLACK;
		pieces[1][3] = Piece.QUEEN_BLACK;
		pieces[1][4] = Piece.KING_BLACK;
		pieces[1][5] = Piece.BISHOP_BLACK;
		pieces[1][6] = Piece.KNIGHT_BLACK;
		pieces[1][7] = Piece.ROOK_BLACK;
		
		return pieces;
	}
	
	private void initializeBoard(Piece[][] board, Piece[][] player1Pieces, Piece[][] player2Pieces) {
		int i = 0;
		int j = 0;
		for(var row : player2Pieces) {
			for(var piece : row) {
				board[i][j] = piece;
				if(++i == board[0].length) {
					i = 0;
					j++;
				}
			}	
		}
		j = 6;
		for(var row : player1Pieces) {
			for(var piece : row) {
				board[i][j] = piece;
				if(++i == board[0].length) {
					i = 0;
					j++;
				}
			}	
		}
	}
	
	private void processMove(Game game, GameMove move) {
		game.getBoard()[move.getNewY()][move.getNewY()] = move.getPiece();
		game.getBoard()[move.getPrevY()][move.getPrevX()] = Piece.NO_PIECE;
	}
	
	private boolean checkForWinner(Piece[][] playerPieces) {
		return playerPieces[1][4].equals(Piece.NO_PIECE);
	}
}
