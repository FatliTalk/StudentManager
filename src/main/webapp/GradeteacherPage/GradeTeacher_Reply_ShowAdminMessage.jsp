<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%
			//登录验证
			Object admin_message = session.getAttribute("gradeteacher_message"); 
			if(admin_message==null){
				response.sendRedirect("404.html"); 
			} 
 	%>
 	
 	
 	
<title>信工学生管理系统—辅导员</title>
	<link rel="stylesheet" href="editor/themes/default/default.css" />
	<link rel="stylesheet" href="editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="editor/kindeditor.js"></script>
	<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="editor/plugins/code/prettify.js"></script>
	<link href="../css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/ks.css" rel="stylesheet" type="text/css" />
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css"  rel="stylesheet" type="text/css" />
	
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../editor/plugins/code/prettify.css',
				uploadJson : '../editor/jsp/upload_json.jsp',
				fileManagerJson : '../editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>

<div class="banner">
        <div class="bgh">
            <div class="page">
            <div id="logo">
            	<a>
                	<img src="images/logo.png" alt="" width="300" height="67" />
                </a>
            </div>
                <div class="topxx">
                           辅导员：${admin_message.adminName }欢迎您！
                     <a href="GradeTeacherquitSession">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                    	<li><a href="CollegePageBeanAdmin">所有学院</a></li>
                        <li><a href="ProfessionPageAdmin">所有专业</a></li>
                        <li><a href="ClassmessagePageAdmin">所有班级</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="box mtop">
              <div class="leftbox">
                <div class="l_nav2">
                <div class="ta1">
					 <strong>信息中心</strong>
					 <div class="leftbgbt2">
					 </div>
				</div>
				<div class="cdlist">
				 <div>
				   <a href="showPageSysteminformationGradeTeacher">系统公告</a>
				 </div>
				 <div>
				    <form action="showNoReply" method="post" name="from2" id="from2">
						<input type="hidden" name="gradeteacherId" value="${gradeteacher_message.gradeteacherId }"/>
						<a href="javascript:document:from2.submit();">学生咨询信息</a>
					</form>
				 </div>
				</div>
                    <div class="ta1">
                        <strong>个人中心</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                           <form action="ShowGradeTeacher" method="post" name="from1" id="from1">
							<input type="hidden" name="gradeteacherId" value="${gradeteacher_message.gradeteacherId }"/>
								<a href="javascript:document:from1.submit();">辅导员信息</a>
							</form>
                        </div>
                        
                        
                    </div>  
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="StudentPageGradeTeacher">学生信息 </a>
                        </div>
                        <div>
                            <a href="AddSutdentGradeTeacherPage">添加学生 </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
    <h2 class="mbx">
        学生咨询信息 &gt; 查询学生咨询信息&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<label style="color: red;">本地上传图片和图片空间功能暂不开放</label></h2>
    <div class="morebt">
        <ul>
           	<li><a class="tab2" href="showPageSysteminformationAdmin">咨询信息</a> </li>
           	
        </ul>
    </div>
    <div class="cztable">
    	 <table width="100%" cellpadding="0" cellspacing="0">
	        <tr>
	            <td width="15%" align="right"><div align="right">咨询标题： </div></td>
	            <td style="text-align: center;font-size: 19px">${teachermessage_message.teacherMessageTitle }</td>
	        </tr>
	        <tr>
	            <td width="15%" align="right"><div align="right">发布日期： </div></td>
	            <td style="font-size: 19px">${teachermessage_message.teacherMessageDate }</td>
	        </tr>
	      
	        
	        <tr>
	            <td width="15%" align="right"><div align="right">咨询内容： </div></td>
	            <td>
	            	${teachermessage_message.teacherMessage}
	            </td>
	        </tr>
	        <tr>
	            <td width="15%" align="right"><div align="right">处理状态： </div></td>
	            <td>
	            	<c:if test="${teachermessage_message.state==1 }"><label style="color: red;">未处理</label></c:if>
	            	<c:if test="${teachermessage_message.state==2 }"><label style="color: red;">已处理</label></c:if>
	            </td>
	        </tr>
	    </table>
	    <br/>
    </div>
    <div class="morebt">
        <ul>
           	<li><a class="tab2" href="showPageSysteminformationAdmin">回复咨询信息</a> </li>
        </ul>
    </div>
    <div class="cztable">
	    <form name="AddReplyMessage" method="post" action="AddReplyMessage">
	    <input type="hidden" name="teacherMessageId" value="${teachermessage_message.teacherMessageId }"/>
	    <input type="hidden" name="studentId" value="${teachermessage_message.student.studentId }"/>
	     <input type="hidden" name="gradeteacherId" value="${gradeteacher_message.gradeteacherId }"/>
		 <table width="100%" cellpadding="0" cellspacing="0">
	        <tr>
	            <td width="15%" align="right"><div align="right">回复标题： </div></td>
	            <td><input id="replyTitle" size="20" name="replyTitle" class="input_2"/></td>
	        </tr>
	      
	        
	        <tr>
	            <td width="15%" align="right"><div align="right">回复内容： </div></td>
	            <td>
	            	<textarea name="content1" id="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <div align="center" >
	                    <input type="submit" value="提交" class="input2" />
	                </div>
	            </td>
	        </tr>
	    </table>
    </form>
    </div>

            </div>
        </div>
        
       
        
        <div class="footer">
            <p>
            	学生管理系统
            </p>
        </div>
    </div>
</body>
</html>