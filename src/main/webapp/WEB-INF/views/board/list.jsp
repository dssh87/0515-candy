<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
.outer {
	padding: 10%;
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
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: pink;
	color: white;
}

.pagination
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
pink
;


}
.search {
	width: 33%;
	margin-left: 33%;
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
			<li><a href="index">Home</a></li>
			<li><a href="generic">Generic</a></li>
			<li><a href="elements">Elements</a></li>
		</ul>
	</nav>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Sed amet nulla</p>
				<h2>Elements</h2>
			</header>
		</div>
	</section>
	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<!-- Table -->
			<h3>Table</h3>
			<div class="table-wrapper">
				<table>
					<thead>
						<th>Bno</th>
						<th>Title</th>
						<th>Writer</th>
						<th>Regdate</th>
						<th>Updatedate</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${list}">
							<tr class="odd gradeX">
								<td><c:out value="${vo.bno}" /></td>
								<td class="target" data-bno="${vo.bno }"><c:out
										value="${vo.title}" /></td>
								<td><c:out value="${vo.writer}" /></td>
								<td><c:out value="${vo.regdate}" /></td>
								<td><c:out value="${vo.updatedate}" /></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
			<div class="center">
				<ul class="pagination">



					<c:if test="${pageMaker.prev}">
						<li><a href="list?page=${pageMaker.start-10}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
						var="page">
						<li class="${page==pageMaker.page?'active':''}"><a
							href="list?page=${page}">${page}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a href="list?page=${pageMaker.start+10}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</div>
			<div class="search">
				<form method="post" action="#">
					<div style="float: left; width: 70%">
						<input type="text" name="query" id="query" value=""
							placeholder="Query" />
					</div>
					<div style="float: left; width: 30%">
						<input type="submit" value="Search" />
					</div>
				</form>
			</div>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
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
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="/resources/assets/js/skel.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>