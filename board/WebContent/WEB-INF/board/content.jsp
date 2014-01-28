<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function deleteArticle(idx){
	 $.ajax({
		   type:'post',
		   url:'/board/delete.json',
		   data: ({idx:idx}),
		   success:function(data){
			   console.log(data);
			  if(data.status == "success"){
				  alert("Deleted.");
				  location.reload();
			  }
		   }
	});
}
</script>	
	<table style="width: 580px;">							
		<caption>Content</caption>						
		<tr>									
			<th>Num</th>						
			<td>${article.idx}</td>
			<th>Writer</th>
			<td>${article.writer}</td>
			<th>regDate</th>
			<td>${article.regdate}</td>
		</tr>
		<tr>
			<th>Title</th>			
			<td colspan="3">${article.title}</td>
			<th>Count</th>
			<td>${article.count}</td>
		</tr>
		<tr>
			<th height="300px;">Content</th>						
			<td  colspan="5"><pre>${article.content}</pre></td>
		</tr>
		<tr>
			<th>File</th>			
			<td  colspan="5">
				<c:if test="${empty article.filename}">NO</c:if>
				<c:if test="${not empty article.filename}"><a href="/board/download/${article.idx}">${article.filename}</a></c:if>
			</td>
		</tr>
	</table>
	<a href="#" onclick="deleteArticle('${article.idx}')">Delete</a>
	<a href="#" onclick="closeContent()" style="float: right;">List</a> 
