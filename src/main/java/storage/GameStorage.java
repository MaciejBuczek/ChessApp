package storage;

import java.util.HashMap;
import java.util.Map;

import com.java.model.Game;
import com.java.model.GameStatus;

public class GameStorage {
	
	private static GameStorage instance = null;
	
	private static Map<String, Game> games;
	
	private GameStorage() {
		games = new HashMap<>();
	}
	
	public static synchronized GameStorage getInstance() {
		if(instance == null)
			instance = new GameStorage();
		return instance;
	}
	
	public Map<String, Game> getGames(){
		return games;
	}
	
	public Game getRandomGame() throws Exception {
		
		Game game = games.values().stream().filter(g -> g.getGamestatus().equals(GameStatus.NEW)).findFirst().orElseThrow(() -> new Exception("No game can be found"));
		return game;
	}
	
	public Game getGame(String gameId) {
		
		return games.get(gameId);
	}
	
	public void setGame(Game game) {
		games.put(game.getGameId(), game);
	}
}
