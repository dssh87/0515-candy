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
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
.search1{
text-align:center;
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

.pagination a:hover:not (
.active ){
	background-color: pink;
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
	margin-bottom:0;
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

.qbtn{
width: 100%;

left: 35%;


}
.sbtn{
width: 25%;
position: relative;
 float: left; 

}

.rbtn{
width: 25%;
position:relative;

float: left; 


}
.select-wrapper{
width: 15%;
position:absolute;
float: left; 

}

</style>
</head>
<body class="subpage">
	<!--  -->
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
							<tr>
								<td><c:out value="${vo.bno}" /></td>


								<td class="box">
										<span class="title"> <c:out value="${vo.title}" />
										</span> <span class="ico"> <c:if test="${vo.newIcon==1}">
												<img src="/resources/images/new.gif">
											</c:if>
										</span>
									</div>

								</td>
								<td><c:out value="${vo.writer}" /></td>
								<td style="text-align: right"><c:if test="${vo.newIcon==1}">
										<fmt:formatDate value="${vo.regdate}" pattern="HH:mm:ss" />
									</c:if> <c:if test="${vo.newIcon!=1}">
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
						<a href="/board/list?page=${pm.start-1}"><<</a>
					</c:if>
					<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
						<a href="/board/list?page=${idx}"
							class="<c:if test="${pm.cri.page==idx}">active</c:if>">${idx}</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="/board/list?page=${pm.end+1}">>></a>
					</c:if>
				</div>
			</div>
			<div class="search1">
			
			<div class="row uniform"  >
			
			
					<div class="3u 12u$(small)">
						<div class="select-wrapper">
							<select name="category" id="category">
							<	<option value="">- Category -</option>
								<option value="1">title</option>
								<option value="1">content</option>
								<option value="1">writer</option>
								<option value="1">title+content</option>
								<option value="1">title+content+writer</option>
							</select>
						</div>
					</div>
					<div class="3u 12u$(small)">
					<div class="qbtn">
						<input type="text" name="query" id="query" value=""
							placeholder="Query" />
							</div>
					</div>
					<div>
					<form  method="post" action="#" >
					
					<div class="3u$ 12u$(small)">
						<input type="submit" value="Search"  />
					
					</div>
					</form>
					</div>
					<div class="rbtn">
		<form  method="post" action="#" >
					
				<a href="register" class="button">Register</a>
			
			</form>
			</div>
				</div>
			</div>
			</div>
			
			<!-- <!-- Break -->
			<!-- <div class="search">
                <div class="6u 12u$(xsmall)">
                    <div class="select-wrapper">
                        <select name="category" id="category">
                            <option value="">- Category -</option>
                            <option value="1">Manufacturing</option>
                            <option value="1">Shipping</option>
                            <option value="1">Administration</option>
                            <option value="1">Human Resources</option>
                        </select>
                    </div>
                </div>
                <div class="6u 12u$(xsmall)">
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
            </div> -->
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