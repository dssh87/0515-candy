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
#wall img{
	position:fixed;
	margin-left:15%;
	z-index: 100;
	width: 70%;
	height: 50%; 
	left: 10px;
	top: 200px;
}

.allpic {
	display: inline-block;
}

.allpic li{
	list-style: none;
	width: 18%;
	text-align: center;
	float: left;
	margin: 0 5px 5px 0;
}

.allpic li img{
	max-width: 100%;
	height: auto;
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
	<div class="container">
		<div class="outer">
	<section id="three" class="wrapper style2">
	
		<div class="inner">
			<header class="align-center">
			
			<div id= 'wall'></div>
			</header>

			<div class="allpic">
			</div>

			<form id="uploadForm" style="margin-bottom: 5px;">
				<input type='file' id='upload' multiple>
			</form>
			<div>
				<button id='btn'>upload</button>
			</div>
		</div>
			<div class="pageNation"></div>

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
				
				getPageList(1);
				
				$("#uploadForm")[0].reset();			
			}
		});		
	
	});
	
	$(".allpic").on("click", "li", function(e){
		
		console.log("pic clicked");
		//$(this).attr("data-file")
		var fileName = $(this).data("file");
		
		var str = "<img src='/gallery/display?file="+fileName+"'>";
		
		wall.html(str);
		wall.show();
		
	});
	
		wall.on("click", function(e){
        
        wall.hide();
        
    });
	
	
	
	function getPageList(page) {
        var page = page || 1;
        
        
        $.getJSON("/gallery/glist/"+page+".json", function (data) {
      	  console.log("length",data.length);
      	  console.log("data",data);
      	  console.dir(data);
            var str = "";

            $(data.list).each(function (idx, data) {

            	str += "<li data-file='"+data.fullName+"'>"+"<img src=/gallery/display?file=s_" + data.fullName+
            			"><strong data-gno='"+data.gno+"'>x</strong></li>";
            });
                        
            console.log("str..",str)
            
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
    
    getPageList(1);
    
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
                
                getPageList(1);
            }
        });
    }
    
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