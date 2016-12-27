package org.heyimtaeyang.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.heyimtaeyang.biz.ClassmessageBiz;
import org.heyimtaeyang.biz.impl.ClassmessageBizImpl;

@SuppressWarnings("serial")
public class CheckClassmessageName extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckClassmessageName() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType( "text/xml;charset=UTF-8" );   //设置响应格式为test/xml防止乱码
		//String College_Name = request.getParameter("collegeName");
		String Classmessage_Name = 
				new String (request.getParameter("classmessageName").getBytes("ISO-8859-1"),"UTF-8");
		
		String id = request.getParameter("gradeId");   //获取年级id
		int grade_id = Integer.parseInt(id);           //String转换为int
		
		PrintWriter out = response.getWriter();
		out.println( "<?xml version=\"1.0\" encoding=\"utf-8\"?>" );
		out.println( "<classmessageName>" );
		
		Classmessage_Name = java.net.URLDecoder.decode(Classmessage_Name,"UTF-8");	//根据UTF-8将字符串解码
		ClassmessageBiz classmessageBiz = new ClassmessageBizImpl();
		boolean rs = classmessageBiz.findClassmessageName(grade_id, Classmessage_Name);
		
		if(!rs) {
			out.println("<noIterance id=\"ok\"/>");
		}else{
			out.println("<iterance>"+Classmessage_Name+"</iterance>");
		}
		out.println( "</classmessageName>" );
		out.close();
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
