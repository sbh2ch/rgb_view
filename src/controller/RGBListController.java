package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rgbList.do")
public class RGBListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		File dir = new File("f:/br_kosc");
		File recentMonth = dir.listFiles()[dir.listFiles().length - 2];
		File recentDay = recentMonth.listFiles()[recentMonth.listFiles().length - 1];
		File recentImage = recentDay.listFiles()[recentDay.listFiles().length - 1];
		
		request.setAttribute("recentDate", "/" + recentMonth.getName() + "/" + recentDay.getName() + "/");
		request.setAttribute("recentImage", recentImage.getName());
		request.getRequestDispatcher("/rgb_list.jsp").forward(request, response);
	}
}
