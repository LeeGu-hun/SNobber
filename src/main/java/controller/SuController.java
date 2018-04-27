package controller;

import org.springframework.stereotype.Controller;

import service.SuService;

@Controller
public class SuController {
	private SuService suService;

	public void setSuService(SuService suService) {
		this.suService = suService;
	}
	
}
