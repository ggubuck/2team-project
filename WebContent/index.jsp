<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
$(document).ready(function(){
	//<button type="button" id="LogoutBtn">로그아웃</button>
	$("#LogoutBtn").on("click",function(){
		//js의 location객체의 href속성의 값을 가져오기=>window의 현재url을 리턴 
		//location.href; 
		
		//js의 location객체의 href속성의 값을 설정하기=>window의 현재url을 변경 
		//location.href="설정값";
		location.href="http://localhost/logout.do";
	});

	
});
</script>
</head>
<body>
<%= request.getContextPath()  %>
 <h1>환영합니다.</h1>

 
  <a href="/article/list.do">게시판보기</a>
 <%-- 비로그인시 보여지는 부분 시작 --%>
 <c:if test="${empty AUTH_USER}">
  <a href="tjoin.do">회원가입</a>
  <a href="tlogin.do">로그인</a>
  <br/><br/><br/>
 </c:if> 
 <%-- 비로그인시 보여지는 부분 끝 --%>
 
 
 
 <%-- (user)로그인을 했을 경우 보여지는 부분 시작 --%>
 <c:if test="${!empty AUTH_USER  and  AUTH_USER.id!='adminid'}"> 
    <span id="i1">${AUTH_USER.name} 님</span> 
 	<button type="button" id="LogoutBtn">(버튼)로그아웃</button>
 	<a href="logout.do">(a요소)로그아웃</a>
 	
 	<a href="changePwd.do">비번변경</a>
 	<a href="#">내 정보</a>
 	<a href="/article/write.do">글쓰기</a>
 	<br/><br/><br/>
</c:if>
<%-- 로그인을 했을 경우 보여지는 부분 끝 --%>

<%-- (관리자)로그인을 했을 경우 보여지는 부분 시작 --%>
 <c:if test="${!empty AUTH_USER  and  AUTH_USER.id=='adminid'}"> 
    <span id="i1">${AUTH_USER.name} 님</span> 
 	<button type="button" id="LogoutBtn">(버튼)로그아웃</button><br/>
 	<a href="changePwd.do">비번변경</a><br/>
 	<a href="#">공지사항관리</a><br/>
 	<a href="#">공지사항입력</a><br/>
 	<a href="#">회원관리</a><br/>
 	<br/><br/><br/>
</c:if>
<%-- 로그인을 했을 경우 보여지는 부분 끝 --%>
</body>
</html>








