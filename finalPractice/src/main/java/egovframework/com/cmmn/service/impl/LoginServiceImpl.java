package egovframework.com.cmmn.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.service.LoginService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("LoginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService{
	
	@Resource(name="LoginDAO")
	private LoginDAO loginDAO;

	@Override
	public int selectIdChk(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.selectIdChk(paramMap);
	}

	@Override
	public int insertMember(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.insertMember(paramMap);
	}

	@Override
	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.selectLoginInfo(paramMap);
	}

	@Override
	public int updateMember(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.updateMember(paramMap);
	}

	@Override
	public HashMap<String, Object> selectMemberInfo(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.selectMemberInfo(paramMap);
	}

	@Override
	public int deleteMemberInfo(int memberIdx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> selectFindId(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.selectFindId(paramMap);
	}

	@Override
	public int selectMemberCertification(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.selectMemberCertification(paramMap);
	}

	@Override
	public int updatePwd(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return loginDAO.updatePwd(paramMap);
	}

}
