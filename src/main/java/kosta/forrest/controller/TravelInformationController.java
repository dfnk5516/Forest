package kosta.forrest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.forrest.model.board.service.TravelInformationService;
import net.sf.json.JSONArray;

@Controller
public class TravelInformationController
{
	@Autowired
	private TravelInformationService service;
	
	@RequestMapping("/travelInformation")
	public String index(Model model)
	{
		JSONArray forestArray = new JSONArray();
		JSONArray videoArray = new JSONArray();
		
		model.addAttribute("cityList", service.selectCity());
		model.addAttribute("videoArray", videoArray.fromObject(service.selectVideo()));
		model.addAttribute("forestArray",forestArray.fromObject(service.selectForest()));
		
		return "board/travelInformation";
	}
	
	@RequestMapping("/travelInformationWrite")
	public String write(Model model)
	{
		System.out.println(1111111111);
		return "board/travelInformationWrite";
	}
}
