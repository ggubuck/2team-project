<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title></title>
 <!-- Bootstrap 4 CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script>
 $(function(){

 });
 </script>
</head>
<body>
 <%-- ListArticleHandler로 부터 
 	 request.setAttribute("nowPage", pageNo); //현재페이지
     request.setAttribute("articlePage", articlePage); 
 
	 ArticlePage articlePage에는  
	      총 게시글수포함(getTotal()호출)
		  article목록포함(getContent()호출) 
		  int  totalPages;	//총페이지수   
		  int  startPage;	//시작페이지  
		  innt  endPage;	//끝페이지--%>
 
 <%-- articlePage : ${articlePage} --%>
 <p><hr/></p>
 <%-- 비로그인시 --%>
 <c:if test="${empty AUTH_USER  }">
 	<h1>로그인해주세요</h1>
 	<a href="/tlogin.do">로그인</a>
 	<a href="/tjoin.do">회원가입</a>
 </c:if>
 
 
 <%-- (user)로그인을 했을 경우 보여지는 부분 시작 --%>
 <c:if test="${!empty AUTH_USER  and  AUTH_USER.id!='adminid'}"> 
 <div class="container"><!-- page title -->
	<h2  class="mt-5 mb-4">listArticle(p653)</h2>
 	
 	<!-- Board List table -->
 	<div>총 게시글수 : ${articlePage.total}건 / 현재페이지 : ${nowPage}</div>
 	<table class="table table-hover">
 	 <thead  class="thead-light">
 	  <tr>
 	  	<th scope="col">번호no</th>
 	  	<th scope="col">제목title</th>
 	  	<th scope="col">작성자writer_name</th>
 	  	<th scope="col">조회수read_cnt</th>
 	  </tr>
 	 </thead>
 	 <tbody> <%-- 총게시글(수가 0이면)없으면  true리턴, 그렇지 않으면 false --%>
 	  <c:if test="${articlePage.hasNoArticles()}"> 
 	  <tr>
 	  	<td colspan="4">게시글이 존재하지 않습니다. 첫번째 작성자가 되세요~</td>
 	  </tr>
 	  </c:if>
 	 
 	  <%-- <c:forEach>반복문이용 1페이지당 출력할 게시글수 만큼 반복 출력 시작 
 	  <c:forEach var="변수명"  items="배열명 또는 컬렉션" >--%>
 	  <c:forEach var="article"  items="${articlePage.content}" >
 	  <tr>
 	  	<td>${article.number}</td>
 	  	<%-- read.do?no=상세하게보고싶은글번호&pageNo=현재페이지"  --%>
 	  	<td><a href="read.do?no=${article.number}&pageNo=${nowPage}">${article.title}</a></td>
 	  	<td>${article.writer.name}/${article.writer.id}</td>
 	  	<td>${article.readCount}</td>
 	  </tr>
 	  </c:forEach> <%-- 내용출력 끝 --%>
 	 </tbody>
 	</table>
 	<div>
 	  <a href="write1.do" class="btn btn-outline-dark btn-sm">글 쓰기(p653 12라인)</a>
 	</div>
 	<br/>
 	
 	<%--paganation 출력부분 --------------------------------------------   --%>
 	<!-- nav요소를 이용하여 paganation을 감싼다 -->
 	<nav aria-label="Page navigation"> <!--  justify-content-center클래스는 가운데정렬  -->
	 <ul class="pagination justify-content-center" style="margin:0 0">
	  <%--<c:if>이용하여 노출여부가 달라진다 --%>
 	  <c:if test="${articlePage.startPage>5}">
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage-5}">&lt;&lt;prev</a></li>
	  </c:if> 
	  
	  <%--p653 43라인 <c:forEach></c:forEach>반복문이용 --%>
	  <c:forEach var="pNo"  begin="${articlePage.startPage}" 
						    end="${articlePage.endPage}"  step="1">
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo}">${pNo}</a></li>
	  </c:forEach>
	   
	  <%--<c:if>이용하여 노출여부가 달라진다 --%>
	  <c:if test="${articlePage.endPage< articlePage.totalPages}"> 
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage+5}">next&gt;&gt;</a></li>
	  </c:if> 
	 </ul> 	
    </nav>
 </div>	
 </c:if>
 
 
 <%-- (관리자)로그인을 했을 경우 보여지는 부분 시작 --%>
 <c:if test="${!empty AUTH_USER  and  AUTH_USER.id=='adminid'}"> 
 <div class="container"><!-- page title -->
	<h2  class="mt-5 mb-4">listArticle(p653)</h2>
 	
 	<!-- Board List table -->
 	<div>총 게시글수 : ${articlePage.total}건 / 현재페이지 : ${nowPage}</div>
 	<table class="table table-hover">
 	 <thead  class="thead-light">
 	  <tr>
 	  	<th scope="col">번호no</th>
 	  	<th scope="col">제목title</th>
 	  	<th scope="col">작성자writer_name</th>
 	  	<th scope="col">조회수read_cnt</th>
 	  </tr>
 	 </thead>
 	 <tbody> <%-- 총게시글(수가 0이면)없으면  true리턴, 그렇지 않으면 false --%>
 	  <c:if test="${articlePage.hasNoArticles()}"> 
 	  <tr>
 	  	<td colspan="4">게시글이 존재하지 않습니다. 첫번째 작성자가 되세요~</td>
 	  </tr>
 	  </c:if>
 	 
 	  <%-- <c:forEach>반복문이용 1페이지당 출력할 게시글수 만큼 반복 출력 시작 
 	  <c:forEach var="변수명"  items="배열명 또는 컬렉션" >--%>
 	  <c:forEach var="article"  items="${articlePage.content}" >
 	  <tr>
 	  	<td>${article.number}</td>
 	  	<%-- read.do?no=상세하게보고싶은글번호&pageNo=현재페이지"  --%>
 	  	<td><a href="read.do?no=${article.number}&pageNo=${nowPage}">${article.title}</a></td>
 	  	<td>${article.writer.name}/${article.writer.id}</td>
 	  	<td>${article.readCount}</td>
 	  </tr>
 	  </c:forEach> <%-- 내용출력 끝 --%>
 	 </tbody>
 	</table>
 	<div>
 	  <a href="write1.do" class="btn btn-outline-dark btn-sm">글 쓰기</a>
 	  <a href="write1.do" class="btn btn-outline-dark btn-sm">글 삭제</a>
 	</div>
 	<form id="search" action="/tjoin.do" >
	 	<div>
	 		<label for="searchcontent"></label>
	 		<input type="text" name="searchcontent" id="searchcontent" placeholder="검색어입력" />
	 		<input type="submit" value="검색"/>
	 	</div>
 	</form>
 	<br/>
 	
 	<%--paganation 출력부분 --------------------------------------------   --%>
 	<!-- nav요소를 이용하여 paganation을 감싼다 -->
 	<nav aria-label="Page navigation"> <!--  justify-content-center클래스는 가운데정렬  -->
	 <ul class="pagination justify-content-center" style="margin:0 0">
	  <%--<c:if>이용하여 노출여부가 달라진다 --%>
 	  <c:if test="${articlePage.startPage>5}">
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage-5}">&lt;&lt;prev</a></li>
	  </c:if> 
	  
	  <%--p653 43라인 <c:forEach></c:forEach>반복문이용 --%>
	  <c:forEach var="pNo"  begin="${articlePage.startPage}" 
						    end="${articlePage.endPage}"  step="1">
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo}">${pNo}</a></li>
	  </c:forEach>
	   
	  <%--<c:if>이용하여 노출여부가 달라진다 --%>
	  <c:if test="${articlePage.endPage< articlePage.totalPages}"> 
	   <li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage+5}">next&gt;&gt;</a></li>
	  </c:if> 
	 </ul> 	
    </nav>
 </div>	
