package main.java.common.satelite.kr;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller 
public class EditorCtr {
	 String ROOT_DIR = "E:/tom99/frontsite/ROOT/image";
	 @RequestMapping(value = "/summernoteImageUpload", method = RequestMethod.POST)
	 public void sumernoteImageUpload(@RequestParam HashMap<String, String> params, HttpServletRequest request, HttpServletResponse response, @RequestParam("uploadFile") MultipartFile file) throws Exception {
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset-UTF-8");
	        try {
	            
	        	 boolean isImage = true;
	             String msg = "";
	             if ( file.getContentType().equals("image/pjpeg") ||  file.getContentType().equals("image/jpeg")) {
	             } else if ( file.getContentType().equals("image/png") ||  file.getContentType().equals("image/x-png")) {
	             } else if ( file.getContentType().equals("image/gif")) {
	             } else if ( file.getContentType().equals("image/bmp")) {
	             } else if ( file.getContentType().equals("application/x-shockwave-flash")) { //swf
	             } else {
	                 isImage = false;
	                 msg = "이미지 파일을 jpg/.gif/.bmp/.png만 선택해주세요.";
	             }
	             PrintWriter printWriter = null;
	             printWriter = response.getWriter();
	             String fileUrl ="";
	             boolean filesizeOver = false;
	             if(isImage) {
                     String path = params.get("path").toString();
                     HashMap<String, String> imageFileMap = saveFile(file, "/editor");
                     fileUrl = "/mdvs/common/files/view?path=/editor&fileRename=" + imageFileMap.get("saveFileName"); //url 경로
	             }
	             if(filesizeOver){
	                 printWriter.println("파일크기초과");
	             }else {
	                 if(!"".equals(msg)){
	                     printWriter.println("이미지선택");
	                 }else{
	                     printWriter.println(fileUrl);
	                 }
	             }
	             printWriter.flush();
	        	
	        	
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	 }
	 
	 
	 @RequestMapping("/common/files/view")
	    public void fileImgView(@RequestParam HashMap<String, Object> params, HttpServletResponse response, HttpServletRequest request) throws IOException {
	        try {
	        	if(params.get("path") == null) {
	        		params.put("path", "");
	        	}
	        	if(params.get("fileRename") == null) {
	        		params.put("fileRename", "");
	        	}
	            String path = params.get("path").toString();
	            String fileRename = params.get("fileRename").toString();
	            path = URLDecoder.decode(path, "UTF-8");
	            fileRename = URLDecoder.decode(fileRename, "UTF-8");
	            if (fileRename.toUpperCase().endsWith("JPG") || fileRename.toUpperCase().endsWith("PNG") || fileRename.toUpperCase().endsWith("GIF")) {
	                String dirFileUrl = ROOT_DIR + path + File.separator + fileRename;
	                response.setHeader("Pragma", "No-cache");
	                response.setHeader("Cache-Control", "no-cache");
	                response.setDateHeader("Expires", 0L);
	                OutputStream os = response.getOutputStream();
	                byte[] btImg = getBytes(dirFileUrl);
	                os.write(btImg);
	                os.flush();
	            }
	        } catch (IOException e) {
	            //e.printStackTrace();
	        }
	    }
	 
	 
	 public static byte[] getBytes(String filePath) {
	        byte[] buffer = null;
	        try {
	            File file = new File(filePath);
	            FileInputStream fis = new FileInputStream(file);
	            ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
	            byte[] b = new byte[1000];
	            int n;
	            while ((n = fis.read(b)) != -1) {
	                bos.write(b, 0, n);
	            }
	            fis.close();
	            bos.close();
	            buffer = bos.toByteArray();
	        } catch (FileNotFoundException e) {
	        } catch (IOException e) {
	        }
	        return buffer;
	    }
	 
	 public HashMap<String,String> saveFile(MultipartFile file, String subPath){
//       subPath = subPath.replaceAll("//",File.separator);
       String contentType = file.getContentType();
       String originalFilename = file.getOriginalFilename();
       long fileSize = file.getSize();
       String saveFileName = createFileName(file.getOriginalFilename());
       File f = new File(ROOT_DIR+subPath);
       if (!f.exists()) {
           f.mkdirs();
       }
       String fullName = ROOT_DIR + subPath + File.separator + saveFileName;
       try (
               InputStream in = file.getInputStream();
               FileOutputStream fos = new FileOutputStream(fullName)) {
           int readCount = 0;
           byte[] buffer = new byte[512];
           while ((readCount = in.read(buffer)) != -1) {
               fos.write(buffer, 0, readCount);
           }
       } catch (Exception ex) {
           ex.printStackTrace();
       }

       HashMap<String,String> rtn = new HashMap<String,String>();
       rtn.put("contentType",contentType);
       rtn.put("originalFilename",originalFilename);
       rtn.put("fileSize",fileSize+"");
       rtn.put("saveFileName",saveFileName);
       return rtn;
   }
	 
	 
	 private static String createFileName(String fileOrgiName) {
	        String fileExtNm = fileOrgiName.substring(fileOrgiName.lastIndexOf(".") + 1, fileOrgiName.length());
	        return getNow("yyyy_MM_dd") + UUID.randomUUID().toString().replaceAll("-", "")+"."+fileExtNm;
	    }
	 
	 
	 public static String getNow(String pattern) {
	        Date currentTime = new Date();
	        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
	        return formatter.format(currentTime);
	    }

	 
	 

}
