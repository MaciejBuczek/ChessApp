package com.java;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.model.Player;
import com.java.model.PlayerRepo;


@Controller
public class LoginController {
	
	@Autowired
	PlayerRepo repo;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
	
	@RequestMapping("login")
	public ModelAndView login(@RequestParam("login") String login,
								@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("login");
		List<Player> player = null;
		try {
			player = repo.findByLogin(login);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(player.size() != 0 && player.get(0).getPassword().equals(password)) {
				mv.addObject("login", login);
				mv.setViewName("home");
		}
		
		return mv;
	}
	
	@RequestMapping("registerForm")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("register");
		
		return mv;
	}
	
	@RequestMapping("register")
	public ModelAndView register(@RequestParam("login") String login,
								@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("register");
		List<Player> player = null;
		try {
			player = repo.findByLogin(login);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(player.size() == 0) {
			Player temp = new Player(login, password);
			repo.save(temp);
			mv.addObject("login", login);
			mv.setViewName("login");
		}
		
		return mv;
	}

}