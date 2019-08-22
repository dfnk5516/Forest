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
	
	

}
