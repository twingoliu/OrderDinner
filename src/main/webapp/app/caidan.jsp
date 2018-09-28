﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 包含公共的JSP代码片段 -->
	
<title>无线点餐平台</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="${pageContext.request.contextPath }/app/detail/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/detail/style/js/page_common.js"></script>

<link href="${pageContext.request.contextPath }/app/detail/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/detail/style/css/index_1.css" />
<link href="${pageContext.request.contextPath }/app/detail/style/css/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	// 参数： 当前页
	function gotoPage(page){
				
		// 先获取当前表单对象
		var frm = document.forms[0];
		frm.action = "${pageContext.request.contextPath }/food?method=foodDetail" + "&currentPage="+page ;
		alert(frm.action);
		frm.submit();
	
	}

</script>
</head>

<body style="text-align: center">
	<div id="all">
		<div id="menu">
			<!-- 显示菜品的div -->
			<div id="top">
				<ul>
					<!-- 循环列出菜品 -->
					<c:forEach var="food" items="${requestScope.pb.list}">
						<li>
							<dl>
								<dt>
									<a href="${pageContext.request.contextPath }/app/caixiangxi.jsp">
										<img width="214px" height="145px" src="${pageContext.request.contextPath }/app/detail/style/images/baizhuoxia.jpg" />
									</a>
								</dt>
								<dd class="f1">
									<a href="#">${food.foodName }</a>
								</dd>
								<dd class="f2">
									<a href="${pageContext.request.contextPath }/app/caixiangxi.jsp">&yen;${food.price }</a>
								</dd>
							</dl>
						</li>
					</c:forEach>
						
					
				</ul>
			</div>
			
			<!-- 底部分页导航条div -->
			<div id="foot">
				
					
					
						<span
							style="float:left; line-height:53PX; margin-left:-50px; font-weight:bold; ">
							<span style="font-weight:bold">&lt;&lt;</span>
						</span>
					
				
				<div id="btn">
					当前${pb.page}/${pb.totalPages}页 &nbsp;
					<!-- 
					<a href="${pageContext.request.contextPath }/food?method=foodDetail&currentPage=1">首页</a>
					<a href="${pageContext.request.contextPath }/food?method=foodDetail&currentPage=${pb.page-1}">上一页</a>
					<a href="${pageContext.request.contextPath }/food?method=foodDetail&currentPage=${pb.page+1}">下一页</a>
					<a href="${pageContext.request.contextPath }/food?method=foodDetail&currentPage=${pb.totalPages}">尾页</a>
					 -->
					 <a href="javascript:gotoPage(1)">首页</a>
					 <a href="javascript:gotoPage(${pb.page-1})">上一页</a>
					 <a href="javascript:gotoPage(${pb.page+1})">下一页</a>
					 <a href="javascript:gotoPage(${pb.totalPages})">尾页</a>
				</div>
				
					
						<span style="float:right; line-height:53px; margin-right:10px;  ">
							<a
							href="#"
							style=" text-decoration:none;color:#000000; font-weight:bold">&gt;&gt;</a>
						</span>
					
					
				
			</div>
			
		</div>

		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
		
			<div id="dish_top">
				<ul>
				<li class="dish_num"></li>
					<li>
						<a href="${pageContext.request.contextPath }/app/clientOrderList.jsp">
							<img src="${pageContext.request.contextPath }/app/detail/style/images/call2.gif" />
						</a>
					</li>
				</ul>
			</div>
	<form action="${pageContext.request.contextPath }/food?method=foodDetail" method="post">
	
			<div id="dish_2">
				<ul>
					
					<!-- 迭代菜系列表 -->
					<c:forEach var="foodType" items="${requestScope.listFoodType}">
						<li>
							<a href="${pageContext.request.contextPath }/food?method=foodDetail&foodTypeId=${foodType.id}">${foodType.typeName }</a>
							<input type="hidden" name="foodTypeId" value="${foodType.id}">
						</li>
					</c:forEach>
						
				</ul>
			</div>
			<div id="dish_3">
				<!-- 搜索菜品表单  -->
				
					<table width="166px">
						<tr>
							<td>
								<input type="text" id="dish_name" name="foodName" class="select_value" /> 
								<%--<input type="hidden" value="selectFood" name="method">--%>
							</td>
						</tr>
						<tr>
							<td><input type="submit" id="sub" value="搜索" /></td>
						</tr>
						<tr>
							<td>
								<a href="#">
									<img src="${pageContext.request.contextPath }/app/detail/style/images/look.gif" />
								</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>
