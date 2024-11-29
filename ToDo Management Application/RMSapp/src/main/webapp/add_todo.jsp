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
	<div class="container ">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body ">
						<h3 class="text-center text-dark">Add To-Do</h3>
						<form action="add_todo" method="post">

							<div class="form-group p-2 ">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="username">

							</div>
							<div class="form-group p-2 ">
								<label for="exampleInputEmail1" class="form-label">To-Do</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="todo">

							</div>
							<div class="form-group">
								<label for="inputStatus">Status</label> <select
									class="form-control" id="inputStatus" name="status">
									<option selected>--Select--</option>
									<option value="Pending">Pending</option>
									<option value="Completed">Completed</option>
								</select>

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>