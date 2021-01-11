package com.java.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerRepo extends CrudRepository<Player, Integer> {

	List<Player> findByLogin(String login);
	
	List<Player> findAllByOrderByScoreDesc();

}
