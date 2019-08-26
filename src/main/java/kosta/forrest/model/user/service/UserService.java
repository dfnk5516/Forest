package kosta.forrest.model.user.service;

import java.util.List;

import kosta.forrest.model.user.dto.AuthorityDTO;
import kosta.forrest.model.user.dto.UserDTO;

public interface UserService {
	
	UserDTO findUserById(String id);

	List<String> getAddressList();

	List<UserDTO> findUserListByAddress(String address);

	UserDTO login(UserDTO userDTO);

	int getUserCount();

	void updateUser(UserDTO userDTO);

	void registerUser(UserDTO userDTO);

	String idcheck(String id);
	
	List<AuthorityDTO> selectAuthorityByUsername(String username);

	/* 레코드 전체 검색 */
	List<UserDTO> selectAll();

	UserDTO selectByUserId(String userId);

	/* 레코드 삽입 */
	int insert(UserDTO userDTO);

	/* 사용자 아이디에 해당하는 레코드 삭제 */
	int delete(String userId);

	/* 모델번호에 해당하는 레코드 수정 */
	int update(UserDTO userDTO);
}
