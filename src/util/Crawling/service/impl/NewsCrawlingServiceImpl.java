package util.Crawling.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import util.Crawling.service.face.NewsCrawlingService;
import util.Crawling.dao.face.NewsCrawlingDao;
import util.Crawling.dao.impl.NewsClawlingDaoImpl;
import util.Crawling.dto.News;

public class NewsCrawlingServiceImpl implements NewsCrawlingService{
//	private static String URL = "https://estate.nate.com/cp/news/research_list.asp?";
	private static String URL = "http://www.donga.com/news/List/Economy/RE?";
	
	private NewsCrawlingDao newsDao = new NewsClawlingDaoImpl();
	@Override
	public List getCrawlingList() throws IOException {
		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + newsDao.getParameter(21)).get();

		// 2. 목록을 가져온다
		//		System.out.println(""+ doc.toString());
		Elements elements = doc.select(".articleList "); 

		int idx = 0;

		List list = new ArrayList();
		for(Element e : elements) {
			News news = new News();
			System.out.println(++idx + " : " + e.toString());
//			System.out.println(++idx + " : " + element.text());
			System.out.println("======================================");
			news.setAtag(e.toString());
//			System.out.println("daotest : " + news);
			list.add(news);
		}

		return list;

	}

	

	
}
