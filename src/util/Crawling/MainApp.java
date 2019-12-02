package util.Crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MainApp {
	
	private static String URL = "http://www.donga.com/news/List/Economy/RE?";
	
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException{

//		System.out.println("URL : : " + URL + getParameter(2));
		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + getParameter(2)).get();
		
		// 2. 목록을 가져온다
//		System.out.println(doc);
//		System.out.println(""+ doc.toString());
		Elements elements = doc.select(".articleList div a");

		// 3. 목록(배열)에서 정보를 가져온다.
		int idx = 0;
		
		List list = new ArrayList();
		for(Element element : elements) {
			
			System.out.println(++idx + " : " + element.toString());
//			System.out.println(++idx + " : " + element.text());
			System.out.println("======================================");
			list.add(element.toString());
		}
		
//		System.out.println("list: " + list);
		
	}
	
	
	
	/**
	 * URL 완성
	 * @param PAGE
	 * 
	 * @reutrn
	 */
	public static String getParameter(int PAGE) {
		return "p="+ PAGE + "&prod=news&ymd=&m=";
		
	}
}
