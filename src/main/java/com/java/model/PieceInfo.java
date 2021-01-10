package com.java.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum PieceInfo {
	
	NO_PIECE(0, ' '),
	
	PAWN_WHITE (1, '\u2659'),
	ROOK_WHITE (2, '\u2656'),
	KNIGHT_WHITE (3, '\u2658'),
	BISHOP_WHITE  (4, '\u2657'),
	QUEEN_WHITE (5, '\u2655'),
	KING_WHITE (6, '\u2654'),
	
	PAWN_BLACK (-1, '\u265F'),
	ROOK_BLACK (-2, '\u265C'),
	KNIGHT_BLACK (-3, '\u265E'),
	BISHOP_BLACK (-4, '\u265D'),
	QUEEN_BLACK (-5, '\u265B'),
	KING_BLACK (-6, '\u265A');
	
	private Integer value;
	private Character symbol;
	
}
