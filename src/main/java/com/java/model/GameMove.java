package com.java.model;

import lombok.Data;

@Data
public class GameMove {
	
	private Piece piece;
	private Integer newX, newY;
	private Integer prevX, prevY;
	private String gameId;
}
