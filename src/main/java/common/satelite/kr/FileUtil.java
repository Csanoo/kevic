package main.java.common.satelite.kr;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.net.ssl.HandshakeCompletedEvent;
import javax.servlet.http.HttpServletRequest;

import main.java.admin.satelite.kr.AppMain1Svc;
import org.springframework.web.multipart.MultipartFile;


public class FileUtil {


	public List<FileVO> saveAllFilesBB(List<MultipartFile> upfiles)  {

		String filePath = "/data/upload";
		//String filePath = servletRequest.getServletContext().getRealPath("/");
		//String filePath = request.getSession().getServletContext().getRealPath("/upload/");
		List<FileVO> filelist = new ArrayList<FileVO>();

		for (MultipartFile uploadfile : upfiles ) {
			if (uploadfile.getSize() == 0) {
				continue;
			}

			String newName = getNewName()+getFileExtension(uploadfile.getOriginalFilename());
			saveFile2(uploadfile, filePath + "/" , newName);

			FileVO filedo = new FileVO();
			filedo.setFilename(uploadfile.getOriginalFilename());
			filedo.setRealname(newName);
			filedo.setFilesize(uploadfile.getSize());
			filelist.add(filedo);
		}
		return filelist;
	}

	public List<FileVO> saveAllFileslogo(List<MultipartFile> upfiles) {
		String filePath = "/data/upload";
		//String filePath = request.getSession().getServletContext().getRealPath("/upload/");
		List<FileVO> filelist = new ArrayList<FileVO>();

		for (MultipartFile uploadfile : upfiles ) {
			if (uploadfile.getSize() == 0) {
				continue;
			}
			String newName = uploadfile.getOriginalFilename();
			saveFile2(uploadfile, filePath + "/" , newName);

			FileVO filedo = new FileVO();
			filedo.setFilename(uploadfile.getOriginalFilename());
			filedo.setRealname(uploadfile.getOriginalFilename());
			filedo.setFilesize(uploadfile.getSize());
			filelist.add(filedo);
		}
		return filelist;
	}
	public List<FileVO> saveAllFiles(List<MultipartFile> upfiles) {
		String filePath = "/data/upload";
		//String filePath = request.getSession().getServletContext().getRealPath("/upload/");
		List<FileVO> filelist = new ArrayList<FileVO>();

		for (MultipartFile uploadfile : upfiles ) {
			FileVO filedo = new FileVO();
			if (uploadfile.getSize() == 0) {
				filedo.setFilename("");
				filedo.setRealname("");
				filelist.add(filedo);
				continue;
			}

			String newName = uploadfile.getOriginalFilename();
			saveFile2(uploadfile, filePath + "/" , newName);

			filedo.setFilename(uploadfile.getOriginalFilename());
			filedo.setRealname(uploadfile.getOriginalFilename());
			filedo.setFilesize(uploadfile.getSize());
			filelist.add(filedo);
		}
		return filelist;
	}

	public String saveFile2(MultipartFile file, String basePath, String fileName){
		if (file == null || file.getName().equals("") || file.getSize() < 1) {
			return null;
		}

		makeBasePath(basePath);
		String serverFullPath = basePath + fileName;
		System.out.println("saveFileFullPath="+serverFullPath);
		File file1 = new File(serverFullPath);
		try {
			file.transferTo(file1);
		} catch (IllegalStateException ex) {
			System.out.println("IllegalStateException: " + ex.toString());
		} catch (IOException ex) {
			System.out.println("IOException: " + ex.toString());
		}

		return serverFullPath;
	}

	public void makeBasePath(String path) {
		File dir = new File(path); 
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

	public String saveFile(MultipartFile file, String basePath, String fileName){
		if (file == null || file.getName().equals("") || file.getSize() < 1) {
			return null;
		}

		makeBasePath(basePath);
		String serverFullPath = basePath + fileName;

		File file1 = new File(serverFullPath);
		try {
			file.transferTo(file1);
		} catch (IllegalStateException ex) {
			System.out.println("IllegalStateException: " + ex.toString());
		} catch (IOException ex) {
			System.out.println("IOException: " + ex.toString());
		}

		return serverFullPath;
	}

	public String getNewName() {
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		return ft.format(new Date()) + (int) (Math.random() * 10);
	}

	public String getFileExtension(String filename) {
		Integer mid = filename.lastIndexOf(".");
		return filename.substring(mid, filename.length());
	}

	public String getRealPath(String path, String filename) {
		return path + filename.substring(0,4) + "/";
	}
}
