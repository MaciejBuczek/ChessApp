package com.java;

import org.springframework.http.ResponseEntity;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.Game;
import com.java.model.GameMove;
import com.java.model.Player;

import controller.dto.ConnectRequest;
import controller.dto.GameFindRequest;
import controller.dto.GameValidateRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
@RequestMapping("/game")
public class GameController {

	private final GameService gameService;
	private final SimpMessagingTemplate simpMessagingTemplate;
	
	@PostMapping("/start")
	public ResponseEntity<Game> start(@RequestBody Player player){
		log.info("game start request {}", player);
		return ResponseEntity.ok(gameService.createGame(player));
	}
	
	@PostMapping("/connect")
	public ResponseEntity<Game> connect(@RequestBody ConnectRequest request) throws Exception{
		log.info("connect request {}", request);
		return ResponseEntity.ok(gameService.connectToGame(request.getPlayer(), request.getGameId()));
	}
	
	@PostMapping("/connect/random")
	public ResponseEntity<Game> connectRandom(@RequestBody Player player) throws Exception{
		log.info("connect random {}", player);
		return ResponseEntity.ok(gameService.connectToRandomGame(player));
	} 
	
	@PostMapping("/gameTurn")
	public ResponseEntity<Game> gameTurn(@RequestBody GameMove gameMove) throws Exception{
		log.info("game move {}", gameMove);
		Game game = gameService.gameTurn(gameMove);
		simpMessagingTemplate.convertAndSend("/topic/gameProgress/"+game.getGameId(),game);
		return ResponseEntity.ok(game);
	} 
	
	@PostMapping("/vaidateId")
	public ResponseEntity<GameFindRequest> validateId(@RequestBody GameValidateRequest request) throws Exception{
		log.info("id validate request {}", request.getId());
		return ResponseEntity.ok(gameService.validateGame(request.getId()));
	} 
	
}
