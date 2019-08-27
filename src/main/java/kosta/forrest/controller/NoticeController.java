package kosta.forrest.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.NoticeDTO;
import kosta.forrest.model.board.service.NoticeService;




@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//private String path ="C:\\Edu\\springFileSave\\";
	
	//private String path ="C:\\Users\\sungmin\\Desktop\\sunghee";
	private String path = "C:\\Users\\kosta\\Desktop\\forest자연휴양림";
	@RequestMapping("/noticelist")
	public ModelAndView noticeList(@RequestParam(defaultValue = "all") String option,
								@RequestParam(defaultValue = "") String keyWord,
								@RequestParam(defaultValue = "1") int curPage) {
		
		//int count = noticeService.countArticle(option, keyWord);
		
		//BoardPager boardPager = new BoardPager(count, curPage);
		//int start = boardPager.getPageBegin();
		//int end = boardPager.getPageEnd();
		List<NoticeDTO> list = noticeService.selectAll(option, keyWord);
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		//map.put("count", count);
		map.put("option", option);
		map.put("keyWord", keyWord);
		//map.put("boardPager", boardPager);
		
		mv.addObject("map" , map);
		mv.setViewName("/board/noticelist");
		return mv;
	}
	
	@RequestMapping("/noticewrite")
    public ModelAndView write(String noticeNo) {
		ModelAndView mv = new ModelAndView("/noticewrite");
		
		if(noticeNo != null) {
			NoticeDTO noticeDTO = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo), true);
			mv.addObject("noticeDTO" , noticeDTO);
		
		}
		mv.setViewName("/board/noticewrite");
		return mv;
	}
	
	@PostMapping("/noticeinsert")
	 public String insert(NoticeDTO dto)throws IOException {
		MultipartFile file = dto.getFile();
    	if(file.getSize() > 0 ) {//파일이 첨부되었다면....
    		String fileName = file.getOriginalFilename();
    		long fileSize = file.getSize();
    		
    		dto.setNoticeImg(path+"/" + fileName);
    		
    		dto.setNoticeFname(fileName);
    		dto.setNoticeFsize(fileSize);
    		
    		//파일저장
    		file.transferTo(new File(path+"/" + fileName));
    	}
    	
		if(dto.getNoticeNo() > 0) {
			noticeService.update(dto);
		} else {
			noticeService.insert(dto);
		}
    	
    	return "redirect:noticelist";
    }
	/**
     * 상세보기
     * */
    @RequestMapping("/noticeread")
    public ModelAndView read(String noticeNo) {
    	NoticeDTO noticeDTO = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo), true);
    	System.out.print(noticeDTO.getNoticeTitle());
    	
    	return new ModelAndView("/board/noticeread", "noticeDTO", noticeDTO);
    }
    /**
     * 다운로드
     * */
    @RequestMapping("/noticedown")
    public ModelAndView down(String option, String keyWord ,String noticefname) {
    	File file = new File(path+"/"+noticefname);
    	
    	return new ModelAndView("downLoadView", "noticefname", file);
    }
    
    /**
     * 수정하기 폼이동
     */
    @RequestMapping("/noticeupdateForm")
	public ModelAndView updateForm(String noticeNo) {	
		
    	ModelAndView mv = new ModelAndView("/noticeupdateform");
    	if(noticeNo != null) {
			NoticeDTO noticeDTO = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo), true);
			mv.addObject("noticeDTO" , noticeDTO);
		
		}
		mv.setViewName("/board/noticeupdate");
		return mv;
	}

    /**
     * 수정하기
     * */
    @RequestMapping("/noticeupdate")
    public ModelAndView update(NoticeDTO noticeDTO) { 
    	noticeService.update(noticeDTO);//
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("noticeDTO", noticeDTO);
		mv.setViewName("redirect:noticeread/"+noticeDTO.getNoticeNo());
		return mv;
	}

    /**
     * 삭제하기
     * */
    @RequestMapping("/noticedelete")
    public String delete(int noticeNo) {
    	noticeService.delete( noticeNo);
    	
    	return "redirect:list";
    }
}

