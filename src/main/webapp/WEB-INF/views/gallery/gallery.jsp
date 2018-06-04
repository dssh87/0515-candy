<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<style>
.allpic {
	display: inline-block;
}

li {
	list-style: none;
	width: 18%;
	text-align: center;
	float: left;
	margin-right: 15px;
}

li img {
	max-width: 100%;
	height: auto;
}
</style>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />
</head>
<body>

	<!-- Header -->
	<header id="header" class="alt">
		<div class="logo">
			<a href="/index">Hielo <span>by TEMPLATED</span></a>
		</div>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index">Home</a></li>
			<li><a href="generic">Generic</a></li>
			<li><a href="elements">Elements</a></li>
			<li><a href="list">List</a></li>
		</ul>
	</nav>


	<!-- Two -->
	<section id="two" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Poohson777 Zzang CandyJellyLove</p>
				<h2>Gallery</h2>
			</header>
		</div>
	</section>

	<!-- Three -->
	<section id="three" class="wrapper style2">
		<div class="inner">
			<header class="align-center">
				<p class="special">Poohson777 Zzang CandyJellyLove</p>
				<h2>Gallery</h2>
			<div id = 'wall'></div>
			</header>

			<div class="allpic" >
			<tbody>
						<c:forEach items="${list}" var="vo"/>
							<tr >
								<td><c:out value="${vo.bno}" /></td>
								</tr></tbody>
			
			</div>

			<form id="uploadForm" style="margin-bottom: 5px;">
				<input type='file' id='upload' multiple>
			</form>
			<div>
				<button id='btn'>upload</button>
			</div>
		</div>

	</section>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
	$(document).ready(function () {
var allpic = $(".allpic");
var uploadInput = $("#upload");
console.log("uploadInput...." , uploadInput[0].files);
var wall = $("#wall");

$('#btn').on("click", function(e){
	
	console.log("click....");
	
	var formData = new FormData();
	console.log("uploadInput222...." , uploadInput[0].files);
	console.log(uploadInput[0].files);
	
	var files = uploadInput[0].files;
	
	for(var i = 0; i < files.length; i++ ){
		
		formData.append("file", files[i]);
	}
	
	$.ajax({ 
		url: 'gallery', 
		data: formData, 
		processData: false, 
		contentType: false, 
		type: 'POST', 
		success: function(data){ 
			console.log("return data : ", data); 
			
			var str ="";
			
			for(var i = 0; i < data.length; i++){
				str += "<li data-file='"+data[i]+"'><img src='/gallery/display?file=s_" + data[i]+"'></li>";

			}
			
			allpic.append(str);
			
			$("#uploadForm")[0].reset();			
		}
	});
	
	$(".allpic").on("click", "li", function(e){
		
		console.log("pic clicked");
		//$(this).attr("data-file")
		var fileName = $(this).data("file");
		
		var str = "<img src='/gallery/display?file="+fileName+"'>";
		
		wall.html(str);
		wall.show('slow');
		
	});
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