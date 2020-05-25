package jspFinal;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName = request.getParameter("file");
		String directory = this.getServletContext().getRealPath("/upload/");
		File file = new File(directory +"/" + fileName);
		String mimeType = getServletContext().getMimeType(file.toString());
		String downloadName = null;
		
		
		if(mimeType == null)
		{
			response.setContentType("application/octet-stream");
		}
		
		if(request.getHeader("user-agent").indexOf("MSIE")==-1)
		{
			downloadName = new String(fileName.getBytes("UTF-8"),"8859_1");
		}
		else
		{
			downloadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\"" + 
						downloadName + "\";");
		
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] b = new byte[1024];
		int data = 0;
		
		while((data = (fis.read(b,0,b.length))) != -1 )
		{
			sos.write(b,0,1024);
				
		}
		sos.flush();
		sos.close();
		fis.close();
		
	}

	

}
