package com.market.yeonsung.dao;

// 데이터 전송 객체 클래스
public class UserDto {
	
	// 필드 선언
    private String id;
    private String passwd;
    private String name;
    private String email;

    // Getter와 Setter

    // id 필드에 대한 setter 메서드
    public void setId(String id) {
        this.id = id;
    }

    // id 필드에 대한 getter 메서드
    public String getId() {
        return id;
    }

    // passwd 필드에 대한 setter 메서드
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    // passwd 필드에 대한 getter 메서드
    public String getPasswd() {
        return passwd;
    }

    // name 필드에 대한 setter 메서드
    public void setName(String name) {
        this.name = name;
    }

    // name 필드에 대한 getter 메서드
    public String getName() {
        return name;
    }

    // email 필드에 대한 setter 메서드
    public void setEmail(String email) {
        this.email = email;
    }

    // email 필드에 대한 getter 메서드
    public String getEmail() {
        return email;
    }
}