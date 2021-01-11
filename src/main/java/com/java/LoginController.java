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
        ModelAndView mv = new ModelAndView("login.jsp");

        return mv;
    }
	
	@RequestMapping("login")
	public ModelAndView login(@RequestParam("login") String login,
								@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("login.jsp");
		List<Player> player = null;
		try {
			player = repo.findByLogin(login);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(player.size() != 0 && player.get(0).getPassword().equals(password)) {
				Player user = player.get(0);
				List<Player> ordered = repo.findAllByOrderByScoreDesc();
				for(int i = 0; i<ordered.size(); i++) {
					if(ordered.get(i).getId() == user.getId()) {
						mv.addObject("ranking", i);
						break;
					}
				}
				mv.addObject("player", user);
				mv.setViewName("home.jsp");
		}
		
		return mv;
	}
	
	@RequestMapping("registerForm")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("register.jsp");
		
		return mv;
	}
	
	@RequestMapping("register")
	public ModelAndView register(@RequestParam("login") String login,
								@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("register.jsp");
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
			mv.setViewName("login.jsp");
		}
		
		return mv;
	}
	
}
