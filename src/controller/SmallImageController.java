package controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bhson.image.resize.ResizeImageOutput;

import image.dao.ImageFileDAO;
import image.vo.ImageFileVO;

@WebServlet({ "/smImg" })
public class SmallImageController extends HttpServlet {
	private static final int IMG_WIDTH = 1024;
	private static final int IMG_HEIGHT = 1024;

	public SmallImageController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ImageFileDAO ifDAO = new ImageFileDAO();
		String filePath = req.getParameter("path");
		String realName = req.getParameter("realName");
		String contextPath = req.getServletContext().getRealPath("/upload");

		File dir = new File(contextPath + filePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		File oriPic = new File("f:/br_kosc" + filePath + realName);
		File smallPic = new File(contextPath + filePath + realName);

		ImageFileVO smPic = new ImageFileVO(realName, filePath);
		ImageFileVO isExist = ifDAO.selectImage(smPic);

		if (isExist == null) {
			BufferedImage originalImage = ImageIO.read(oriPic);
			int type = originalImage.getType() == 0 ? 2 : originalImage.getType();

			BufferedImage resizeImageJpg = new ResizeImageOutput().resizeImage(originalImage, type, IMG_WIDTH, IMG_HEIGHT);
			ImageIO.write(resizeImageJpg, "jpg", smallPic);

			ifDAO.insertImage(smPic);
		}

		resp.setHeader("Content-Type", "image/jpeg");

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(smallPic));
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
