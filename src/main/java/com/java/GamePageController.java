package com.java;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GamePageController {
	
	@RequestMapping("create")
	public ModelAndView create(@RequestParam("login") String login) {
		ModelAndView mv = new ModelAndView("game.jsp");
		mv.addObject("action", "create");
		mv.addObject("login", login);
		mv.addObject("gameId", "0");
		mv.setViewName("game.jsp");
		return mv;
	}
	@RequestMapping("connect")
	public ModelAndView connect(@RequestParam("login") String login, @RequestParam("gameId") String gameId) {
		ModelAndView mv = new ModelAndView("game.jsp");
		mv.addObject("action", "connect");
		mv.addObject("login", login);
		mv.addObject("gameId", gameId);
		mv.setViewName("game.jsp");
		return mv;
	}
	@RequestMapping("connectRandom")
	public ModelAndView connectRandom(@RequestParam("login") String login) {
		ModelAndView mv = new ModelAndView("game.jsp");
		mv.addObject("action", "connectRandom");
		mv.addObject("login", login);
		mv.addObject("gameId", "0");
		mv.setViewName("game.jsp");
		return mv;
	}
}
