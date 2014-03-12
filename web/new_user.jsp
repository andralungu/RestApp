<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*" %>
<%@ page import="Simple.Encryption" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Added</title>
</head>

<%-- Contains the code that adds a user to our database --%>
<%-- To do so, we will use a standard HTTPServletRquest, denoted simply request in the following --%>

<body>
<%!	
    String password;
    Statement st;
    Connection con;
    String query;
    ResultSet rs;
%>

<div> <img src="/assets/images/new_user.png" style="height:60%  ; width:50%; margin-left:25%;margin-top: 10%"></div>
<div style="top: 50%; text-align: center">
    <% out.print("The following user was added: " + request.getParameter("username"));%>
</div>
<div style="top:60%; margin-left: 47%">
    <button name="index">
        <a href="index.jsp"> Home </a>
    </button>
</div>

<%
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

    st = con.createStatement();
    int age;
    /* The password will be encrypted using the md5 algorithm */
    password = request.getParameter("password");
    try {
        password = Encryption.crypt(password);
    } catch (Exception e) {}

    int today_year = Calendar.getInstance().get(Calendar.YEAR);
    int today_month = Calendar.getInstance().get(Calendar.MONTH);
    int today_day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);

    int birth_year=0, birth_month=0, birth_day=0;
    birth_year = Integer.parseInt(request.getParameter("DateOfBirth_Year"));
    birth_month = Integer.parseInt(request.getParameter("DateOfBirth_Month"));
    birth_day = Integer.parseInt(request.getParameter("DateOfBirth_Day"));

    age = today_year-birth_year;
    if ( today_month < (birth_month - 1))
    {
        age--;
    }
    if (((birth_month - 1) == today_month) && (today_day < birth_day))
    {
        age--;
    }
	/* verify age accuracy */
    if(age >= 16) {
        query = "INSERT INTO `user` VALUES(NULL, '"+ request.getParameter("firstname") +"','" + request.getParameter("secondname")+"','"
                + request.getParameter("username")+"','" + password +"','" + request.getParameter("sex")+"','" + request.getParameter("DateOfBirth_Month")+"','"
                +request.getParameter("DateOfBirth_Day")+"','"+ request.getParameter("DateOfBirth_Year")+"','" + request.getParameter("client") + "',99)";
        st.executeUpdate(query);
        con.close();
    }
%>
</body>
</html>
