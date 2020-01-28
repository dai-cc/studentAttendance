<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.attendance.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'attendant_manage.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/kaoqin.css">
<script src="js/jquery.js"></script>
<script> 
$(document).ready(function(){
$(".flip").click(function(){
$(".panel").toggle();
});
});
$(document).ready(function(){
$(".flip1").click(function(){
$(".panel1").toggle();
});
});
$(document).ready(function(){
$(".flip2").click(function(){
$(".panel2").toggle();
});
});
$(document).ready(function(){
$(".flip3").click(function(){
$(".panel3").toggle();
});
});
</script>
	<script type="text/javascript">
    function confirmdialog(){
       if(window.confirm("您确定要删除此条信息？")){
       return true;
       }
       else{
     //  alert("取消删除！");
       return false;
       }      
    }
	 </script>
  </head>
  <body>
  <jsp:include page="/views/head.jsp"/>
			<div class="left" style="background-color:#F0FFFF;">
			<table>
				<br/>
				<tr>
				<p class="flip" align="center" style="height:28px;background-image:url(img/celian.gif);background-repeat: no-repeat;background-size:cover;">用户信息管理</p>
                <div class="panel" style="display:none" align="center">
                <a class="button gray" href="javascript:window.location.href='personalServlet?personal=<%=2 %>';">个人基本信息</a><br/><br/>
                <a class="button gray" href="javascript:window.location.href='views/admin/user_pwd.jsp';">密码修改</a>
				</div>
				</tr>
                <tr>
				<p class="flip1" align="center" style="height:28px;background-image:url(img/celian.gif);background-repeat: no-repeat;background-size:cover;">课程表管理</p>
                <div class="panel1" style="display:none" align="center">
				<a class="button gray" href="javascript:window.location.href='courseServlet?Course=<%=1 %>';">查看与管理</a><br/><br/>
				<a class="button gray" href="javascript:window.location.href='views/admin/course_add.jsp'">课程信息输入</a>
				</div>
				</tr>
                <tr>
				<p class="flip2" align="center" style="height:28px;background-image:url(img/celian.gif);background-repeat: no-repeat;background-size:cover;">学生信息管理</p>
                <div class="panel2" style="display:none" align="center">
				<a class="button gray" href="javascript:window.location.href='studentsServlet?Students=<%=1 %>';">查看与管理</a><br/><br/>
				<a class="button gray" href="javascript:window.location.href='views/admin/students_add.jsp'">学生信息输入</a>
				</div>
				</tr>
				<tr>
				<p class="flip3" align="center" style="height:28px;background-image:url(img/celian.gif);background-repeat: no-repeat;background-size:cover;">老师信息管理</p>
				<div class="panel3" style="display:none" align="center">
				<a class="button gray" href="javascript:window.location.href='teacherServlet?Teacher=<%=1 %>';">查看与管理</a><br/><br/>
				<a class="button gray" href="javascript:window.location.href='views/admin/teacher_add.jsp'">老师信息输入</a>
				</div>
				</tr>
            </table>
			</div>
			<div class="right">
			<center><h2>修改的学生信息如下：</h2></center>
  			<table class="table4_2" align="center" width="496" border="100" cellSpacing=1 style="border:1pt;font-size:15pt;"height="31">
  			<tr>
  			<td>学号</td>
    		<td>姓名</td>
    		<td>性别 </td>
    		<td>班级</td>
    		<td>密码</td>
    		</tr>
    		<%
    		int id=0;
    		ArrayList<students> result=new ArrayList<students>();
    		result=(ArrayList<students>)request.getAttribute("studentsresult");
    		if(!result.isEmpty()){
    		for(int i=0;i<result.size();i++){
    			students stu=result.get(i);
    			id=stu.getStudent_id();
    			out.print("<tr>");
    			out.print("<td>"+stu.getStudent_id()+"</td>");
    			out.print("<td>"+stu.getStudent_name()+"</td>");
    			out.print("<td>"+stu.getGender()+"</td>");
    			out.print("<td>"+stu.getClazz()+"</td>");
    			out.print("<td>"+stu.getPassword()+"</td>");
    			out.print("</tr>");
    			}
    		}
    		%>
		</table>  
		<br/>
  		<form action="studentsServlet" method="post">
  		<input type="hidden" name="Students" value="3"/>
  		<table class="table4_2" align="center" width="396" border="100" cellSpacing=1 style="border:1pt;font-size:15pt;"height="31">
  		<h4><tr><td>学号：</td><td><input type="text" name="student_id" value="<%=id %>"/></td></tr>
			<tr><td>姓名：</td><td><input type="text" name="student_name" placeholder="请输入姓名"/></td></tr></h4>
		<h4><tr><td>性别：</td><td><input type="radio" name="gender" checked="checked" value="男" style="margin-left: 20px" />男
	              		  <input type="radio" name="gender" value="女" style="margin-left: 20px"/>女</td></tr></h4>
		<h4><tr><td>班级：</td><td><input type="text" name="clazz" placeholder="请输入班级"/></td></tr>
		<h4><tr><td>密码 ：</td><td><input type="text" name="password" placeholder="请输入密码"/></td></tr></h4>
  		<tr><td colspan="2" align="center">
  		<input class="button blue" type="submit" value="修改"/>
  		<input class="button red" type="reset" value="重置"/></td></tr>
  		</table>
  		</form>
		</div>
		</div>
	<jsp:include page="/views/foot.jsp"/>
  </body>
</html>
