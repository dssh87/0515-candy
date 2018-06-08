<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<style>
#three{
	border-radius: 3%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);

}

#wall img{
	position:fixed;
	margin-left:15%;
	z-index: 100;
	width: 70%;
	height: 50%; 
	left: 10px;
	top: 200px;
}

#wall .sumname{
	position:fixed;
	margin-left:15%;
	z-index: 200;
	width: 70%;
	height: 50%; 
	left: 10px;
	top: 200px;
	color: white;	
	text-shadow: 0 0 2px black;
}

.allpic {
	display: inline-block;
}

.allpic li{
	list-style: none;
	width: 19%;
	text-align: center;
	float:left;
	margin-left: 10px;
	
}

.allpic li img{
	width: 200px;
	height: 200px;
	border-radius: 20%;
}

.pageNation{
	display: block;
	text-align: center;
	
}
.pageNation li {
	display: inline-block;
}

.pageNation a {
	color: black;
	float: left;
	padding: 8px 5px;
	text-decoration: none;
}

.pageNation .active {
	background-color: pink;
	color: white;
}

.pageNation :hover :not(.active){
	background-color:pink;
}


.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}	

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outbtn{
display:inline-block;
text-align: center;
}

#uploadForm{
float: left;
}
	
</style>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=2" />
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
			<li><a href="/board/index">Home</a></li>
			<li><a href="/board/generic">Generic</a></li>
			<li><a href="/board/elements">Elements</a></li>
			<li><a href="/board/list">list</a></li>
			<li><a href="/gallery/glist">gallery</a></li>
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
	<div id="main">
	<div class="container">
		
	<section id="three" class="wrapper style2">	
	
			<header class="align-center">
			
			<div id= 'wall'></div>
			</header>

			<div class="allpic">
			</div>
			
			<div class="pageNation"></div>

		<center>	<div class='outbtn'>			
			<form id="uploadForm" style="margin-bottom: 5px;">
				<input type='file' id='upload' multiple>
			</form>
				<button id='btn'>upload</button>			
			</div>
	</center>

	</section>
	</div></div>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
	$(document).ready(function () {
		var allpic = $(".allpic");
		var uploadInput = $("#upload");
		console.log("uploadInput...." , uploadInput[0].files);
		var wall = $("#wall");
		var pageNation = $(".pageNation");
		var repage = 1;		
		
		function getPageList(page) {
	        var page = page || 1;
	        
	        
	        $.getJSON("/gallery/glist/"+page+".json", function (data) {
	      	  
	            var str = "";

	            $(data.list).each(function (idx, data) {

	            	str += "<li data-file='"+data.fullName+"'>"+"<img src=/gallery/display?file=s_" + data.fullName+
	            			"><br>"+data.fullName.split('_')[1]+"<strong data-gno='"+data.gno+"'>x</strong></li>";
	            });
	                        
	            console.log("str",str);
	            
	            allpic.html(str);
	            
	            printPaging(data.pm);
	        });
	    }
	    
	    
	    function printPaging(pm){
	        console.log("pm이다1111",pm);

	        var str = "";

	        if(pm.prev){
	            str += "<li><a href="+(pm.start-1)+"> << </a></li>";
	        }

	        for(var i = pm.start, len = pm.end; i <=len; i++) {
	            var strClass = pm.cri.page == i ? "class = active" : "";
	            str+="<li "+strClass+"><a href="+i+">"+i+"</a></li>";
	        }

	         if(pm.next){
	            str += "<li><a href="+(pm.end + 1)+"> >> </a></li>";
	        }
	        pageNation.html(str);
	    }   
	    
	    
	    function remove(gno) {

	        $.ajax({
	            type:'delete',
	            url:"/gallery/"+gno,
	            headers: {
	                "Content-type": "application/json",
	                "X-HTTP-Method-Override": "DELETE"
	            },
	            dataType:"text",
	            success:function(result){
	                console.log("result: ",result);
	                
	                getPageList(repage);
	            }
	        });
	    }
	    
	    function getOriginalName(file){
	    	
	    	var idx = file.indexOf("_") + 1;
	    	return file.substr(idx);
	    }	   
	    

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
			url: 'glist', 
			data: formData, 
			processData: false, 
			contentType: false, 
			type: 'POST', 
			success: function(data){ 
				console.log("return data : ", data); 
				if(data[0]=="fail"){
					alert("등록이 실패하였습니다."); 
				}
				if(data[1]=="success"){
					alert("등록이 성공하였습니다."); 
				}
				
				getPageList(1);
				
				$("#uploadForm")[0].reset();			
			}
		});		
	
	});
	
	$(".allpic").on("click", "li", function(e){
		
		console.log("pic clicked");
		//$(this).attr("data-file")
		var fileName = $(this).data("file");
		var originName = $(this).data("file").split('_')[1];		
		
		var str = "<div><img src=/gallery/display?file="+fileName+"></div><div class='sumname'>"+originName+"</div>";
		
		wall.html(str);
		wall.show();
		
	});
	
		wall.on("click", function(e){        
        wall.hide();        
    });
	

    
    $(".allpic").on("click","strong", function(e){
    	console.log("remove...");   	
    	
    	e.stopPropagation();
    	var gno = $(this).attr("data-gno");
    	remove(gno);
    });    
    
    $(".pageNation").on("click","li a",function (e) {

		console.log("클릭")
        e.preventDefault();

        repage = $(this).attr("href");
        console.log(repage);
        
        getPageList(repage);

    });
    
    getPageList(1);

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