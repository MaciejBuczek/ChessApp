package controller.dto;

import com.java.model.Player;

import lombok.Data;

@Data
public class ConnectRequest {
	private Player player;
	private String gameId;
}
