<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Song of Our Story</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/heroic-features.css" rel="stylesheet">

Bootstrap core CSS
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
Custom fonts for this template
<link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">


<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">



  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">




<!-- Custom styles for this template -->
<link href="css/coming-soon.min.css" rel="stylesheet">


</head>

<body>
	<header id="header">
		<div class="container-fluid">
			<div id="logo" class="pull-left">
				<h1>
					<a class="scrollto">Song of Our Story</a>
				</h1>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a
						href="${pageContext.servletContext.contextPath }/">Home</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/list">list</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/write">write</a></li>
					<li><c:choose>
							<c:when test="${empty authUser }">
								<li class="nav-item"><a class="nav-link"
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

	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted"
		loop="loop">
		<source src="mp4/bg.mp4" type="video/mp4">
	</video>

	<div class="masthead">

		<div class="masthead-bg"></div>
		<div class="container h-100">
			<div class="row h-100">
				<div class="col-12 my-auto">
					<div class="masthead-content text-white py-5 py-md-0">
						<h4 class="mb-3">누군가와 서로 공감할 때, <br>
						사람과 사람과의 관계는 보다 
						<br>깊어져 갈 수 있다</h1>
						<p class="mb-5">- 오쇼 라즈니 쉬</p>
						<div class="input-group input-group-newsletter">

							<div class="input-group-append">
								<button class="btn btn-secondary" type="button"onclick="location.href='${pageContext.servletContext.contextPath }/user/login' " >가입하러 가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/coming-soon.min.js"></script>

</body>

</html>
