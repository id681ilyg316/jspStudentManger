<%@ page language="java"
	import="java.util.*,com.ten.dao.*,com.ten.user.Teacher,com.ten.user.QueryResult"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>学生信息管理系统-信息查询</title>
<link href="style_1.css" type="text/css" rel="stylesheet" />
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
	<div class="top">
		<div class="title">
			<p>学生信息管理系统</p>
		</div>
	</div>
	<div class="main">
		<div class="main_left">

			<div class="main_left_class02">
				<a href="tea/selectStu.jsp">学生信息</a>
			</div>
			<div class="main_left_class03">
				<a href="tea/Query.jsp">信息查询</a>
			</div>
			<div class="main_left_class100">
				<input class="reset" type="button" value="注销"
					onClick="window.location.href=('/jspStudentManager/servlet/serDoLogout')">
			</div>
		</div>
		<%
			Teacher tea = null;
			if (session.getAttribute("teacher") == null) {
				response.sendRedirect("/jspStudentManager/Login.jsp");
			} else {
				tea = (Teacher) session.getAttribute("teacher");
		%>
		<div class="main_right">
			<div class="info">
				<p>
					亲爱的<%=tea.getTname()%>老师，下午好
				</p>
			</div>
			<div class="box">
				<div class="function">
					<p>[通知]信息系统已开放</p>
				</div>
				<div class="form">
					<div class="form_1">
						<form action="servlet/serQuerySc" method="post">
							<table class="form_1_table">
								<tr>
									<td><input class="text" type="text" name="queryKey"
										placeholder="请输入查询项" /></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><select name="type">
											<option value="1">学号</option>
											<option value="2">姓名</option>
									</select></td>
									<td><input class="btn" type="submit" value="查询" /></td>
								</tr>

								<%
									if (request.getAttribute("queryResult") == null) {
								%>
							</table>
						</form>
						<%
							} else {
									int type = Integer.parseInt(request.getParameter("type"));
									String queryKey = request.getParameter("querykey");
									List<QueryResult> list = (List<QueryResult>) request.getAttribute("queryResult");
									Iterator<QueryResult> ite = list.iterator();
									if (ite.hasNext() && type != 20) {//查询结果不为空，输出表格
										QueryResult tem = null;
						%>
						<table>
							<tr>
								<td>学号</td>
								<td>学生姓名</td>
								<td>学生班级</td>
								<td>学生性别</td>
							</tr>

							<%
								while (ite.hasNext()) {
												tem = ite.next();
							%>

							<tr>
								<td><%=tem.getSNo()%></td>
								<td><%=tem.getSname()%></td>
								<td><%=tem.getSclass()%></td>
								<td><%=tem.getSsex()%></td>
							</tr>

							<%
								}
							%>
						</table>

						<%
					
				}else if(type!=20){
				%>
						<table>
							<p>结果为空，信息关系不存在 或输入项错误</p>
						</table>


						<%
				}			
			}
  	
   %>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>
</body>
</html>

