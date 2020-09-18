<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>课程信息显示</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="../common/introduce.jsp"></jsp:include>
</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="../common/top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="../common/menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">已修课程</h1>
						</div>
				    </div>
				    <table class="table table-bordered">
					        <thead>
					            <tr>
									<th>课程号</th>
									<th>课程名称</th>
									<th>授课老师编号</th>
									<th>上课时间</th>
									<th>上课地点</th>
									<th>周数</th>
									<th>课程类型</th>
									<th>学分</th>
									<th>成绩</th>
					            </tr>
					        </thead>
					        <tbody>
							<c:forEach  items="${selectedCourseList}" var="item">
								<%--输出已修完的课程--%>
								<c:if test="${item.over}">
									<tr>
										<td>${item.couseCustom.courseid}</td>
										<td>${item.couseCustom.coursename}</td>
										<td>${item.couseCustom.teacherid}</td>
										<td>${item.couseCustom.coursetime}</td>
										<td>${item.couseCustom.classroom}</td>
										<td>${item.couseCustom.courseweek}</td>
										<td>${item.couseCustom.coursetype}</td>
										<td>${item.couseCustom.score}</td>
										<td style="color: red">${item.mark}</td>
									</tr>
								</c:if>
							</c:forEach>
					        </tbody>
				    </table>
				
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		<%--设置菜单中--%>
		$("#nav li:nth-child(3)").addClass("active")

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>