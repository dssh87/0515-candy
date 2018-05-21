<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--
    Hielo by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />
<style>
.contentbox {
	min-height: 500px;
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}
.action{
display: inline;
}


</style>
</head>
<body class="subpage">
	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="index.html">Hielo <span>by TEMPLATED</span></a>
		</div>
		<a href="#menu">Menu</a>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
	</nav>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Sed amet nulla</p>
				<h2>Candy</h2>
			</header>
		</div>
	</section>
	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<div class="table-wrapper">
					<h3>Modify</h3>
					<table class="alt">
						<thead>
							<tr>
								<th>${view.bno}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<strong><input type="text" value="${view.title }"></strong>
							</tr>
							<tr>
								<td style="border-right: hidden; border-left: hidden;">${view.writer }</td>
								<td width=50% style="text-align: right; border-right: hidden;">
									<fmt:formatDate value="${view.regdate}"
										pattern="yyyy-MM-dd hh:mm" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="contentbox">${view.content}</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
								
									<ul class="actions" style="float: left;">
									<div style = "float: left">
									<form>
									<li><button type="submit" class="modify">Modify</button></li>
									</form>
									</div>
									<div style = "float: left; padding: 0 10px">
									<form method="post" action="/board/remove">							
									 	<input type="hidden" name="bno" value="${view.bno}">
									 	<input type="hidden" name="makeUri" value="${pm.makeURL(cri.page)}">
										<li><button type="submit" class="remove">remove</button></li>
									</form>
									</div>
									</ul>
								
								
									<ul class="actions" style="float: right;">									
											<li><button id="goList">goList</button></li>
										
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
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
	
	  
	$("#goList").on("click",function(e){
		console.log("click.............");
		
		alert("go List");
		/* 
		var pageNo = <c:out value="${cri.page}"/>;
		var typeStr = '<c:out value="${cri.type}"/>';
		var keywordStr = '<c:out value="${cri.keyword}"/>';
		
		var linkList = "page="+pageNo
		var linkStr = "page="+pageNo+"&type="+typeStr+"&keyword="+encodeURIComponent(keywordStr);
		
		console.log("-----------------------------");
		console.log(linkStr);
		 */
		
		self.location='${cri.getLink("/board/list")}';	
		
	});
	
	
	

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