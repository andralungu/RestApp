<!DOCTYPE html>

<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html style="width: 100%;height: 100%">
<head>
    <META charset="utf-8">
    <TITLE>GetMoving</TITLE>
    <LINK rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <SCRIPT src="//code.jquery.com/jquery-1.10.2.js"></script>
    <SCRIPT src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <LINK href="css/default.css" rel="stylesheet" type="text/css" />

    <LINK href="css/fonts.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.css">
    <script src="assets/javascripts/jquery-1.11.0.min.js"></script>
</head>

<BODY style="width: 100%;height: 100%" >
<%!
	Statement st;
	Connection con;
	String query;
	ResultSet rs;
%>

	<%--the user with the id_u equal to 1 is the current user, while the one with id_u equal to 2 is the user whose page we are surfing--%>
<%
	Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

      st = con.createStatement();
      query = "SELECT * FROM `user` WHERE `id_u`='1'";
      rs = st.executeQuery(query);
      if(!rs.next()) {
          query = "INSERT INTO `user` VALUES(NULL, 'default', 'default', 'default', 'default', 'default', 0, 0, 0, 'default', 1)";
          st.executeUpdate(query);
      }

      query = "SELECT * FROM `user` WHERE `id_u`='2'";
      rs = st.executeQuery(query);
      if(!rs.next()) {
          query = "INSERT INTO `user` VALUES(NULL, 'default', 'default', 'default', 'default', 'default', 0, 0, 0, 'default', 2)";
          st.executeUpdate(query);
      }
%>

<%--display logo and login form--%>
<section style="height:auto">
<%-- The Login class is used to verify the username and password, afterwards redirecting the client to his/her profile page --%>
<div id="header-wrapper">

        <div id="header" class="container">
            <div id="logo">
                <h1><div style="float:left; width: 60%; margin-left: -10%; margin-top: -5% ">
                    <img class="logo" style="max-height: 100%" src="assets/images/logo.png"></div></h1>
            </div>

            <div id="credentials">
                <form action="Login" method="GET">

                    <div style="float: right;margin-right: 0%">
                        <div>
                            <br>
                            <INPUT id="user" TYPE=TEXT NAME=user SIZE=15 value="Username" onclick="clearUsername()" style="min-height: 15%">
                            <INPUT id="pass" TYPE=PASSWORD NAME=passwd SIZE=15 value="password" onclick="setPasswordType()">
                            <INPUT TYPE=SUBMIT class="button" style="margin-top: -1%" VALUE="Log in" >
                        </div>

                        <br>
                    </div>
                </form>
            </div>

        </div>
</div>
</section>



<section style="height: auto;float: right">
<%--display layout image--%>
<div style="float:left;overflow: hidden;width: 45%;margin-top: 0%">
    <img class="displayed" src="assets/images/landing.jpg" style="display: table-cell;margin-top:10%; margin-left: 5%;heigth:20px">
</div>
<div style="float:right; width:40%; overflow:hidden;margin-right: 5%; margin-top: 0%">
<h1> Sign up </h1>
<h3> Your mobility issues. Solved </h3>

<FORM METHOD=POST ACTION="new_user.jsp">	<%-- When a new user was successfully added, a relevant page is displayed--%>
<div style="float:left; width: 35%"> First Name </div> <div> <INPUT TYPE=TEXT NAME=firstname SIZE=20> <br> </div>
<div style="float:left; width: 35%"> Second Name </div> <div> <INPUT TYPE=TEXT NAME=secondname SIZE=20> <br> </div>
<div style="float:left; width: 35%"> Username </div> <div> <INPUT TYPE=TEXT NAME=username SIZE=20> <br> </div>
<div style="float:left; width: 35%"> Password </div> <div> <INPUT TYPE=PASSWORD NAME=password SIZE=20> <br> </div>
<div style="float:left; width: 35%"> Confirm Password </div> <div> <INPUT TYPE=PASSWORD NAME=password SIZE=20> <br> </div>

<p><b>You are a:</b>
<input type="radio" name="sex" value="male">Male
<input type="radio" name="sex" value="female">Female
<br>

<p><b> Birthday: </b></p>
<select id="month" name="DateOfBirth_Month">
	<option>- Month -</option>
        <option value="1">January</option>
        <option value="2">February</option>
        <option value="3">March</option>
        <option value="4">April</option>
        <option value="5">May</option>
        <option value="6">June</option>
        <option value="7">July</option>
        <option value="8">August</option>
        <option value="9">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
</select>
<select id="day" name="DateOfBirth_Day">
        <option>- Day -</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
