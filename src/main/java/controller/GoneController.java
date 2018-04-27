package controller;

import org.springframework.stereotype.Controller;

import service.GoneService;

@Controller
public class GoneController {
	private GoneService goneService;

	public void setGoneService(GoneService goneService) {
		this.goneService = goneService;
	}

}
