package com.java.model;

import lombok.Data;

@Data
public class Game {
	
	private String gameId;
	private Player player1, player2;
	private Piece [][] player1Pieces, player2Pieces;
	private GameStatus gamestatus;
	private Piece[][] board;
	private Player winner;
	private boolean player1White;
}
