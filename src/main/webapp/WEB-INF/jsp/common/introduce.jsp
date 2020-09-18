<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
	<script type="text/javascript">
		function initPagination(show)
		{
			// 获取分页数据中的总记录数 
			var totalRecord = ${requestScope.pageInfo.total};
			// 声明 Pagination 设置属性的 JSON 对象 
			var properties = { 
					           // 边缘页数 
							   num_edge_entries: 3,  
							   // 主体页数 
							   num_display_entries: 5,       					 
							   // 用户点击“翻页”按钮之后 执行翻页操作的回调函数 
							   callback: pageSelectCallback, 					  
							   // current_page默认值为0,表示第一页而pageNum 从 1 开始， 必须-1 后才可以赋值 
							   current_page: ${requestScope.pageInfo.pageNum-1},  
							   prev_text: "上一页", 
							   next_text: "下一页", 
							   // 每页显示 pageSize 项 
							   items_per_page:${requestScope.pageInfo.pageSize}  
							 };
			$("#Pagination").pagination(totalRecord, properties);
			
			// 点击“上一页”、“下一页”或“数字页码”都会触发翻页动作，从而导致当前函数被调 用
			// pageIndex 是用户在页面上点击的页码数值
			
			function pageSelectCallback(pageIndex, jQuery) 
			{ 
			 // pageIndex 是当前页页码的索引值(比页码数小1)，而 pageNum与页码数是相等的,所以pageNum = pageIndex + 1
			 var pageNum = pageIndex + 1; 
			 // 执行页面跳转也就是实现“翻页” 
			 window.location.href = "${pageContext.request.contextPath}/"+show+"?pageNum="+pageNum+"&keyWord=${param.keyWord}"; 
			 // 取消当前超链接的默认行为 
			 return false; 
			}
		}
	</script>