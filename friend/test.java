package friend;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class test {

	public static void main(String[] args) {
		System.out.println(LocalDateTime.now());
		System.out.println(LocalDateTime.now().format(
				DateTimeFormatter.ofPattern("MM.dd HH:mm:ss")));
		System.out.println(LocalDate.now());
		System.out.println("2022-12-28 00:00:00".substring(0,9));
		System.out.println(LocalDate.now().getYear());
	}

}
