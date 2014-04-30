<%@ page import="java.util.*,java.lang.*" %>

<HTML>
<HEAD>
<META charset="utf-8">
<TITLE>GetMoving</TITLE>
<LINK rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<SCRIPT src="//code.jquery.com/jquery-1.10.2.js"></script>
<SCRIPT src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<LINK href="css/default.css" rel="stylesheet" type="text/css" />
<LINK href="css/fonts.css" rel="stylesheet" type="text/css" />
</HEAD>


<BODY>



<div id="header-wrapper">

	<div id="header" class="container">
		<div id="credentials">
			<a href="signin.jsp" class="button">Sign up | Log in</a>
		</div>
		<div id="logo">
			<h1> GetMoving </h1>
		</div>
	
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="#" accesskey="2" title="">Events</a></li>
				<li><a href="user_profile.jsp" accesskey="5" title="">MyProfile</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="page-wrapper">
	<div id="page" class="container">
		<!-- 		
		<div id="point1" STYLE="position:absolute;visibility:visible;">
			<div id="floatmail"> 
				<p>Leave your email if you are interested in this service.</p>
				<input type="text" name="email" />
				<button>Add</button>
			</div>
		</div>
		 -->
		<img src="css/images/cloud.png" />
		<hr/>
		<div id="search_options">
		<form>
			<p id="form_question">Find an activity you would like to do: </p>
			<div class="search_column">
				<p>Activity</p>
				<input type="text" name="activity" class="inputs">
			</div>
			<div class="search_column">
				<p>Location</p>
				<input type="text" name="location" class="inputs">
			</div>
			<div class="search_column">
				<p>Start date</p>
				<input type="text" name="start_date" id="datepicker" class="inputs" >
			</div>
			<a href="#" class="button">Search</a>
		</form>		
		</div>

<div id="lists" class="container">

<div id="offers_accordion">
<p class="list_title"> Last offers </p>
<div class="accordion" >
	<h3>Museum</h3>
	<div>
		Posted on: 27.02.2014 19:14
		<p>I am going to the museums of arts in 2 days, around lunch. Would anyone like to join me?</p>
		<button>More info</button>
	</div>
	<h3>Supermarket</h3>
	<div>
		Posted on: 26.02.2014 15:14
		<p>I am going to the supermarket tomorrow at 5. Is anyone interested?</p>
		<button>More info</button>
	</div>

	<h3>Board game night</h3>
	<div>
		Posted on: 23.02.2014 07:14
		<p>I am going to play board games with some friends. There are free spots. Does anyone care to join us? (No fees required)</p>
		<button>More info</button>
	</div>

</div>
</div>

<div  id="requests_accordion">
<p class="list_title"> Last requests </p>
<div class="accordion">
<h3>Shopping</h3>
<div>
	Posted on: 30.02.2014 11:14
	<p>I need to go shopping for groceries tomorrow. Is anyone who has a car available?</p>
	<button>More info</button>
</div>
<h3>Park</h3>
<div>
		Posted on: 05.03.2014 17:17
		<p>Who would like to go for a walk in the park this afternoon?</p>
		<button>More info</button>
</div>
<h3>Cello concert</h3>
<div>
		Posted on: 07.03.2014 10:54
		<p>I have 2 tickets for the cello concert on 17th July. Are there any fans? I would like someone to go with.</p>
		<button>More info</button>
</div>
</div>
</div>

</div>
<div id="footer" class="container">
	<div class="boxA">
		<div class="box">
			<img src="assets/images/museum.jpg" width="320" height="180" alt="" />
			<h3>Museums</h3>
			<p>Go visit a museum.</p>
			<a href="#" class="button">See more</a>
		</div>

	</div>
	<div class="boxB">
		<div class="box">
			<img src="assets/images/park.jpg" width="320" height="180" alt="" />
			<h3>Parks</h3>
			<p>Take a stroll through a park.</p>
			<a href="#" class="button">See more</a>
		</div>

	</div>
	<div class="boxC">
		<div class="box">
			<img src="assets/images/shopping.jpg" width="320" height="180" alt="" />
			<h3>Shopping</h3>
			<p>Do your shopping.</p>
			<a href="#" class="button">See more</a>
		</div>

	</div>
</div>
<hr/>
<div id="portfolio" class="container">
	<div class="box1">
		<ul class="style2">
			<li><a href="index.jsp">Homepage</a></li>
			<li><a href="#">Events</a></li>
			<li><a href="user_profile.jsp">My profile</a></li>
		</ul>
	</div>
	<div class="box2">
		<ul class="style2">
			<li><a href="privacy.html">Privacy and security</a></li>
			<li><a href="press.html">Press</a></li>

		</ul>
	</div>
	<div class="box3">
		<ul class="style2">
			<li><a href="terms.html">General conditions</a></li>
			<li><a href="info.html">Information</a></li>
		</ul>
	</div>
	<div class="box4">
		<ul class="style2">
			<li><a href="sitemap.html">Site map</a></li>
			<li><a href="aboutus.html">About us</a></li>
		</ul>
	</div>
	
</div>


<div id="copyright" class="container">
	<p>Copyright (c) 2013 GetMoving.com. All rights reserved.</p>
</div>

</div>
</div>
<SCRIPT>
$( ".accordion" ).accordion();

$(function() {
$( "#datepicker" ).datepicker();
});
</SCRIPT>

</BODY>
</HTML>

<script LANGUAGE="JavaScript1.2">

/*
Floating image II (up down)- Bruce Anderson (http://appletlib.tripod.com)
Submitted to Dynamicdrive.com to feature script in archive
Modified by DD for script to function in NS6
For 100's of FREE DHTML scripts, Visit http://www.dynamicdrive.com
*/

var XX=20; // X position of the scrolling objects
var xstep=1;
var delay_time=60;

//Begin of the unchangable area, please do not modify this area
var YY=0;  
var ch=0;
var oh=0;
var yon=0;

var ns4=document.layers?1:0
var ie=document.all?1:0
var ns6=document.getElementById&&!document.all?1:0

if(ie){
YY=document.body.clientHeight;
point1.style.top=YY;
}
else if (ns4){
YY=window.innerHeight;
document.point1.pageY=YY;
document.point1.visibility="hidden";
}
else if (ns6){
YY=window.innerHeight
document.getElementById('point1').style.top=YY
}


function reloc1()
{

if(yon==0){YY=YY-xstep;}
else{YY=YY+xstep;}
if (ie){
ch=document.body.clientHeight;
oh=point1.offsetHeight;
}
else if (ns4){
ch=window.innerHeight;
oh=document.point1.clip.height;
}
else if (ns6){
ch=window.innerHeight
oh=document.getElementById("point1").offsetHeight
}
		
if(YY<0){yon=1;YY=0;}
if(YY>=(ch-oh)){yon=0;YY=(ch-oh);}
if(ie){
point1.style.left=XX;
point1.style.top=YY+document.body.scrollTop;
}
else if (ns4){
document.point1.pageX=XX;
document.point1.pageY=YY+window.pageYOffset;
}
else if (ns6){
document.getElementById("point1").style.left=XX
document.getElementById("point1").style.top=YY+window.pageYOffset
}

}

function onad()
{
if(ns4)
document.point1.visibility="visible";
loopfunc();
}
function loopfunc()
{
reloc1();
setTimeout('loopfunc()',delay_time);
}

if (ie||ns4||ns6)
window.onload=onad

</script>
