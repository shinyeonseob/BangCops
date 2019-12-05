package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/qna")
public class AdminQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {

			// view
			req.getRequestDispatcher("/WEB-INF/views/admin/adminqna.jsp").forward(req, resp);

		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}
	}

}