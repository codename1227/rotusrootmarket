
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class TestConnection {

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(DatabaseConfig.class);
        JdbcTemplate jdbcTemplate = context.getBean(JdbcTemplate.class);

        try {
            // Fetch university names from the Universities table
            String universitySql = "SELECT university_name FROM Universities";
            List<String> universities = jdbcTemplate.queryForList(universitySql, String.class);

            System.out.println("\n대학 목록:");
            for (String university : universities) {
                System.out.println(university);
            }

            // Fetch all items from the Items table
            String itemsSql = "SELECT * FROM Items";
            List<Map<String, Object>> items = jdbcTemplate.queryForList(itemsSql);

            System.out.println("\nItems 목록:");
            for (Map<String, Object> item : items) {
                System.out.println(item);
            }
        } catch (Exception e) {
            System.out.println("오류: " + e.getMessage());
        }
    }
    
}// 잘 나오는지 테스트