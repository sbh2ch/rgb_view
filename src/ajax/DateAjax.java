package ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/date")
public class DateAjax extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String select = "";
		String menu = "";
		String path = "f:/br_kosc" + req.getParameter("path");
		File dir = new File(path);

		int i = 0;
		menu += "<li data-original-index='" + i++ + "' class='selected'><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'>Select Time</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
		select += "<option>Select Time</option>";

		if (dir.exists()) { // 선택 디렉토리가 존재시
			for (File image : dir.listFiles()) {
				menu += "<li data-original-index='" + i++ + "'><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='false'><span class='text'>" + image.getName() + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
				select += "<option>" + image.getName() + "</option>";
			}
		}
		
		String json = "{\"menu\" : \"" + menu + "\",\"select\" :\"" + select + "\", \"size\" : \"" + i + "\"}";
		out.print(json);
		return;
	}
}
