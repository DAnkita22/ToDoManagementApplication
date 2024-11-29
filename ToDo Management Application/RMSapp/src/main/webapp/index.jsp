<%@page import="com.entity.TodoDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.TodoDao"%>
<%@page import="com.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<body style="background-color: #FAF9F6">
	<%@include file="component/navbar.jsp"%>

	<h1 class="text-center text-dark p-4">Record Management System</h1>

	<%
	String sucMsg = (String) session.getAttribute("sucMsg");
	if (sucMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=sucMsg%></div>
	<%
	session.removeAttribute("sucMsg");
	}
	%>


	<%
	String failedMsg = (String) session.getAttribute("failedMsg");
	if (failedMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	<div class="container">
		<table class="table table-striped " border="1px">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">To-do</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				TodoDao dao = new TodoDao(DBConnection.getConn());
				List<TodoDetails> todo = dao.getTodo();
				for (TodoDetails t : todo) {
				%>
				<tr>
					<th scope="row"><%=t.getId()%></th>
					<td><%=t.getName()%></td>
					<td><%=t.getTodo()%></td>
					<td><%=t.getStatus()%></td>
					<td><a href="edit.jsp?id=<%=t.getId()%>"
						class="btn btn-success btn-sm text-white">Edit</a> 
						<a href="delete?id=<%=t.getId()%>"
						class="btn btn-danger btn-sm text-white">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>