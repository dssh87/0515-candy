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
	min-height: 200px;
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
.reply{
float: right;
}
li{
list-style: none;
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

 #modalLayer{
        display:inline-block;
        position:relative;
}
#modalLayer .modalContent{
        width:60%;
        height:200px;
        padding:20px;
        border:1px solid #ccc;
        position:fixed;
        left:20%;
        top:50%;
        z-index:11;
		background-color: #ffffff;
		background-color: rgba(255, 255, 255, 1);
    }
#modalLayer .modalContent button{
        position:relative;
        right:0;
        top:0;
        cursor:pointer;
}

.modify{
float: left;
}
.remove{
float: left;
}

.mmodify{
width:31.3%;
margin: 10px 0 0 0 

}
.mremove{
width:31.3%
 
}
.mclose{
width:31.3%

}

.tmright{
float: right;
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
					<h3>View</h3>
					<table class="alt">
						<thead>
							<tr>
								<th>${view.bno}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><strong>${view.title }</strong></td>
							</tr>
							<tr>
								<td style="border-right: hidden; border-left: hidden;">${view.writer }</td>
					<td width=50% style="text-align: right; border-right: hidden;">
			
					regdate <fmt:formatDate  value="${view.regdate}"	pattern="yyyy-MM-dd hh:mm"/><br>
					update <fmt:formatDate value="${view.updatedate}"	pattern="yyyy-MM-dd hh:mm" />
					
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
									<form action="/board/modify">
									<input type="hidden" name="bno" value="${view.bno}">
									<input type="hidden" name="type" value="${cri.type}">
									<input type="hidden" name="keyword" value="${cri.keyword}">
									<input type="hidden" name="page" value="${cri.page}">
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

									</ul>
								
									<ul class="actions" style="float: right;">																		
											<li><button id="back">back</button></li>										
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>					
				</div>
				
	<!-- reply -->			
				<h3>Reply</h3>
				<table class="alt">							
						<thead>
							<tr class="contentbox">
								<th><input type="text" id="rcontent" placeholder="내용을 입력하세요" ></th>
							</tr>
							<tr>
								<th><input type="text" id="replyer" placeholder="작성자"></th>
								</tr>
								<tr>						
						        <th><button type="submit" class="reply" >댓글 등록</button></th>
						        </tr>
						</thead>						
						</table>						
			<div class="table-wrapper">
				<table style="table-layout: fixed;">
					<colgroup>
						<col style="width: 20%;" />
						<col style="width: 40%;" />
						<col style="width: 20%;" />
						<col style="width: 20%;" />
					</colgroup>
					<thead>
					<tr>						
						<div class="listDiv"></div>
						</tr>
					</thead>											
				</table>
				
			</div>			
				<div class="pageNation"></div>
	<!-- modalLayer --> 		
			<div id="modalLayer">
    <div class="modalContent" >
        <input type="text" id="mrcontent">
        <input type="text" id="mreplyer" >
        <div class="mbtn">
        <button class="mmodify" data-rno="data.rno" >완료</button>
        <button class="mremove" data-rno="data.rno">삭제</button>
        <button class="mclose">닫기</button>
        </div>
    </div>
</div>			
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
	  
	$("#back").on("click",function(e){
		console.log("click.............");
		
		alert("이전 페이지로 이동합니다.");
				
		self.location='${cri.getLink("/board/list")}';			
	});	
});
  /* function */
  
  
  $(document).ready(function () {

	  var bno = ${view.bno};
      var listDiv = $(".listDiv");
      var inputReplyer = $("#replyer");
      var inputRcontent = $("#rcontent");
      var inputMrcontent = $("#mrcontent");
      var inputMreplyer = $("#mreplyer");
      var pageNation = $(".pageNation");

      var reply = $(".reply");      
      var repage = 1;

      function getPageList(bno, page) {
          var page = page || 1;
          var bno = bno || 1;
          
          $.getJSON("/reply/"+bno+"/"+page+".json", function (data) {
        	  console.log(data.length);
        	  console.log(data);
        	  console.dir(data);
              var str = "";

              $(data.list).each(function (idx,data) {

                  str += "<li data-rno="+data.rno+">"+

                      "<div>"+"<th>"+data.rcontent+"</th>"+"<th>"+data.replyer+"</th>"+
						"<th>"+displayTime(data.regdate)+"</th>"+"<button type='button' class='modalLink' data-rno="+data.rno+"> 수정</button></tr></div></li>";

                      "<div>"+"<tr><th><strong>"+data.replyer+"</strong></th><br>"+"<th>"+data.rcontent+"</th>"+
						"<div class='tmright'><th>"+displayTime(data.regdate)+"</th>"+"<button type='button' class='modalLink' data-rno="+data.rno+"> 수정</button></div></tr><hr></div></li>";
                  

              });
              
              listDiv.html(str);
              
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
      
	function register(data){

        var data = {bno:bno, rcontent: inputRcontent.val(), replyer: inputReplyer.val()};

        $.ajax({
            type: "post",
            url: "/reply/new" ,
            headers:{
                "Content-type":"application/json",
                "X-HTTP-Method-Override": "post"
            },
            dataType:"text",
            data:JSON.stringify(data),
            success: function (result) {
                console.log("result............"+result);
                if(result == "SUCCESS"){
                	alert("등록완료")
                }else{
                	alert("등록실패")
                }
                inputRcontent.val("");
                inputReplyer.val("");

                getPageList(bno, 1);

            }
        });
    }	
	
	function view(rno){

        $.getJSON("/reply/"+rno+".json" , function(data){
        	inputMrcontent.val(data.rcontent);
            inputMreplyer.val(data.replyer);
            $(".mremove").attr("data-rno", rno);
            $(".mmodify").attr("data-rno", rno);
            }
        );
    }

    function remove(rno) {

        $.ajax({
            type:'delete',
            url:"/reply/"+rno,
            headers: {
                "Content-type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType:"text",
            success:function(result){
                console.log("result: ",result);
                
                $(".modalContent").hide();
                getPageList(bno, 1);
            }
        });
    }

    function modify(rno){

        var rno = $(".mmodify").attr("data-rno");
        var data = {bno:bno, rcontent: inputMrcontent.val(), replyer: inputMreplyer.val()};

        $.ajax({
            type:'put',
            url:"/reply/"+rno,
            headers: {
                "Content-type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            dataType:"text",
            data:JSON.stringify(data),
            success:function(result){
                console.log("result: " + result);
                if(result == "success"){
                	alert("수정완료")
                }else{
                	alert("수정실패")
                }
                getPageList(bno, 1);
            }
        });
    }
    

    
	  

    function displayTime(timeValue) {

		  
		   var today = new Date();	  
		   
		   var gap = today.getTime() - timeValue;
		   
		   var dateObj = new Date(timeValue);
		   var str = "";
		   
		   if(gap < (1000*60*60*24)){
		     
		     var hh = dateObj.getHours();
		     var mi = dateObj.getMinutes();
		     var ss = dateObj.getSeconds();
		     
		     return [(hh>9 ? '' : '0') + hh, ':',
		             (mi>9 ? '' : '0') + mi, ':',
		             (ss>9 ? '' : '0') + ss
		             ].join('');
		     
		   }else {
		     var yy = dateObj.getFullYear();
		     var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		     var dd = dateObj.getDate();
		     
		     return [yy ,'/',
		           (mm>9 ? '' : '0') + mm, '/',
		           (dd>9 ? '' : '0') + dd
		          ].join('');
		   }
		 };
    
	/* event */
    
	$(".reply").on("click",function () {
				
        	register();
		
    });
	
	
	getPageList(bno, 1);
	
	$(".pageNation").on("click","li a",function (e) {

		console.log("클릭")
        e.preventDefault();

        repage = $(this).attr("href");
        console.log(repage);
        console.log(bno);
        getPageList(bno, repage);

    });
	
	$(".modalContent").hide();
	
	listDiv.on("click", "button", function(data){
		console.log("클릭...");
		var rno = $(this).attr("data-rno");
        
        view(rno);
		 
		$(".modalContent").show();
		
	});
	$(".modalContent").on("click", ".mclose", function(e){
		$(".modalContent").hide();		
	});	

    $(".modalContent").on("click", ".mremove", function (e) {

        var rno = $(this).attr("data-rno");
        
        console.log(this);
        console.log(rno);
        if(confirm("remove:" + rno)){
            remove(rno);
        }
    });
   
    /* modal */
    
    $(document).ready(function(){
        var modalLayer = $("#modalLayer");
        var modalLink = $(".modalLink");
        var modalCont = $(".modalContent");
        var marginLeft = modalCont.outerWidth()/2;
        var marginTop = modalCont.outerHeight()/2;
        

        $(".listDiv").on("click", ".modalLink", function(e){
            modalLayer.fadeIn("slow");
            modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
            $(this).blur();
            $(".modalContent > a").focus();
            return false;
        });

        $(".modalContent").on("click",".mclose",function(){
            modalLayer.fadeOut("slow");
            modalLink.focus();
        });

        $(".modalContent").on("click",".mmodify",function(){
            var rno = $(this).attr("data-rno");
            modalLayer.fadeOut("slow");

            modify(rno);
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