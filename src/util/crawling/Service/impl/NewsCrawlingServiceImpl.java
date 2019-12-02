package util.crawling.Service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import util.crawling.Service.face.NewsCrawlingService;

public class NewsCrawlingServiceImpl implements NewsCrawlingService{
	private static String URL = "https://estate.nate.com/cp/news/research_list.asp?";

	public List getCrawlingList() throws IOException{

		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + getParameter(1)).get();

		// 2. 목록을 가져온다
		//		System.out.println(""+ doc.toString());
		Elements elements = doc.select(".news_list dt");

		// 3. 목록(배열)에서 정보를 가져온다.
		int idx = 0;

		List list = new ArrayList();
		for(Element element : elements) {

			System.out.println(++idx + " : " + element.text());
			//					System.out.println(++idx + " : " + element.text());
			System.out.println("======================================");
			list.add(element.toString());
		}
		return list;

	}

	@Override
	public String getParameter(int PAGE) {
		return "only=345&m_=6&g_=9&newstype=11&bno=200&nkind=7&trend=&SF_Kind=&SF_Keyword=&page="
				+ PAGE;
	}
}
