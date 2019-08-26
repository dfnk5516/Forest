package kosta.forrest.model.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.forrest.model.user.dao.AuthoritiesDAO;
import kosta.forrest.model.user.dao.UserDAO;
import kosta.forrest.model.user.dto.AuthorityDTO;
import kosta.forrest.model.user.dto.UserDTO;
import kosta.forrest.util.Constants;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AuthoritiesDAO authoritiesDAO;
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다 */
	@Autowired
	private PasswordEncoder passwordEncoder; 
	
	
	@Override
	public UserDTO findUserById(String id) {	 
		return userDAO.findUserById(id);
	}

	@Override
	public List<String> getAddressList() {		
		return userDAO.getAddressList();
	}

	@Override
	public List<UserDTO> findUserListByAddress(String address) {		
		return userDAO.findUserListByAddress(address);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		return userDAO.login(userDTO);
	}

	@Override
	public int getUserCount() {
		return userDAO.getUserCount();
	}

	@Override
	public void updateUser(UserDTO userDTO) {
		userDAO.updateUser(userDTO);
	}
	
    @Transactional
	@Override
	public void registerUser(UserDTO userDTO) {
    	//비밀번호 암호화
    	//System.out.println("userDTO.getPassword() : " + userDTO.getUserPwd());
        String encodedPassword = passwordEncoder.encode(userDTO.getUserPwd());
        //System.out.println("encodedPassword : " + encodedPassword);
        userDTO.setUserPwd(encodedPassword);
        userDAO.registerUser(userDTO);
		
		//권한등록
		/*AuthorityDTO authority = new AuthorityDTO(userDTO.getuserId(),"ROLE_MEMBER");
		userDAO.registerRole(authority);*/
		authoritiesDAO.insertAuthority(new AuthorityDTO(userDTO.getUserId(), Constants.ROLE_MEMBER));
		if(userDTO.getUserGrade().equals("1")) { //권한 부분을 user_type에서 userGrade로 변경
			authoritiesDAO.insertAuthority(new AuthorityDTO(userDTO.getUserId(), Constants.ROLE_ADMIN));
		}
	}

	@Override
	public String idcheck(String id) {
		String count = userDAO.idcheck(id); 
		return (count == null) ? "ok" : "fail"; 	
	}

	@Override
	public List<AuthorityDTO> selectAuthorityByUsername(String username) {
		return authoritiesDAO.selectAuthorityByUserName(username);
	}
	
	////////////////////////////// 관리자
	@Override
	public List<UserDTO> selectAll() {
		List<UserDTO> userList = userDAO.selectAll();
	if(userList.isEmpty()) throw new RuntimeException("회원 리스트가 존재하지 않습니다.");
	else return userList;
	}

	@Override
	@Transactional  //메소드 위에 선언하면 해당 메소드만 PointCut이 된다. -> 예외가 발생했을 때 알아서 commit/rollback 처리 해준다.
	public UserDTO selectByUserId(String userId) {
		UserDTO userDTO = userDAO.selectByUserId(userId);
		if(userDTO == null) throw new RuntimeException(userId + "에 해당하는 정보가 없습니다.");
		else return userDTO;
	}

	@Override
	public int insert(UserDTO userDTO) {
		int result = userDAO.insert(userDTO);
		if(result == 0) throw new RuntimeException("회원이 등록되지 않았습니다.");
		return result;
	}

	@Override
	public int delete(String userId) {
		int result = userDAO.delete(userId);
		if(result == 0) throw new RuntimeException("오류 발생! 삭제되지 않았습니다.");
		return result;
	}

	@Override
	public int update(UserDTO userDTO) {
		System.out.println("update userId?" + userDTO.getUserId());
		
		 
		int result = userDAO.update(userDTO);
		if(result == 0) throw new RuntimeException("오류 발생! 수정되지 않았습니다.");
		return result;
	}


}
