package friend;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class test {

	public static void main(String[] args) {
		System.out.println(LocalDateTime.now());
		System.out.println(LocalDateTime.now().format(
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

	}

}
