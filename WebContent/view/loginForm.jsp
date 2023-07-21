<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myCss.css">
</head>
<body>
 <h2>loginForm.jsp</h2>
 <pre>	 
     jsp만의 주소는 http://localhost/view/loginForm.jsp이지만
     http://localhost/login.do요청에 의해서 강제로 보여지게 되는 view이다
 </pre>    
 <div class="container">
  <h2>Login</h2>
  <form id="loginForm" action="tlogin.do" method="post"> 
 	<div>
	 	<label for="memberid">ID</label>
	 	<!-- 교재에서는 <input type="text" name="id"/>  -->
	 	<input type="text" name="memberid" id="memberid" class="" />
	 	<c:if test="${errors.id}" ><span class="error">ID를 입력하세요</span></c:if>
 	</div>
 	<div>
	 	<label for="password">비밀번호</label>
	 	<input type="password" name="password" id="password" class="" /><br/>
	 	<c:if test="${errors.password}" ><span class="error">비밀번호를 입력하세요</span></c:if>
	 	<c:if test="${errors.idOrPwNotMatch}" ><span class="error">아이디 혹은 비밀번호가 일치하지 않습니다.</span></c:if>
 	</div>
 	<div>
	 	<input  type="submit" value="로그인(java용)" class=""/>
	 	<input  type="reset"  value="취소" class=""/>
	</div> 	
  </form>		
 </div>
</body>
</html>





