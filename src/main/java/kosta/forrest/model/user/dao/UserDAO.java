package kosta.forrest.model.user.dao;

import java.util.List;

import kosta.forrest.model.user.dto.UserDTO;

public interface UserDAO {

	List<String> getAddressList();

	List<UserDTO> findUserListByAddress(String address);

	UserDTO login(UserDTO userDTO);

	int getUserCount();

	void updateUser(UserDTO userDTO);

	void registerUser(UserDTO userDTO);

	String idcheck(String id);

	UserDTO findUserById(String id);

	UserDTO loginConfirm(String id, Object pwd);
	
	/* 레코드 전체 검색 */
	List<UserDTO> selectAll();

	/* 회원아이디 해당하는 레코드 검색 */
	UserDTO selectByUserId(String userId);

	/* 레코드 삽입 */
	int insert(UserDTO userDTO);

	/* 회원아이디에 해당하는 레코드 삭제 */
	int delete(String userId);

	/* 회원아이디 해당하는 레코드 수정 */
	int update(UserDTO userDTO);

}
