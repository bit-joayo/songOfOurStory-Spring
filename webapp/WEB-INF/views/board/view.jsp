<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Views</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/animate.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>


  <link href="css/style.css" rel="stylesheet">

  <!-- Colors CSS -->
  <link rel="stylesheet" href="css/colors.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/custom.css">


  <!-- Custom styles for this template -->
  <link href="css/agency.min.css" rel="stylesheet">
  
  
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>


  <style>
    li {
      list-style: none
    }
    body{margin-top:20px;}

.comment-wrapper .panel-body {
    max-height:650px;
    overflow:auto;
}

.comment-wrapper .media-list .media img {
    width:64px;
    height:64px;
    border:2px solid #e5e7e8;
}

.comment-wrapper .media-list .media {
    border-bottom:1px dashed #efefef;
    margin-bottom:25px;
}

.masthead:after {
	opacity: 0.1;
}
        
  </style>





<script type="text/javascript">

	$(function() {
		$('#comment_post').on('click',function() {
					var content = $('#comment_textarea').val();
					var postNo = $('#postNo').val();
					var userId = $('#userId').val();
					

					var form = {
						content : content,
						postNo : postNo,
						userId : userId
					}

					$.ajax({
						url : "writeComment",
						contentType : 'application/json',
						method : 'POST',
						crossDomain : true,
						data : JSON.stringify(form),
						complete : function() {
							var s = "http://localhost:8080/Bamboo/view?postNo="
									+ postNo;

							window.location.replace(s);
						}
					});
				});
		$('.masthead').each(function() {
			img = $(this);
			index = img.attr('data-no') % 18 + 1;
			style="background-image:url('img/background/back_2.jpg')"
			img.attr("style", "background-image:url('img/background/back_" + index + ".jpg");	


		});
	});
	
		
	//댓글 삭제
	$(function(){
		$(".delete_comment").on('click', function(){
			var result = confirm("댓글을 삭제하시겠습니까?");
			var postNo = $('#postNo').val();
			
			var comment_no = $(this).attr('value');
			
			if(result){
				$.ajax({
					url:"deleteComment",
					contentType:'application/json',
					method:'POST',
					crossDomain:true,
					
					data:JSON.stringify(comment_no),
					complete : function() {
						var s = "http://localhost:8080/Bamboo/view?postNo="
							+ postNo;
					window.location.replace(s);
					}					
					
				});
			}else{
				return false;
			}
			
		});
	});	
		
	function delete_post(obj) {
		var result = confirm("정말로 삭제하시겠습니까");
		var postNo = ${postVo.postNo}

		if (result) {
			$.ajax({

				url : "delete",
				contentType : 'application/json',
				method : 'POST',
				crossDomain : true,
				data : JSON.stringify(postNo),

				complete : function() {
					var s = "http://localhost:8080/Bamboo/list";
					window.location.replace(s);
				}
			});
		} else {
			return false;
		}
	}
</script>




</head>

<body>
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1>
          <a href="<%=request.getContextPath()%>/" class="scrollto">Song of Our Story</a>
        </h1>

      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="${pageContext.servletContext.contextPath }/">Home</a></li>
          <li><a href="${pageContext.servletContext.contextPath }/list">list</a></li>
          <li><a href="${pageContext.servletContext.contextPath }/write">write</a></li>
          <li>
            <c:choose>
              <c:when test="${empty authUser }">
          <li class="nav-item"><a class="nav-link"
              href="${pageContext.servletContext.contextPath }/user/login">login</a>
          </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath }/logout">logout</a>
            </li>
          </c:otherwise>
          </c:choose>
          </li>
        </ul>
      </nav>
    </div>
  </header>



<div  class="animated fadeIn">
	<!-- Header -->
	<header class="masthead" data-no="${postVo.postNo }" style="background-image:url('img/background/back_2.jpg')" alt="">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading text-uppercase" style="font-size: 50px;">${postVo.title }</div>
				<div class="intro-lead-in" style="font-size: 25px;">${postVo.postContent }</div>
				
				<c:choose>
				<c:when test="${authUser.userId eq postVo.userId}">
					<p style="text-align: right">
						<a
							href="<%=request.getContextPath()%>/modify?postNo=${postVo.postNo}"
							class="btn btn-primary btn-lg">수정</a> <input type="button"
							class="btn btn-primary btn-lg" value="삭제" onclick="delete_post()">
					</p>
				</c:when>
			</c:choose>
			</div>
		</div>
	</header>


	<!-- Team -->
  <section class="bg-light page-section" id="team">
    <div class="container">


      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Music List</h2>
          <h3 class="section-subheading text-muted">Recomend Music List</h3>
        </div>
      </div>

      <div class="row">
      
        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/icon/medal_1.png" alt="">
           	 	<h4>${songList[0].singer}</h4>
	            <h4>${songList[0].title }</h4>
            	<p class="text-muted">장르 > ${songList[0].genre }</p>
            <a href="https://www.youtube.com/results?search_query=${songList[0].title }" data-scroll class="btn btn-primary btn-lg">Youtube로 듣기</a>
          </div>
        </div>
        
        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/icon/medal_2.png" alt="">
            	<h4>${songList[1].singer}</h4>
            	<h4>${songList[1].title }</h4>
            	<p class="text-muted">장르 > ${songList[1].genre }</p>
            <a href="https://www.youtube.com/results?search_query=${songList[1].title }" data-scroll class="btn btn-primary btn-lg">Youtube로 듣기</a>
          </div>
        </div>


        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/icon/medal_3.png" alt="">
            	<h4>${songList[2].singer}</h4>
            	<h4>${songList[2].title }</h4>
            	<p class="text-muted">장르 > ${songList[2].genre }</p>
            <a href="https://www.youtube.com/results?search_query=${songList[2].title }" data-scroll class="btn btn-primary btn-lg">Youtube로 듣기</a>
          </div>
        </div>
        
        
      </div>


      <div class="row">
          <div class="col-lg-12">
              <div class="comment-wrapper">
                  <div class="panel panel-info" >
                      <div class="panel-heading">
                          Comments ${commentListSize }
                      </div>
                      <div class="panel-body">
                          
                          <ul class="media-list">
                          	<c:forEach items="${commentList }" var="vo">
                              <li class="media" value = ${vo.commentId }>
                                  <div class="media-body">
                                      <strong class="text-success">${vo.userId }</strong>
                                      <p>
                                          ${vo.content }
                                          <!-- 수정 삭제 추가했어용~~~~ -->
											<c:if test="${userVo.userId eq vo.userId }">
												<a href="#" class="delete_comment" value="${vo.commentId}" >삭제</a>
											</c:if>	
													<!-- 요기까지~~~ -->
                                      </p>
                                  </div>
                              </li>
                              </c:forEach>
                          </ul>
						</div>
						<c:choose>
						<c:when test="${empty authUser }"></c:when>
						<c:otherwise>						
                          <textarea class="form-control" id = "comment_textarea" placeholder="write a comment..." rows="3"></textarea><br>
                          <button type="button"id = "comment_post" class="btn btn-info" style = "float: right">POST</button>
                          <input type="hidden" id="postNo" value="${postNo}"> 
							<input type="hidden" id="userId" value="${userVo.userId}">
                          </c:otherwise>
                          </c:choose>
                          <Br>
                        <div class="clearfix">  </div>
                          <hr>
                      
                  </div>
              </div>
      
          </div>

          



      </div>
      </div>

  </section>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/agency.min.js"></script>
</div>
</body>

</html>