</select>
<select id="year" name="DateOfBirth_Year">
    <option>- Year -</option>
    <option value="2011">2011</option>
    <option value="2010">2010</option>
    <option value="2009">2009</option>
    <option value="2008">2008</option>
    <option value="2007">2007</option>
    <option value="2006">2006</option>
    <option value="2005">2005</option>
    <option value="2004">2004</option>
    <option value="2003">2003</option>
    <option value="2002">2002</option>
    <option value="2001">2001</option>
    <option value="2000">2000</option>
    <option value="1999">1999</option>
    <option value="1998">1998</option>
    <option value="1997">1997</option>
    <option value="1996">1996</option>
    <option value="1995">1995</option>
    <option value="1994">1994</option>
    <option value="1993">1993</option>
    <option value="1992">1992</option>
    <option value="1991">1991</option>
    <option value="1990">1990</option>
    <option value="1989">1989</option>
    <option value="1988">1988</option>
    <option value="1987">1987</option>
    <option value="1986">1986</option>
    <option value="1985">1985</option>
    <option value="1984">1984</option>
    <option value="1983">1983</option>
    <option value="1982">1982</option>
    <option value="1981">1981</option>
    <option value="1980">1980</option>
    <option value="1979">1979</option>
    <option value="1978">1978</option>
    <option value="1977">1977</option>
    <option value="1976">1976</option>
    <option value="1975">1975</option>
    <option value="1974">1974</option>
    <option value="1973">1973</option>
    <option value="1972">1972</option>
    <option value="1971">1971</option>
    <option value="1970">1970</option>
    <option value="1969">1969</option>
    <option value="1968">1968</option>
    <option value="1967">1967</option>
    <option value="1966">1966</option>
    <option value="1965">1965</option>
    <option value="1964">1964</option>
    <option value="1963">1963</option>
    <option value="1962">1962</option>
    <option value="1961">1961</option>
    <option value="1960">1960</option>
    <option value="1959">1959</option>
    <option value="1958">1958</option>
    <option value="1957">1957</option>
    <option value="1956">1956</option>
    <option value="1955">1955</option>
    <option value="1954">1954</option>
    <option value="1953">1953</option>
    <option value="1952">1952</option>
    <option value="1951">1951</option>
    <option value="1950">1950</option>
    <option value="1949">1949</option>
    <option value="1948">1948</option>
    <option value="1947">1947</option>
    <option value="1946">1946</option>
    <option value="1945">1945</option>
    <option value="1944">1944</option>
    <option value="1943">1943</option>
    <option value="1942">1942</option>
    <option value="1941">1941</option>
    <option value="1940">1940</option>
    <option value="1939">1939</option>
    <option value="1938">1938</option>
    <option value="1937">1937</option>
    <option value="1936">1936</option>
    <option value="1935">1935</option>
    <option value="1934">1934</option>
    <option value="1933">1933</option>
    <option value="1932">1932</option>
    <option value="1931">1931</option>
    <option value="1930">1930</option>
    <option value="1929">1929</option>
    <option value="1928">1928</option>
    <option value="1927">1927</option>
    <option value="1926">1926</option>
    <option value="1925">1925</option>
    <option value="1924">1924</option>
    <option value="1923">1923</option>
    <option value="1922">1922</option>
    <option value="1921">1921</option>
    <option value="1920">1920</option>
    <option value="1919">1919</option>
    <option value="1918">1918</option>
    <option value="1917">1917</option>
    <option value="1916">1916</option>
    <option value="1915">1915</option>
    <option value="1914">1914</option>
    <option value="1913">1913</option>
    <option value="1912">1912</option>
    <option value="1911">1911</option>
    <option value="1910">1910</option>
    <option value="1909">1909</option>
    <option value="1908">1908</option>
    <option value="1907">1907</option>
    <option value="1906">1906</option>
    <option value="1905">1905</option>
    <option value="1904">1904</option>
    <option value="1903">1903</option>
    <option value="1902">1902</option>
    <option value="1901">1901</option>
    <option value="1900">1900</option>
</select> 
<br>

<script>
function clearUsername()
{
    $("#user").val("");
}
function setPasswordType()
{
    document.getElementById("pass").type="PASSWORD";
    $("#pass").val("");
}
function calculate_age()
{	
	birth_month = document.getElementById("month").value;
	birth_day = document.getElementById("day").value;
	birth_year = document.getElementById("year").value;

    today_date = new Date();
    today_year = today_date.getFullYear();
    today_month = today_date.getMonth();
    today_day = today_date.getDate();

    age = today_year - birth_year;

    if ( today_month < (birth_month - 1))
    {
        age--;
    }
    if (((birth_month - 1) == today_month) && (today_day < birth_day))
    {
        age--;
    }
	/* verify age accuracy */
	if(age < 16) 
	{
		alert("You must be at least 16 years old to use this website! :(");
	}
}
</script>

<p><b>You are a(part of a):</b> </p>
<input type="radio" name="client" value="disabled">Disabled person
<input type="radio" name="client" value="regular"> Regular citizen
<input type="radio" name="client" value="org"> Public institution/ Organization 
<br>
<br>

<p>
By clicking "Sign up", you agree to our <a href="terms.html">Terms of Use</a> and you confirm the fact that you have read our <a href="privacy.html">Privacy Policy</a>. 
</p>

<P>
<INPUT TYPE=SUBMIT class="button" VALUE="Sign up" onclick="calculate_age()" style="width: 100px">
</FORM>
</div>
<div style="clear: both" ></div>
</section>
</BODY>
</HTML>