</c:if>
 
<!-- Bootstrap 4 JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXakfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz4fnFO9gybBvRLFyyN+kW/BQro3T8j6XI4lK7T7rM46_tC6Y1Bf/Dbdbp"
        crossorigin="anonymous"></script>
<script="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP8zjCGMXP5R6nX6KZQJcdTd/ftMf6nH16Pz9JvqBabTTLNZQbVfaGnt"
        crossorigin="anonymous"></script>
         
 
</body>
</html>
 <%-- 	
 	<c:if>이용하여 노출여부가 달라진다
 	<c:if test="${articlePage.startPage>5}">
		<a href="list.do?pageNo=${articlePage.startPage-5}">&lt;&lt;prev</a>
	</c:if>
	p653 43라인 <c:forEach></c:forEach>반복문이용
	<c:forEach var="pNo"  begin="${articlePage.startPage}" 
						end="${articlePage.endPage}"  step="1">
		 <a href="list.do?pageNo=${pNo}">${pNo}</a> 
	</c:forEach>
	
	<c:if>이용하여 노출여부가 달라진다
	<c:if test="${articlePage.endPage< articlePage.totalPages}">
		<a href="list.do?pageNo=${articlePage.startPage+5}">next&gt;&gt;</a>
	</c:if> 	
 </div> --%>





























