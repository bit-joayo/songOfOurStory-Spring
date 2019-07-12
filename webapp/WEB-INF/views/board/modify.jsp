<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>modify page</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/heroic-features.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<!-- <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"> -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">




<link href="css/landing-page.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<style type="text/css">


.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'); /* ie */
}

.wrap-loading div { /*로딩 이미지*/
	position:absolute; top:50%; left:50%; width:300px; height:200px; 
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	   $(function() {
	      $('#btn1').on('click', function() {
	         var textarea = $('#textarea').val();
	         var titleText = $('#title').val();
	         var userIdText = $('#userId').val();
	         var postNo = $('#postNo').val();
	         var authUser = "${userVo}";
	         var topic = $('#topicSelectBox').val();
	         
	         if(topic == 0 ){
	            alert('주제를 선택해 주세요');
	            return false;
	         }

	         if (authUser) {
	         } else {
	            alert("로그인 후 이용해 주세요");
	            location.href = "user/login";
	         }

	         if (textarea.length > 500) {
	            alert("500자 이내로 작성해 주세요");
	            return false;
	         }
	         
	         var textarea = textarea.replace(/\n/g, " ");

	         var form = {
	            title : titleText,
	            postContent : textarea,
	            userId : userIdText,
	            topic : topic,
	            postNo : postNo
	         }
	         $.ajax({
	            url : "updateObject",
	            contentType : 'application/json',
	            method : 'POST',
	            crossDomain : true,
	            data : JSON.stringify(form),
	            beforeSend:function(){
	               $('.wrap-loading').removeClass('display-none');
	            },
	            complete : function() {
	               $('.wrap-loading').addClass('display-none');
	               var s = "http://localhost:8080/Bamboo/list";
	               window.location.replace(s);
	            }
	         });
	      });
	   });
	});

	var timer = null;

	function textSize() {
		
		var textAreaValue = document.getElementById("textarea").value; //사연 내용의 값
		var textAreaSize = textAreaValue.length //내용의 길이
		document.getElementById("textSizeCheck").value = textAreaSize; //글자수
		//0초마다 이 함 수 발동
		//setInterval("textSize()",0);
		if (textAreaSize > 500) {
			document.getElementById("textSizeCheck").style.color = "red";
		} else{
			document.getElementById("textSizeCheck").style.color = "black";
		}
	}
</script>
</head>

<body style="background-image:url('img/background/back_5.jpg')">
	<%-- <jsp:include page="/WEB-INF/views/board/navigation.jsp" /> --%>
	
	<div class="wrap-loading display-none">
		<div>
			<img src="images/spin.gif" />
		</div>
	</div>
	 <header id="header">
     <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="<%=request.getContextPath()%>/" class="scrollto">Song of Our Story</a></h1>
       
      </div>
	 <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="${pageContext.servletContext.contextPath }/">Home</a></li>
          <li><a href="${pageContext.servletContext.contextPath }/list">list</a></li>
          <li class="menu-active"><a href="${pageContext.servletContext.contextPath }/write">write</a></li>
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
	<br>


	<!-- Page Content -->
	<div class="container">

		<header class="jumbotron my-4">
			<p>
				<label class="display-5">♡제목 > </label> <input type="text"
					id="title" value="${postVo.title}">
			</p>
			<p>
				<label class="display-5">♡주제 > </label> <select name="selectbox"
					id="topicSelectBox" onchange="titleDisplay(this);">
					<option selected value=0>선택</option>
					<option value="연애">연애</option>
					<option value="이별">이별</option>
					<option value="고민">고민</option>
					<option value="가족">가족</option>
					<option value="일상생활">일상생활</option>
				</select>
			</p>
			<p>
				<textarea id="textarea" name="textarea" class="form-control"
					rows="15" onkeyup="textSize();">${postVo.postContent}</textarea>
			</p>
			<p>
				<input type="text" size=2 name="textSizeCheck" id="textSizeCheck"
					readonly>/500<br>
			</p>
			<input type="hidden" id="userId" value="${userVo.userId}"> 
			<input type="hidden" id="postNo" value="${postVo.postNo}">
			<a href="#" class="btn btn-primary btn-block" id="btn1">수정완료 노래추천받기</a>
		</header>

		<div class="row text-center"></div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="jquery/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>

