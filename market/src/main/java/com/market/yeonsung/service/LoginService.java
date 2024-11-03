package com.market.yeonsung.service;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.yeonsung.dao.UserDto;
import com.market.yeonsung.dao.UserDao;

@Repository
public class LoginService {
	
    // UserDao 객체를 주입받기 위한 필드
    private final UserDao userDao;

    // 생성자를 통해 UserDao 주입
    @Autowired
    public LoginService(UserDao userDao) {
        this.userDao = userDao;
    }

    // 사용자 등록 메서드
    public void insert(UserDto user) {
        userDao.insert(user); 
    }
    
    // 로그인 메서드
    public Optional<UserDto> login(String id, String passwd) {
        return userDao.login(id, passwd); 
    }

    // ID 존재 여부 확인 메서드
    public boolean checkUserExists(String id) {
        return userDao.existsById(id); 
    }

    // 비밀번호 확인 메서드
    public boolean isPasswordCorrect(String id, String passwd) {
        return userDao.isPasswordCorrect(id, passwd); 
    }
}
