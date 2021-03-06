package kosta.forrest.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.forrest.model.board.dto.BookingDTO;
import kosta.forrest.model.board.dto.Criteria;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.LodgeDTO;
import kosta.forrest.model.board.service.ForestService;
import kosta.forrest.model.board.service.LodgeService;

@Controller
@RequestMapping("/forest")
public class ForestController {

	@Autowired
	private ForestService forestService;
	@Autowired
	private LodgeService lodgeService;
	
	private String path="/resources/images/forestImg";
	
	@RequestMapping("/list")
	public ModelAndView selectAll(Criteria cri) {
		//System.out.println("ForestController의 selectAll호출");
		//System.out.println("시작페이지 = "+cri.getStartPage()+"cri ::"+cri);
		ModelAndView mv = new ModelAndView();
		List<ForestDTO> list = forestService.selectAll(cri);
		mv.addObject("cri", cri);
		mv.addObject("list", list);
		mv.setViewName("forest/list");
		
		return mv;
	}
	
	@RequestMapping("/lodgeAll")
	@ResponseBody
	public List<LodgeDTO> lodgeAll(int forestNo) {
		//System.out.println("ForestController의 lodgeAll호출::"+forestNo);
		List<LodgeDTO> list = lodgeService.selectAll(forestNo);
		return list;
	}
	
	//restful방식 이용
	@RequestMapping("/read/{forestNo}")
	public ModelAndView selectByForestNo(@PathVariable int forestNo) {
		//System.out.println("ForestController의 selectByForestNo호출 = " + forestNo);
		ForestDTO dbDTO = forestService.selectByForestNo(forestNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", dbDTO);
		mv.setViewName("forest/read");
		return mv;
	}
	
	@RequestMapping("/selectBySearch/{keyField}/{keyWord}")
	public ModelAndView selectBySearch(@PathVariable String keyField, @PathVariable String keyWord) {
		//System.out.println("ForestController의 selectAll호출");
		ModelAndView mv = new ModelAndView();
		List<ForestDTO> list = forestService.selectBySearch(keyWord, keyField);
		mv.addObject("list", list);
		mv.setViewName("forest/list");
		return mv;
	}
	
	@RequestMapping("/write")
	public void writeForm() {}
	
	@RequestMapping("/insert")
	public String insert(ForestDTO forestDTO) throws IllegalStateException, IOException {
		System.out.println("ForestController의 insert호출");
		MultipartFile file = forestDTO.getForestFile();
		System.out.println("size"+file.getSize());
		if(file.getSize() > 0) {//파일이 첨부되었다면..
			String fileName = file.getOriginalFilename();
			long fileSize=file.getSize();
			
			forestDTO.setForestFilename(fileName);
			
			//파일저장
			file.transferTo(new File(path+"/"+fileName));
		}
		forestService.insert(forestDTO);
		
		return "redirect:list";
	}
	
//	@RequestMapping("/delete/{forestNo}")
//	public String delete(@PathVariable int forestNo) {
//		System.out.println("ForestController의 delete호출");
//		//int forestNum = Integer.parseInt(forestNo);
//		forestService.delete(forestNo);	
//		return "redirect:list";
//	}
	
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(int forestNo) {	
		System.out.println("ForestController의 selectByForestNo호출 = " + forestNo);
		ForestDTO dbDTO = forestService.selectByForestNo(forestNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("forestDTO", dbDTO);
		mv.setViewName("forest/update");
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(ForestDTO forestDTO) {
		forestService.update(forestDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("forestDTO", forestDTO);
		mv.setViewName("redirect:read/"+forestDTO.getForestNo());
		return mv;
	}
	
	@RequestMapping("/delete")
	public String delete(int forestNo) {
		System.out.println("ForestController의 delete호출");
		forestService.delete(forestNo);	
		return "redirect:list";
	}
	
	//예약하기 폼이동
	@RequestMapping("/bookingForm")
	public ModelAndView bookingForm(String lodgeCode) {
		System.out.println("ForestController의 bookingForm호출");
		BookingDTO bookingDTO = lodgeService.selectBookInfo(lodgeCode);
		ModelAndView mv = new ModelAndView();
		mv.addObject("bookingDTO", bookingDTO);
		mv.setViewName("forest/booking");
		return mv;
	}
	
	//예약하기
	@RequestMapping("/bookingInsert")
	public String bookInsert(BookingDTO bookingDTO) {
		System.out.println("ForestController의 bookInsert호출");
		lodgeService.bookingInsert(bookingDTO);
		return "redirect:list";
	}
	
	//예약 목록
	@RequestMapping("/bookList")
	public ModelAndView bookList() {
		System.out.println("ForestController의 bookList호출");
		ModelAndView mv = new ModelAndView();
		List<BookingDTO> list = lodgeService.selectBookAll();
		mv.addObject("list", list);
		mv.setViewName("forest/bookList");
		
		return mv;
	}
	
	//예약 상세보기
	@RequestMapping("/bookDetail/{bookCode}")
	public ModelAndView selectByBook(@PathVariable int bookCode) {
		BookingDTO dbDTO = lodgeService.selectByBookingCode(bookCode);
		ModelAndView mv = new ModelAndView();
		mv.addObject("bookingDTO", dbDTO);
		mv.setViewName("forest/bookDetail");
		return mv;
	}
	
	
}
