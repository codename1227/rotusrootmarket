package com.market.yeonsung.serviceImpl;

import java.util.Map;

import org.springframework.stereotype.Service;
import com.market.yeonsung.dao.MemberDAO;
import com.market.yeonsung.service.LoginService; 

@Service("LoginService")
public class LoginServiceImpl extends MemberDAO implements LoginService {

	@Override
	public int loginService(Map<String, Object> params) throws Exception {
		return 1;
	}
} 
 