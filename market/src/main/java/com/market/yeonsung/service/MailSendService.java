package com.market.yeonsung.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.market.yeonsung.dao.EmailRequestDto;

import javax.mail.MessagingException; // javax.mail로 변경
import javax.mail.internet.MimeMessage; // javax.mail로 변경

@Service
public class MailSendService {
    
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private RedisUtil redisUtil;  // RedisUtil 인스턴스를 주입

    private int authNumber;

    private static final String FROM_EMAIL = "dlaeogh3042@gmail.com"; // 발신자 이메일 주소
    private static final String EMAIL_SUBJECT = "회원 가입 인증 이메일 입니다."; // 이메일 제목

    public boolean checkAuthNum(String email, String authNum) {
        if (email == null || authNum == null) {
            throw new IllegalArgumentException("Email and authNum cannot be null");
        }

        String storedEmail = redisUtil.getData(authNum);
        return storedEmail != null && storedEmail.equals(email);
    }

    // 인증 이메일을 전송합니다.
    public String joinEmail(String email) { // 메서드 이름 변경
    		
    	System.out.println("받은 메일 정보" + email);
        makeRandomNumber(email); // email 매개변수를 전달하여 인증 번호 생성
        String toMail = email;
        String content = 
                "연근마켓에 방문해주셔서 감사합니다." +  
                "<br><br>" +
                "인증 번호는 " + authNumber + "입니다." +
                "<br>" +
                "인증번호를 제대로 입력해주세요"; 
        mailSend(FROM_EMAIL, toMail, EMAIL_SUBJECT, content);
        return Integer.toString(authNumber);
    }

    // 임의의 6자리 양수를 반환합니다.
    public void makeRandomNumber(String email) { // email을 매개변수로 받도록 수정
        Random r = new Random();
        String randomNumber = "";
        for (int i = 0; i < 6; i++) {
            randomNumber += Integer.toString(r.nextInt(10));
        }
        
        System.out.println(randomNumber);

        authNumber = Integer.parseInt(randomNumber);
                
        // 여기서 email을 매개변수로 사용
        redisUtil.setData(Integer.toString(authNumber), email, 3 * 60); // Redis에 이메일과 인증번호 저장 (5분)
        
    }


    // 이메일을 전송합니다.
    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true); // HTML로 설정
            mailSender.send(message);
        } catch (MessagingException e) {
            // 개선된 예외 처리
            throw new RuntimeException("이메일 전송 중 오류가 발생했습니다.", e);
        }
    }
}
