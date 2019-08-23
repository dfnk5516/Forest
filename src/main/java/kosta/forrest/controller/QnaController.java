package kosta.forrest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import kosta.forrest.model.board.dto.QnaDTO;
import kosta.forrest.model.board.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	/**
	 * 전체 리스트
	 * */
	@RequestMapping("/qnalist")
	public ModelAndView selectAll() {
		System.out.println("qnaList");
		List<QnaDTO> list = qnaService.selectAll();
		ModelAndView mv = new ModelAndView();
		
		//Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("33");
		//map.put("list", list);
		mv.addObject("qnaDTO" , list);
		mv.setViewName("qna/qnalist");
		return mv;
	}
//	/**
//	 * 검색
//	 * */
//	@RequestMapping("selectByName")
//	public List<QnaDTO> selectByName(HttpServletRequest request){
//		List<QnaDTO> list=qnaService.selectByQnaName(request.getParameter("name"));
//		System.out.println("list="+list);
//		return list;
//	}
		
}

