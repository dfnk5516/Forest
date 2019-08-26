package kosta.forrest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.regexp.internal.recompile;

import kosta.forrest.model.user.dto.UserDTO;
import kosta.forrest.model.user.service.UserService;

@Controller
//@RestController --> ResponseBody랑 같이 있어서 이걸 쓰려면 비동기화 통신일 때 사용한다.
public class UserController {

	@Autowired
	private UserService userService;

	// 회원정보수정시 비밀번호 <암호화처리>를 위한 객체를 주입받는다.
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	/*
	 * //회원 가입하기 :: redirect 방식
	 * @RequestMapping("/registerMember") public String insertUser(UserDTO userDTO)
	 * { return "redirect:/"; }
	 */

	// 회원가입 폼
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "user/registerForm";
	}

	// 가입하고 가입한 정보 확인하는 페이지
	@RequestMapping("/registerUser")
	public String registerUser(UserDTO userDTO) {
		// ModelAndView mv = new ModelAndView();
		userService.registerUser(userDTO);
		// mv.addObject("userDTO", userDTO);//가입 화면에서 받은 값을 registerUser화면에서 값을 띄울 때
		// 전달해주기 위해서 addObject 해줌("userDTO", userDTO);
		// mv.setViewName("board/home");
		return "board/home";
	}

	// 로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	// 특정 회원 검색하기
	@RequestMapping("user/findUser")
	public ModelAndView findUser(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		UserDTO userDTO = userService.findUserById(userId);
		return new ModelAndView("user/findUserResult", "userDTO", userDTO);
	}

	// 아이디 중복확인
	@RequestMapping("/idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return userService.idcheck(request.getParameter("id"));
	}

	// 주소 종류별 검색 :: select form
	@RequestMapping("user/addressList")
	public ModelAndView addressList() {
		System.out.println("addressList");
		return new ModelAndView("user/addressList", "list", userService.getAddressList());
	}

	@RequestMapping("findUserListByAddress")
	@ResponseBody
	public List<UserDTO> findUserListByAddress(HttpServletRequest request) { // ?address
		List<UserDTO> list = userService.findUserListByAddress(request.getParameter("address"));
		System.out.println("list = " + list);
		return list;
	}

	// 회원정보 수정 페이지
	@RequestMapping("user/updateForm")
	public String updateForm() {
		return "user/updateForm";
	}

	/*
	 * Authentication은 세션처럼 어디에 저장해두면 로그아웃 할 때 까지는 계속 존재, 그래서 회원정보 수정 시 수정된 정보와
	 * Authentication 에 있는 정보가 불일치 할 때 그 정보를 일치시켜주기 위해서 밑에서 값을 set 으로 바꿔줘야 된다.
	 */
	@RequestMapping("updateUserAction")
	public ModelAndView updateUserAction(HttpServletRequest request, UserDTO userDTO) {
		System.out.println("1. UserDTO  :: " + userDTO);
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		UserDTO userDto = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		 * ObjectType으로 principal 이 들어오는데, 진짜로 들어있는 것은 UserDTO ---
		 * userAuthenticationProvider의 return new UsernamePasswordAuthenticationToken(dto, null, authList); 의 dto..
		 */

		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + userDto);

		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(userDTO.getUserPwd());
		userDTO.setUserPwd(encodePassword);
		userService.updateUser(userDTO);

		System.out.println("**********************************************");
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다 /
		userDto.setUserPwd(encodePassword);
		userDto.setUserName(userDTO.getUserName());
		userDto.setUserAddr(userDTO.getUserAddr());
		System.out.println("3. Spring Security 세션 수정 후 회원정보 : " + userDto);

		return new ModelAndView("user/updateResult"); 
	}

	//////////////////////////////////// 관리자 기능 ////////////////////////////////////
	/* 회원 리스트 페이지로 이동 */
	@RequestMapping(value = "/admin/list")
	public ModelAndView list(HttpSession session) { // HttpSession session
		List<UserDTO> userList = userService.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", userList);
		mv.setViewName("admin/list");
		return mv;
	}
	
	/* 회원정보 상세보기 페이지로 이동 */
	@RequestMapping("/admin/read/{userId}")
	public ModelAndView read(@PathVariable String userId) {
		UserDTO userDTO = userService.selectByUserId(userId);
		return new ModelAndView("admin/read", "user", userDTO);
	}

	// 회원(등록) 폼으로 이동
	@RequestMapping(value ="/admin/write")
	public void write(HttpSession session) { }

	/**
	 * 회원 등록하기 : 프로젝트 내에 폴더 설정해서 파일 저장하면 서버 내릴 경우 파일 다 날라가니까 : 실제 저장 폴더를 하나 만들어서 거기에 저장 
	 * - 중복 파일 이름 제거 : path에 있는 파일 이름 리스트 가져와서 비교 후, 중복되면 이름 재설정해준다(재설정 논리는 다양할 수있다) 
	 * 	: 보통 DB에 있는 사용자가 등록한 originalName과 시스템에서 재설정한 이름 동시 저장 */

	@RequestMapping(value = "/admin/insert")
	public String insert(UserDTO userDTO) throws IOException {
		userService.insert(userDTO);
		return "redirect:list";
	}

	/* 수정 폼으로 이동 */
	@RequestMapping(value = "/admin/updateForm")
	public ModelAndView updateForm(String userId) {
		UserDTO userDTO = userService.selectByUserId(userId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userDTO", userDTO);
		mv.setViewName("admin/update");
		return mv;
	}

	/* 회원 정보 수정하기*/
	@RequestMapping(value = "/admin/update")
	public ModelAndView update(UserDTO userDTO) {
		userService.update(userDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userDTO", userDTO);
		mv.setViewName("redirect:read/" + userDTO.getUserId());
		return mv;
	}

	/* 회원 삭제하기*/
	@RequestMapping(value = "/admin/delete")
	public String delete(String userId) { // read.jsp에서 request로 들어오는 이름(password)과 같아야 함
		userService.delete(userId);
		return "redirect:list";
	}

}

//회원 검색 폼
/*
 * @RequestMapping("findUserByIdForm") public ModelAndView findIdUser(String
 * userId) { ModelAndView mv = new ModelAndView(); UserDTO userDTO =
 * userService.findUserById(userId); mv.addObject("userDTO", userDTO);
 * mv.setViewName("user/findUserResult"); return mv; }
 */

/*
 * //관리자 권한으로 들어가서 회원 명수 파악하기
 * 
 * @RequestMapping("admin/enterCafe") public ModelAndView adminWelcome() {
 * return new ModelAndView("admin/main", "count", userService.getUserCount()); }
 */
