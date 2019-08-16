package kosta.forrest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.forrest.model.board.dto.FaqDTO;
import kosta.forrest.model.board.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/**
	 * 전체출력 or 조건검색
	 */
	@RequestMapping("/list")
	public ModelAndView faqList(@RequestParam(defaultValue = "faqTitle") String option,
								@RequestParam(defaultValue = "") String keyWord) {
		
		List<FaqDTO> list = faqService.selectAll(option, keyWord);
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("option", option);
		map.put("keyWord", keyWord);
		
		mv.addObject("map" , map);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	
}
