package util.Crawling.dao.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import util.Crawling.dao.face.NewsCrawlingDao;
	
public class NewsClawlingDaoImpl implements NewsCrawlingDao{
	private static String URL = "https://estate.nate.com/cp/news/research_list.asp?";

	
	
	@Override
	public String getParameter(int PAGE) {
		return "p="+ PAGE + "&prod=news&ymd=&m=";
	}

}
