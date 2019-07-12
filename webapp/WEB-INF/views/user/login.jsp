<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">




<link rel="stylesheet" href="../css/bootstrap.css">
<link href="../css/heroic-features.css" rel="stylesheet">

<!-- Bootstrap core CSS -->

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet"> -->


<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  

<!-- Custom styles for this template -->
<link href="../css/coming-soon.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">




<script type = "text/javascript">

	$(function() {
		$('#checkId').on('click', function(){
			var id = $('#userId').val();
			
		
			$.ajax({
				url : "${pageContext.servletContext.contextPath}/user/join/check",
				type : "get",
				dataType : "json",
				data : {
					id : id
				},
				success : function(response) {
					if (response.data == "exists") {
						$(".result .msg").text("다른 아이디로 가입해 주세요.");
						$("#check_click").val(1);
					} else {
						$(".result .msg").text("사용할 수 있는 아이디입니다.");
						$("#check_click").val(1);
					}
				},
				error : function(xhr, status, error) {
					alert(xhr);
				}
			});
		});
	});
	
	function checkForm(obj){
		var id = obj.userId.value;
		var password = obj.password.value
		var check_click = obj.check_click.value;
		var message = $(".result .msg").text();
		
		if (id.trim().length == 0) {
			alert("아이디를 입력해 주세요");
		} else if (password.trim().length == 0) {
			alert("비밀번호를 입력해 주세요");
		} else if (check_click == 0) {
			alert("중복확인 버튼을 눌러주세요");
		} else if (message == "다른 아이디로 가입해 주세요.") {
			alert("아이디가 중복되오니 바꿔주세요");
		} else {
			alert("회원가입 성공");
			return true;
		}
		return false;
	}
</script>
</head>

<body>
	<%-- <jsp:include page="/WEB-INF/views/board/navigation.jsp" /> --%>


	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="<%=request.getContextPath()%>/" class="scrollto">Song
						of Our Story</a>
				</h1>

			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="${pageContext.servletContext.contextPath }/">Home</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/list">list</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath }/write">write</a></li>
					<li><c:choose>
							<c:when test="${empty authUser }">
								<li class="menu-active"><a class="nav-link"
									href="${pageContext.servletContext.contextPath }/user/login">login</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.servletContext.contextPath }/logout">logout</a>
								</li>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</nav>
		</div>

	</header>

<br><br>




	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Login</h1>
							</div>
						</div>
						<form action="<%=request.getContextPath()%>/user/login" method="post" name="login">
							<div class="form-group">
								<label for="exampleInputEmail1">ID</label> 
								<input type="text" name="userid" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> 
								<input type="password" name="password" id="password" class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
							</div>

							<div class="col-md-12 text-center ">
								<button type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
							</div>
							<div class="col-md-12 ">
								<div class="login-or">
									<hr class="hr-or">
								</div>
							</div>

						</form>

					</div>
				</div>

				<div id="second">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Signup</h1>
							</div>
						</div>
						<form:form modelAttribute="userVo" id="join-form" name="joinForm" method="POST"
							action="${pageContext.servletContext.contextPath }/user/join"  onsubmit="return checkForm(this)">

							<div class="form-group">
								<label for="exampleInputEmail1">ID</label> 
								<input type="text" name="userId" class="form-control" id="userId"
									aria-describedby="emailHelp" placeholder="Enter id">
									
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="button" class=" btn btn-block mybtn btn-primary tx-tfm" id  = "checkId">Check Id</button>
								<p class="result">
								<span class="msg"></span>
								</p>

								<input type="hidden" name="check_click" id="check_click" value="0">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> 
								<input type="password" name="password" id="password" class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">SignUp</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>