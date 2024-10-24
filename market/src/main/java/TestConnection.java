import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class TestConnection {

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(DatabaseConfig.class);
        JdbcTemplate jdbcTemplate = context.getBean(JdbcTemplate.class);

        try {
            String sql = "SELECT university_name FROM Universities";
            List<String> universities = jdbcTemplate.queryForList(sql, String.class);

            System.out.println("대학 목록:");
            for (String university : universities) {
                System.out.println(university);
            }
        } catch (Exception e) {
            System.out.println("오류: " + e.getMessage());
        }
    }
}// 잘 연동되었는지 확인용도