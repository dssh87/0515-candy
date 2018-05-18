<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--
    Hielo by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />
<style>
.subpage{
           background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
       }
.outer{
  padding-top: 5%;
           background-color: #ffffff;
           background-color: rgba( 255, 255, 255, 0.6);
       }
.mytable {
    width: 70%;
    margin-left: auto;
    margin-right: auto;
             
}

 .special{
	background-image: url("https://pbs.twimg.com/profile_images/576241680765988864/Jelj-W41.jpeg");
	 -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
        background-size: cover;
        background-position: center;
} 

.bluebtn{
	background-image: url("/resources/images/blue.jpg");
	 -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
        background-size: cover;
        background-position: center;
} 

.special2{
	background-image: url("http://zsol.co.kr/gnu/data/file/conts_repo/1028482038_YMlFv0eg_EC8BA4EC82ACEB9DBCEB9494EC98A4EC9CA0EBA6ACEBB284ED8ABC.jpg");
	 -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
        background-size: cover;
        background-position: center;
} 

 .powerbtn {

        background-image:  url("http://cfile9.uf.tistory.com/image/25407D4958D0D1A102F329");
        -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
        background-size: cover;
        background-position: center;

    }
/* body {
    background-image: url(/resources/assets/images/bg.jpg);
} */
</style>
</head>
<body class="subpage">
    <!-- Header -->
    <header id="header">
        <div class="logo">
            <a href="index.jsp">Hielo <span>by TEMPLATED</span></a>
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
    <!-- One -->
    <section id="One" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <h1>select</h1>
                <P></P>
                <h2>select</h2>
            </header>
        </div>
    </section>
    <!-- Main -->
    <div id="main" class="container">
<div class="outer">
        <div class="mytable">
            <h3>Register</h3>
            <form method="post" >
                <div class="row uniform">
                    <div class="6u 12u$(xsmall)">
                        <input type="text" name="title" id="name" 
                            placeholder="title" />
                    </div>
                    <div class="6u 12u$(xsmall)">
                        <input type="text" name="writer" id="writer" 
                            placeholder="writer" />
                    </div>
                    <div class="12u$">
                        <textarea name="content" id="message"
                            placeholder="Enter your context" rows="20" class="powerbtn"></textarea>
                    </div>
                    <div class="12u$">
                        <ul class="actions">
                            <li><button type="submit" class="register">REGISTER</button></li>
                            <li><button type="submit" class="bluebtn">Modify</button></li>
                            <li><button type="submit" class="bluebtn">Delete</button></li>
                            
                            <li><input type="reset" value="Reset" class="special" /></li>
                            <li><button type="reset" class="special2" >On</button></li>
                        </ul>
                    </div>
                </div>
            </form>
            <hr />
        </div></div>
    </div>
   <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
 
    
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