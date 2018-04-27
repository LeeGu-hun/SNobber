package controller;

import org.springframework.stereotype.Controller;

import service.MinService;

@Controller
public class MinController {
	private MinService minService;

	public void setMinService(MinService minService) {
		this.minService = minService;
	}
	
}
