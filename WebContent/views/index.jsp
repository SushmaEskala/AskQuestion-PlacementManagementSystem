<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<style>
.btn {
	float: right;
}

.questions {
	float: inherit;
}

.menu {
	float: left;
}
</style>

<script>
	function show(shown) {
		document.getElementById(shown).style.display = "block";
		//document.getElementById(hidden).style.display="none";
		return false;
	}
</script>


</head>
<body>
	<div class="header">
		<center>
			<h1>Placement Management System</h1>
		</center>
		<div class="btn">
			<img src="logout.png" /> <img src="user.png" />
			<form action="savequestion" method="post">
				<div class="container">
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Open Modal</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Raise a Question</h4>
								</div>
								<div class="modal-body">
									<p>
										<select value="--Select Category--">
											<option value="--Select Category--">--Select
												Category--</option>
										</select>
									</p>
									<p>
										<textarea id="post-question" rows="5" cols="50"
											placeholder="Write your question here.."></textarea>
									</p>
									<p>
										<button id="post" onclick="return show('quest')">Post</button>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="menu">
		<p>Home</p>
		<p>Get Companies</p>
		<p>My Questions</p>
	</div>
	<div class="questions" id="quest"
		style="height: 100px; width: 900px; display: none;">

		<c:forEach var="list" items="${list}">
			<table>
				<tr>
					<td>${list.queries}</td>
					<td><img id="status" src="icon.png" height="40px" width="40px" /></td>
				</tr>
				<tr>
					<td><button id="view-answer" onclick="return show('answer')">View Answer</button></td>
					<td><img src="tag.png" id="category" height="10px"
						width="10px" /></td>
					<td><i id="answered-by" class="glyphicon glyphicon-user"></i></td>
				</tr>
				<tr>
					<td><div id="answer" style="display:none;">${list.answer}</div></td>
				</tr>
			</table>
		</c:forEach>

	</div>
	<script>
		var coll = document.getElementsByClassName("collapsible");
		var i;
		for (i = 0; i < coll.length; i++) {
			coll[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "inline-block") {
					content.style.display = "none";
				} else {
					content.style.display = "inline-block";
				}
			});
		}
	</script>

</body>
</html>