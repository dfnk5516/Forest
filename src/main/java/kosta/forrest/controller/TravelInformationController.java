package kosta.forrest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.forrest.model.board.dto.ForestDTO;
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
		
		model.addAttribute("cityList", service.selectCity());		
		model.addAttribute("forestArray",forestArray.fromObject(service.selectForest()));
		
		return "board/travelInformation";
	}
}
