package com.java.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface PlayerRepo extends CrudRepository<Player, Integer> {

	List<Player> findByLogin(String login);

}
