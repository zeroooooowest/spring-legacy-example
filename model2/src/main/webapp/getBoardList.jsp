<%@page import="java.util.List"%>
<%@page import="me.zw.model2.board.BoardVO"%>
<%@ page import="me.zw.model2.board.impl.BoardDAO" %>
<%@page contentType="text/html; charset=UTF-8" language="java"%>

<%
    // 우선은 세션에 저장해둔 걸 꺼낸다. 나중에 개선
	List<BoardVO> boardList = (List) session.getAttribute("boardList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<body>
	<div style="text-align: center">
		<h1>글 목록</h1>
		<h3>
			테스트님 환영합니다...<a href="logout_proc.jsp">Log-out</a>
		</h3>
		<!-- 검색 시작 -->
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right"><select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select> <input name="searchKeyword" type="text" /> <input type="submit"
						value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<%
				for (BoardVO board : boardList) {
			%>
			<tr>
				<td><%=board.getSeq()%></td>
				<td align="left"><a href="getBoard.do?seq=<%=board.getSeq()%>">
						<%=board.getTitle()%></a></td>
				<td><%=board.getWriter()%></td>
				<td><%=board.getRegDate()%></td>
				<td><%=board.getCnt()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <a href="insertBoard.jsp">새글 등록</a>
	</div>
</body>
</html>