<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board List</title>		
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

<script type="text/javascript">
	function openContent(idx){
		 $('.mw_layer').addClass('open');
		 $.ajax({
			   type:'post',
			   url:'/board/count',
			   data: ({idx:idx}),
			   success:function(data){
				 $('#layer').html(data);
			   }
		});
	}
	function closeContent(){$('.mw_layer').removeClass('open');}
	
	jQuery(function($){
		 var layerWindow = $('.mw_layer');
		
		 // ESC Event
		 $(document).keydown(function(event){
		  if(event.keyCode != 27) return true;
		  if (layerWindow.hasClass('open')) {
		   layerWindow.removeClass('open');
		  }
		  return false;
		 });
		 // Hide Window
		 layerWindow.find('>.bg').mousedown(function(event){
		  layerWindow.removeClass('open');
		  return false;
		 });
		 //$("tr:even").addClass("odd");

		});
		
	function loadNextPage(){
		var page = $('#page').val();
		page = parseInt(page);
		page += 10;
		 $.ajax({
			   type:'post',
			   url:'/board/ajaxList',
			   data: ({page:page}),
			   success:function(data){
				   if(data.trim() == "")
					   alert("no more content.");
				   else{
					   $('table').append(data);
					   $('#page').val(page);
				   }
			   }
		});
	}
	
	function loadWriteForm(){
		 $.ajax({
			   type:'post',
			   url:'/board/write',
			   success:function(data){
				   $('.mw_layer').addClass('open');
				   $('#layer').html(data);
			   }
		});
	}
</script>
<style type="text/css">
	html, body{height:100%;margin:0 auto;}
	div#content {margin : 0 auto; width:800px;}
	.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
	.mw_layer.open{display:block}
	.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
	#layer{position:absolute;top:30%;left:40%;width:600px;height:600px;margin:-150px 0 0 -194px;padding:28px 28px 0 28px;border:2px solid #555;background:#fff;font-size:12px;font-family:Tahoma, Geneva, sans-serif;color:#767676;line-height:normal;white-space:normal}
</style>
<link rel="stylesheet" type="text/css"	href="<c:url value="/resources/style/table.css"/>" />
</head>
<body>											
<div id="content">
	<table>		
		<caption onclick="location.href='/board/'" style="cursor:pointer">Board</caption>						
		<thead>
			<tr>									
				<th width="7%">Number</th>			
				<th width="50%">Title</th>			
				<th width="16%">Writer</th>
				<th width="10%">Date</th>
				<th width="7%">Count</th>
				<th width="10%">File</th>
			</tr>
		</thead> 
			<c:forEach items="${articleList}" var="article">
				<tr>
					<td>${article.idx}</td>
					<td><a href="#layer" onclick="openContent('${article.idx}')">${article.title} </a></td>
					<td>${article.writer}</td>
					<td>${article.regdate}</td>
					<td>${article.count}</td>  
					<td>
						<c:if test="${empty article.filename}">NO</c:if>
						<c:if test="${not empty article.filename}"><a href="/board/download/${article.idx}">다운로드</a></c:if>
					</td>  
				</tr>
			</c:forEach>
	</table>  
	<input type="hidden" name="page" id="page" value="${page}">
	<a href="#" onclick="loadWriteForm()">Write</a>
	<span style="cursor: pointer;float: right;" onclick="loadNextPage()">see more</span>
</div>
	<!-- light box -->
	<div class="mw_layer">
		<div class="bg"></div>
		<div id="layer"></div>
	</div>
</body>
</html>