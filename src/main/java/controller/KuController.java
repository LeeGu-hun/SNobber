package controller;

import org.springframework.stereotype.Controller;

import service.KuService;

@Controller
public class KuController {
	private KuService kuService;

	public void setKuService(KuService kuService) {
		this.kuService = kuService;
	}
	
}
