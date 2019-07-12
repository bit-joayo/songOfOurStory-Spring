<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE HTML>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->


<html>
<head>
<title>목록</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
 <link href="css/main2.css" rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/heroic-features.css" rel="stylesheet">



<!-- header css -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">

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
<link href="css/style.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('.backgroundImage').each(function() {
			img = $(this);
			index = img.attr('data-no') % 18 + 1;
			img.attr('src', 'img/background/back_' + index + '.jpg');

		});

		$('.contentSub').each(function() {
			contentTag = $(this);
			content = contentTag.attr('data-content');
			subContent = content.substring(0, 46).concat(" ...");
			contentTag.text(subContent);

		});

	});
</script>
<style>

a{
border : none;}
</style>
</head>
<body id="top">
			
	<header id="header">
		 <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="<%=request.getContextPath()%>/" class="scrollto">Song of Our Story</a></h1>
       
      </div>
	 <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="${pageContext.servletContext.contextPath }/">Home</a></li>
          <li class="menu-active"><a href="${pageContext.servletContext.contextPath }/list">list</a></li>
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

			<!-- Main -->
				<div id="main">
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">
							<c:forEach items="${postVoList }" var="vo">
								<div class="box">
									<a href="${pageContext.servletContext.contextPath }/view?postNo=${vo.postNo}" class="image fit">
									<img class="backgroundImage" data-no="${vo.postNo}" src="" alt="" style="height:250px; width:100%"/></a>
									<div class="inner">
										<h3>${vo.title }</h3>
	                                    <p class="contentSub" data-content="${vo.postContent }" style="font-size: 15px">${vo.postContent }</p>
	                                    <p><img style="width:20px; height:20px" src="img/icon/person3.png" alt="" /> &nbsp ${vo.userId }  &nbsp&nbsp
	                                       <img style="width:20px; height:20px" src="img/icon/calendar6.png" alt="" /> &nbsp ${vo.regDate}
	                                </p>
										<a href="${pageContext.servletContext.contextPath }/view?postNo=${vo.postNo}" class="button fit" data-poptrox="youtube,800x400">사연 보기</a>
									</div>
								</div>
							</c:forEach>

							
							
							

						</div>

					</div>
				</div>

			
		<!-- Scripts -->
			<!-- <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
 -->
	</body>
</html>