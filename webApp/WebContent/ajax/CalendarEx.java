package day09;
import java.util.Calendar;

public class CalendarEx {
	public static void main(String[] args) {
		
		Calendar now = Calendar.getInstance();
		
		int year = now.get(Calendar.YEAR); // 연도
		int month = now.get(Calendar.MONTH) + 1; // 월
		int day = now.get(Calendar.DAY_OF_MONTH); // 일
		now.set(Calendar.DAY_OF_MONTH, 1);
		int week = now.get(Calendar.DAY_OF_WEEK);
		
		String weekStr = null;
		System.out.println("년도 : " + year + " \n" + "월 : " + month);
		System.out.println();
		System.out.println("\t\t" + year + "년 " + month + "월");
		System.out.println("일\t월\t화\t수\t목\t금\t토");
				
		// 해당 월의 일수 중 가장 최고값(마지막일)
		int lastDay = now.getActualMaximum(Calendar.DAY_OF_MONTH);
	
		int date[] = new int[lastDay + week-1];
		now.set(Calendar.DAY_OF_MONTH, 1);
		for (int i = 0; i < date.length; i++) {
			date[i] = i + 1;
			if (i < week-1) {
				System.out.print("\t");
			}else {
				System.out.print(date[i + 1 - week] + "\t");
			}
			if ( (i + 1) % 7 == 0) {
				System.out.println();
			}
		}
	}
}
