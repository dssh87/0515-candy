<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=2" />

<style>


.search1 {
	text-align: center;
}

.outer {
	padding: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 5px;
	text-decoration: none;
}

.pagination a.active {
	background-color: pink;
	color: white;
}

.pagination a :hover :not(.active){
background-color:pink;
}

.search {
	width: 33%;
	margin-left: 33%;
}

.box {
	display: block;
	background-color: transparent;
	overflow: hidden;
	padding-right: 50px;
	white-space: nowrap;
	margin-bottom: 0;
	cursor: pointer;
}

.title {
	display: inline-block;
	overflow: hidden;
	max-width: 100%;
	text-decoration: none;
	text-overflow: ellipsis;
	vertical-align: middle;
}

.ico {
	display: inline-block;
	vertical-align: middle;
}
#selectbox{
    display: block;
    width:100%;

}



</style>
</head>
<body class="subpage">
	<!--  -->
	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="index">Hielo <span>by TEMPLATED</span></a>
		</div>
		<a href="#menu">Menu</a>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index">Home</a></li>
			<li><a href="generic">Generic</a></li>
			<li><a href="elements">Elements</a></li>
			<li><a href="list">list</a></li>
		</ul>
	</nav>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>delicious almond</p>
				<h2>Board List</h2>
			</header>
		</div>
	</section>
	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<!-- Table -->
			<h3>Almond List</h3>
			<div class="table-wrapper">
				<table style="table-layout: fixed;">
					<colgroup>
						<col style="width: 20%;" />
						<col style="width: 40%;" />
						<col style="width: 20%;" />
						<col style="width: 20%;" />

					</colgroup>

					<thead>
						<th>Bno</th>
						<th>Title</th>
						<th>Writer</th>
						<th style="text-align: right;">Regdate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo">
							<tr >
								<td><c:out value="${vo.bno}" /></td>


								<td class="box" data-bno='${vo.bno}' ><span class="title"> <c:out
											value="${vo.title}"  />
								</span> <span class="ico"> <c:if test="${vo.checkNew()}">
											<img src="/resources/images/new.gif">
										</c:if>
								</span>
									</div></td>
								<td><c:out value="${vo.writer}" /></td>
								<td style="text-align: right"><c:if test="${vo.checkNew()}">
										<fmt:formatDate value="${vo.regdate}" pattern="HH:mm:ss" />
									</c:if> <c:if test="${!vo.checkNew()}">
										<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" />
									</c:if></td>
							</tr>
						</c:forEach>
					</tfoot>
				</table>
			</div>
			<div class="center">
				<div class="pagination">
					<c:if test="${pm.prev}">
						<a href="/board/list?${pm.makeURL(pm.start-1)}"><<</a>
					</c:if>
					<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
						<a href="/board/list?${pm.makeURL(idx)}"
							class="<c:if test="${pm.cri.page==idx}">active</c:if>">${idx}</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="/board/list?${pm.makeURL(pm.end+1)}">>></a>
					</c:if>
				</div>
			</div>
			<div class="btn">

				<div class="row uniform" id="selectbox">
						<div class="3u 12u$(small)">
							<div class="select-wrapper">
								<select name="type" id="type"> 
									<option value="">- Category -</option>
									<option value="t"
										<c:out value="${cri.type eq 't'?'selected':''}"/>>title</option>
									<option value="c"
										<c:out value="${cri.type eq 'c'?'selected':''}"/>>content</option>
									<option value="w"
										<c:out value="${cri.type eq 'w'?'selected':''}"/>>writer</option>
									<option value="tc"
										<c:out value="${cri.type eq 'tc'?'selected':''}"/>>title+content</option>
									<option value="tcw"
										<c:out value="${cri.type eq 'tcw'?'selected':''}"/>>title+content+writer</option>
								</select>
							</div>
						</div>
						<div class="kbtn">
							<div class="12u 12u$(small)">

								<input type="text" name="keyword" id="query"
									placeholder="input your message"
									value=<c:out value="${cri.keyword }"/>>

							</div>
						</div>
						<div class="sbtn">
							<div class="12u 12u$(small)">
								<button id="search"  value="Search"  class="button.fit">Search</button>
						</div>
						</div>
				
					<div class="rbtn">
							<div class="12u 12u$(small)">
						<button id="register">Register</a></button>
							</div>

					</div>

				</div>
			</div>
		</div>
		</div>
	
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
  <script>
  $(document).ready(function () {
	$("#search").on("click",function(e){
		console.log("click.............");
	var type = $("select option:selected").val();
	var keyword = encodeURIComponent($('#query').val());
	
	if(type != null && type != "" && keyword != null && keyword != ""){
	self.location="/board/list"+'${pm.makeQuery(1)}'+"&type="+type+	"&keyword="+keyword;
	}
	});
});
  
  $(".box").on("click",function(e){
	  console.log("클릭~~~~~~~~~~~~~~");
	 var bno =$(this).attr("data-bno");
	 var page = "${cri.page}" ;
	 self.location="/board/view?bno=" +bno+"&${pm.makeURL(cri.page)}";
  });
  
  $("#register").on("click", function(e){
	  console.log("click...");
	 self.location="/board/register?${pm.makeURL(cri.page)}";
  });
  
  $(document).ready(function () {
	   var msg = '<c:out value="${msg}"/>';
		
		if(msg=="success" && !history.state){
			alert("등록이 완료되었습니다."); 
		}
		if(msg=="fail" && !history.state){
			alert("등록이 실패하였습니다."); 
		}
		if(msg=="remove" && !history.state){
			alert("삭제가 완료되었습니다.")
		}

		if(msg=="modify" && !history.state){
			alert("수정이 완료되었습니다.")
		}

		history.replaceState({}, null, null);				
	});
  
  </script>

	
	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</footer>
	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>