package com.market.yeonsung.dao;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailRequestDto {

    @Email(message = "올바른 이메일 주소를 입력해 주세요")
    @NotEmpty(message = "이메일을 입력해 주세요")
    private String email;

    private String authNum; // 인증번호 필드 추가
    
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    // Getter and Setter for authNum
    public String getAuthNum() {
        return authNum;
    }

    public void setAuthNum(String authNum) {
        this.authNum = authNum;
    }
}
