package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/orImg" })
public class OriginalImageController extends HttpServlet {
	public OriginalImageController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, java.io.IOException {
		String filePath = req.getParameter("path");
		String realName = req.getParameter("realName");
		File oriPic = new File("f:/br_kosc" + filePath + realName);
		resp.setHeader("Content-Type", "image/jpeg");

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(oriPic));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());

		byte[] buffer = new byte[1024];
		int ch;
		while ((ch = bis.read(buffer, 0, 1024)) != -1) {
			bos.write(buffer, 0, ch);
		}

		bis.close();
		bos.close();
	}
}
