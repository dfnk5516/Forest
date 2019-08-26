package kosta.forrest.model.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired	
	private SqlSession session;
	
	@Override
	public UserDTO findUserById(String id) {
		return session.selectOne("userMapper.findUserById", id);
	}
	@Override
	public List<String> getAddressList() {
		return session.selectList("userMapper.getAddressList");
	}
	@Override
	public List<UserDTO> findUserListByAddress(String address) {
		return session.selectList("userMapper.findUserListByAddress", address);
	}
	@Override
	public UserDTO login(UserDTO userDTO) { 
		return session.selectOne("userMapper.login", userDTO);
	}
	@Override
	public int getUserCount(){
		return session.selectOne("userMapper.getUserCount");
	}
	@Override
	public void updateUser(UserDTO userDTO) {
		session.update("userMapper.updateUser", userDTO);			
	}	
	@Override
	public void registerUser(UserDTO userDTO) {
		session.insert("userMapper.registerUser", userDTO);			
	}
	@Override
	public String idcheck(String id) {
		return session.selectOne("userMapper.idcheck", id);				
	}
	@Override
	public UserDTO loginConfirm(String id, Object pwd) {
		return null;
	}

	//////////////////////////°ü¸®ÀÚ/////////////////////////////
	@Override
	public List<UserDTO> selectAll() {
		List<UserDTO> userList = session.selectList("adminMapper.selectAll");
		return userList;
	}

	@Override
	public UserDTO selectByUserId(String userId) { //UserDTO
		return session.selectOne("adminMapper.selectByUserId", userId);
	}

	@Override
	public int insert(UserDTO userDTO) {
		return session.insert("adminMapper.insert", userDTO);
	}

	@Override
	public int delete(String userId) {
		int result = session.delete("adminMapper.delete", userId);
		return result;
	}

	@Override
	public int update(UserDTO userDTO) {
		return session.update("adminMapper.update", userDTO);
	}

}
