package web.controller.mainmenu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import web.dto.BAccuse;
import web.service.face.AccuseService;
import web.service.impl.AccuseServiceImpl;



@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AccuseService accuseService = new AccuseServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = null;
		
		int dailyCnt = accuseService.getDailyAccuse(); // 오늘의 신고건수
//		System.out.println("[TEST] : " + dailyCnt);
		int totalCnt = accuseService.getTotalAccuse(); // 전체 신고건수
//		System.out.println("[TEST] : " + totalCnt);
		List<BAccuse> list = accuseService.getTopFive(); // '구'별 신고건수 TOP 5
//		System.out.println("[TEST] : " + list); // [주의] 출력시 cnt는 toString 메소드에 만들지 않아서 안나옴 
		
		Gson gson = new Gson();
		
//		차트에 데이터 넣기 (2차월 배열 사용)
		ArrayList arr = new ArrayList();
		
		ArrayList tmp = new ArrayList();
		tmp.add("Task"); //1번째 1행
		tmp.add("Hours per Day"); //1번째 2행
		arr.add(tmp); //1차원 -> 2차원 배열로 변경
		
		for(BAccuse b : list) { //배열(arr) 안 빈공간에 list안에 있는 데이터 채우기
			ArrayList a = new ArrayList();
			
			a.add(b.getGu());
			a.add(b.getCnt());
			
			arr.add(a);
		}
//		System.out.println(gson.toJson(arr));
		
		
		
		req.setAttribute("dailyCnt", dailyCnt); //오늘의 신고건수
		req.setAttribute("totalCnt", totalCnt); //전체 신고건수
		req.setAttribute("list", gson.toJson(arr)); //'구'별 신고건수 TOP 5 Json으로 보내기

		// VIEW
		req.getRequestDispatcher("/WEB-INF/views/home/main.jsp")
		.forward(req, resp);
           // test 
	}
}
