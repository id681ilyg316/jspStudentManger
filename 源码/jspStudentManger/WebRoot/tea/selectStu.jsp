<%@ page language="java" import="java.util.*,com.ten.user.*,com.ten.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
	<title>学生信息管理系统-学生信息</title>
	<link href="style_1.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  	@SuppressWarnings("unused")
	Teacher tea = null;
	if(session.getAttribute("teacher")==null){
			response.sendRedirect("../Login.jsp");
	}else{
			tea = (Teacher) session.getAttribute("teacher");
	}
   %>
<div class="top">
	<div class="title"><p> 学生信息管理系统</p></div>
</div>
<div class="main">
	<div class="main_left">
		
			
			<div class="main_left_class02"><a href="/tea/selectStu.jsp">学生信息</a></div>
			<div class="main_left_class03"><a href="/tea/Query.jsp">信息查询</a></div>
			<div class="main_left_class100">
		<input class="reset" type="button" value="注销" onClick="window.location.href=('/jspStudentManager/servlet/serDoLogout')">
		</div>
	</div>
					<%
	  	if(request.getParameter("sumary")!=null&&request.getParameter("maxscore")!=null){
			Student.summary = Float.parseFloat(request.getParameter("sumary"));
			Student.MAXscore = Float.parseFloat(request.getParameter("maxscore"));
		}
		DaoStu select = new DaoStu();
			List<Student> list = select.selectStu();
			Iterator<Student> ite1 = list.iterator();
	   %>
	<div class="main_right">
		<div class="info">
			<p>亲爱的<%= tea.getTname() %>老师，下午好</p>
		</div>
		<div class="box">
			<div class="function"><p>[通知]信息系统已开放</p></div>
			<div class="form">
				<table>
  					<tr><td></td></tr>
  					<tr>
  						<td>学生编号</td><td>学生名称</td><td>所在班级</td><td>学生性别</td>
  						<td><input class="btn" type="button" value="添加学生" onclick="window.location.href=('/jspStudentManager/tea/InsertStu.jsp')"/></td>
  						
  					</tr>
			  		<%
			   			while(ite1.hasNext()){
						Student stu = ite1.next();
			   		%>
  					<tr>
  					<td><%= stu.getSNo() %></td>
  					<td><%= stu.getSname() %></td>
  					<td><%= stu.getSclass() %></td>
  					<td><%= stu.getSsex() %></td>
  					<td><input class="btn" type="button" value="修改信息" onClick="window.location.href=('/jspStudentManager/tea/updateStu.jsp?id=<%= stu.getSNo() %>')"></td>
  					<td><input class="btn" type="button" value="删除信息" onClick="window.location.href=('/jspStudentManager/servlet/serDeleteStu?id=<%= stu.getSNo() %>')"></td>
  					</tr>
  					<%} %>
  				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
