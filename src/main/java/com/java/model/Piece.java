package com.java.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Piece {
	
	private Integer value;
	private Character symbol;
	
	public Piece(PieceInfo pieceInfo){
		this.value = pieceInfo.getValue();
		this.symbol = pieceInfo.getSymbol();
	}
}
