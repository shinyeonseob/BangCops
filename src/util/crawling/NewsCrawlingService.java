package util.crawling;

import java.io.IOException;
import java.util.List;

public interface NewsCrawlingService {

	public List getCrawlingList() throws IOException;
	
	public String getParameter(int PAGE);
}
