package kosta.forrest.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.forrest.model.board.dto.FaqDTO;
import kosta.forrest.model.board.service.BoardPager;
import kosta.forrest.model.board.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	private String path ="resources/images/bbsImg/";
	
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
	  * 위지윅에디터 이미지 업로드
	  */
	  @RequestMapping("/imageUpload")
	  @ResponseBody
	  public String imageUpload(MultipartFile file, HttpServletRequest request)throws IOException {
		  String fileName = UUID.randomUUID()+".jpg";
		  String fileSave = request.getSession().getServletContext().getRealPath("/")+path+fileName;
		  String fileUrl = request.getContextPath()+"/"+path+fileName;
		  
		  if(file.getSize() > 0) {
			  file.transferTo(new File(fileSave));
		  }
		  
		  return fileUrl;
	  }
	  
	/**
	 * 등록
	 */
	  @RequestMapping("/faqInsert")
	  public String faqInsert(FaqDTO faqDTO) {
		  	System.out.println("등록");
		  	System.out.println(faqDTO.getFaqTitle());
		  	faqService.faqInsert(faqDTO);
	    	return "redirect:faq";
	    }
	
	/**
	 * 수정
	 */
//	@RequestMapping("/faqUpdate")
//	public String update(FaqDTO faqDTO) {
//		faqService.faqUpdate(faqDTO);
//		return "redirect:faq";
//	}
	
	/**
	 * 삭제
	 */
    @RequestMapping("/faqDelete")
    @ResponseBody
    public void faqDelete(@RequestParam(defaultValue = "0") int faqNo) {
    	faqService.faqDelete(faqNo);
    }
	  
}
