<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Bamboo write</title>

<style media="screen">
	.header {
		background: #AA9FA1;
	}
	
	.header a {
		color : #211919;
	}
</style>

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg fixed-top header">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/list">Bamboo</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.servletContext.contextPath }/list">list <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.servletContext.contextPath }/write">write</a>
					</li>
					<!-- 
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.servletContext.contextPath }/view?postNo=${postVo.postNo }">view</a>
          </li>
          
           -->
					<c:choose>
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
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>