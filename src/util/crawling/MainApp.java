package util.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MainApp {
	
	private static String URL = "https://estate.nate.com/cp/news/research_list.asp?";
	
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException{

//		System.out.println("URL : : " + URL + getParameter(2));
		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + getParameter(2)).get();
		
		// 2. 목록을 가져온다
		System.out.println(doc);
//		System.out.println(""+ doc.toString());
		Elements elements = doc.select(".news_list dt");

		// 3. 목록(배열)에서 정보를 가져온다.
		int idx = 0;
		
		List list = new ArrayList();
		for(Element element : elements) {
			
//			System.out.println(++idx + " : " + element.toString());
////			System.out.println(++idx + " : " + element.text());
//			System.out.println("======================================");
			list.add(element.toString());
		}
		
		System.out.println("list: " + list);
		
	}
	
	
	
	/**
	 * URL 완성
	 * @param PAGE
	 * 
	 * @reutrn
	 */
	public static String getParameter(int PAGE) {
		return "only=345&m_=6&g_=9&newstype=11&bno=200&nkind=7&trend=&SF_Kind=&SF_Keyword=&page="
				+ PAGE;
		
	}
}
