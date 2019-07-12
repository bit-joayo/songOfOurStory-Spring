<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="<%=request.getContextPath()%>/" class="scrollto">Song of Our Story</a></h1>
       
      </div>
	 <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
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
      