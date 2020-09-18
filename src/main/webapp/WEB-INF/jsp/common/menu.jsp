<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<shiro:hasRole name="admin">
	<div class="col-md-2">
	    <ul class="nav nav-pills nav-stacked" id="nav">
	        <li><a href="${pageContext.request.contextPath}/admin/showCourse">课程管理<span class="badge pull-right">8</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span class="badge pull-right">59</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span class="badge pull-right">10</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/admin/userPasswordRest">账号密码重置<span class="glyphicon glyphicon-repeat pull-right" ></span></a></li>
	        <li><a href="${pageContext.request.contextPath}/reset/passwordRest">修改密码<span class="glyphicon glyphicon-pencil pull-right"></span></a></li>
	        <li><a href="${pageContext.request.contextPath}/logout">退出系统<span class="glyphicon glyphicon-log-out pull-right" ></span></a></li>
	    </ul>
	</div>
</shiro:hasRole>
<shiro:hasRole name="teacher">
	<div class="col-md-2">
	    <ul class="nav nav-pills nav-stacked" id="nav">
	        <li><a href="${pageContext.request.contextPath}/teacher/showCourse">我的课程<span class="badge pull-right">8</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/reset/passwordRest">修改密码<span class="glyphicon glyphicon-pencil pull-right" ></span></a></li>
	        <%-- <li><a href="${pageContext.request.contextPath}/logout">退出系统<span class="glyphicon glyphicon-log-out pull-right" ></span></a></li> --%>
	    </ul>
	</div>
</shiro:hasRole>
<shiro:hasRole name="student">
	<div class="col-md-2">
	    <ul class="nav nav-pills nav-stacked" id="nav">
	        <li><a href="${pageContext.request.contextPath}/student/showCourse">所有课程<span class="badge pull-right">26</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/student/selectedCourse">已选课程<span class="badge pull-right">5</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/student/overCourse">已修课程<span class="badge pull-right">8</span></a></li>
	        <li><a href="${pageContext.request.contextPath}/reset/passwordRest">修改密码<span class="glyphicon glyphicon-pencil pull-right" ></span></a></li>
	        <%-- <li><a href="${pageContext.request.contextPath}/logout">退出系统<span class="glyphicon glyphicon-log-out pull-right" ></span></a></li> --%>
	    </ul>
	</div>
</shiro:hasRole>