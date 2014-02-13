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
			<a href="signin.jsp" class="button">My account</a>
		</div>
		<div id="logo">
			<img class="logo" width="350" height="100" style="max-height: 100%" src="assets/images/logo.png">
		</div>
	
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#" accesskey="1" title="">Homepage</a></li>
				<li><a href="#" accesskey="2" title="">Events</a></li>
				<li><a href="#" accesskey="3" title="">Organization</a></li>
				<li><a href="#" accesskey="5" title="">MyProfile</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="page-wrapper">
	<div id="page" class="container">
		<form id="search_options">
			<p id="form_question">What do you want to do? </p>
			<div class="search_column">
				<p>Activity</p>
				<input type="text" name="activity">
			</div>
			<div class="search_column">
				<p>Location</p>
				<input type="text" name="location">
			</div>
			<div class="search_column">
				<p>Start date</p>
				<input type="text" name="start_date" id="datepicker">
			</div>
			<a href="#" class="button">Search</a>
		</form>		
	</div>
</div>

<div id="lists" class="container">

<div id="offers_accordion">
<p class="list_title"> Last offers </p>
<div class="accordion" >
	<h3>Section 1</h3>
	<div>
		<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget.
		Integer ut neque. Vivamus nisi metus, molestie vel, gravida in,
		condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros.
		Nam mi. Proin viverra leo ut odio.</p>
	</div>
	<h3>Section 2</h3>
	<div>
		<p>Sed non urna. Phasellus eu ligula. Vestibulum sit amet purus.
		Vivamus hendrerit, dolor aliquet laoreet, mauris turpis velit,
		faucibus interdum tellus libero ac justo.</p>
	</div>
	<h3>Section 3</h3>
	<div>
		<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
		Quisque lobortis.Phasellus pellentesque purus in massa.</p>
		<ul>
			<li>List item one</li>
			<li>List item two</li>
			<li>List item three</li>
		</ul>
	</div>
	<h3>Section 4</h3>
	<div>
		<p>Sed non urna. Phasellus eu ligula. Vestibulum sit amet purus.
		Vivamus hendrerit, dolor aliquet laoreet, mauris turpis velit,
		faucibus interdum tellus libero ac justo.</p>
	</div>
</div>
</div>

<div  id="requests_accordion">
<p class="list_title"> Last requests </p>
<div class="accordion">
<h3>Section 1</h3>
<div>
<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget.
Integer ut neque. Vivamus nisi metus, molestie vel, gravida in,
condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros.
Nam mi. Proin viverra leo ut odio.</p>
</div>
<h3>Section 2</h3>
<div>
<p>Sed non urna. Phasellus eu ligula. Vestibulum sit amet purus.
Vivamus hendrerit, dolor aliquet laoreet, mauris turpis velit,
faucibus interdum tellus libero ac justo.</p>
</div>
<h3>Section 3</h3>
<div>
<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
Quisque lobortis.Phasellus pellentesque purus in massa.</p>
<ul>
<li>List item one</li>
<li>List item two</li>
<li>List item three</li>
</ul>
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

<div id="portfolio" class="container">
	<div class="box1">
		<ul class="style2">
			<li><a href="#">Homepage</a></li>
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
			<li><a href="#">Information</a></li>
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

<SCRIPT>
$( ".accordion" ).accordion();

$(function() {
$( "#datepicker" ).datepicker();
});
</SCRIPT>

</BODY>
</HTML>


