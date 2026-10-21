<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, tr, th, td {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		text-align : center;
	}
</style>


</head>

<body>
	<!-- 게시글번호, 제목, 내용, 작성자, 작성일 출력 -->
	
	<%@ include file = "../db.jsp" %>
	<h2>게시글 목록</h2>
	<hr>
	<% 
		ResultSet rs = null;
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
	%>
		<h3>번호 : <%= rs.getString("BOARDNO") %></h3>
		<h3>제목 : <%= rs.getString("TITLE") %></h3>
		<h4>내용 : <%= rs.getString("CONTENTS") %></h4>
		<h4>내용 : <%= rs.getString("USERID") %></h4>
		<h4>내용 : <%= rs.getString("CDATETIME") %></h4>
	<% 
		} else {
	%>
			<div>삭제된 게시글입니다.</div>
		 	<a href="board-list.jsp"><button>되돌아가기</button></a>
		
			
	<%
		}
	%>
		
		
	<table>
	<tr>
		<th>게시글번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		
	</tr>
	<% 
		while(rs.next()){
			// out.println("<div>" + rs.getString("CONTENTS") + "</div>");
	%>
	
		<tr>
			<td><%= rs.getString("BOARDNO") %></td>
			<td>
				<a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)"><%= rs.getString("TITLE") %></a>
				</td>
			<td><%= rs.getString("TITLE") %></td>
			<td><%= rs.getString("USERID") %></td>
			<td><%= rs.getString("UDATETIME") %></td>
		</tr>
	
	<%
		}
	%>
	
</table>
	
</body>
</html>

<script>

	function fnView(boardNo){
		location.href = "board-view.jsp?boardNo="+boardNo; // 주소에 공백은 문자취급됨!
		
	}
	
</script>