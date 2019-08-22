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
import kosta.forrest.model.board.service.BoardPager;
import kosta.forrest.model.board.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/**
	 * 전체출력(조건검색, 카운트, 페이징)
	 */
	@RequestMapping("/faq")
	public ModelAndView faqList(@RequestParam(defaultValue = "all") String option,
								@RequestParam(defaultValue = "") String keyWord,
								@RequestParam(defaultValue = "1") int curPage) {
		
		int count = faqService.countArticle(option, keyWord);
		
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<FaqDTO> list = faqService.selectAll(start, end, option, keyWord);
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("count", count);
		map.put("option", option);
		map.put("keyWord", keyWord);
		map.put("boardPager", boardPager);
		
		mv.addObject("map" , map);
		mv.setViewName("board/faq");
		
		return mv;
	}
	
	
	@RequestMapping("/faqWrite")
	public String write() {
		return "board/faqWrite";
	}
	
	
	/**
	 * 등록
	 */
//	@RequestMapping("/faqInsert")
//	public String insert() {
//		
//	}
	
	/**
	 * 수정
	 */
	
	/**
	 * 삭제
	 */
}
