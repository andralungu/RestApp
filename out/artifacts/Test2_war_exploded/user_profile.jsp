<!DOCTYPE html>

<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="width: 100%;height: 100%">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>GetMoving</TITLE>
    <LINK rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <link href="css/ui-darkness/jquery-ui-1.10.4.custom.css" rel="stylesheet">
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui-1.10.4.custom.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script>
        $(function() {

            $( "#accordion" ).accordion();
            $( "#MoreAboutMe").accordion({ active: 2 });
            $( "#More").accordion({ active: 2 });
            $( "#More" ).accordion( "option", "collapsible", true );
            $( "#MoreAboutMe" ).accordion( "option", "collapsible", true );
            $( "#accordion" ).accordion( "option", "heightStyle", "content" );
            $( "#More" ).accordion( "option", "heightStyle", "content" );
            $( "#MoreAboutMe" ).accordion( "option", "heightStyle", "content" );

            var availableTags =   [];




            $( "#button" ).button();
            $( "#radioset" ).buttonset();



            $( "#tabs" ).tabs();



            $( "#dialog" ).dialog({
                autoOpen: false,
                width: 400,
                buttons: [
                    {
                        text: "Ok",
                        click: function() {
                            $( this ).dialog( "close" );
                        }
                    },
                    {
                        text: "Cancel",
                        click: function() {
                            $( this ).dialog( "close" );
                        }
                    }
                ]
            });

            // Link to open the dialog
            $( "#dialog-link" ).click(function( event ) {
                $( "#dialog" ).dialog( "open" );
                event.preventDefault();
            });



            $( "#datepicker" ).datepicker({
                inline: true
            });



            $( "#slider" ).slider({
                range: true,
                values: [ 17, 67 ]
            });



            $( "#progressbar" ).progressbar({
                value: 20
            });


            // Hover states on the static widgets
            $( "#dialog-link, #icons li" ).hover(
                    function() {
                        $( this ).addClass( "ui-state-hover" );
                    },
                    function() {
                        $( this ).removeClass( "ui-state-hover" );
                    }
            );
            var availableTags =    /* populate the list of autocomplete possibilities from the database */
                    <%
                     Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

                     st = con.createStatement();
                     query = "SELECT * FROM `user`";
                     rs = st.executeQuery(query);
                     out.print("[");
                     if (rs.next()) {
                         out.print("\"" +rs.getString("firstname") + " " + rs.getString("secondname")+"\"");
                     }
                     while (rs.next()){
                         out.print(",\"" +rs.getString("firstname") + " " + rs.getString("secondname")+"\"");
                     }
                     out.print("]");
                    %>;
            $( "#tags" ).autocomplete({
                source: availableTags
            });
        });
    </script>
    <style>
        body{
            font: 62.5% "Trebuchet MS", sans-serif;
            margin: 50px;
        }
        .demoHeaders {
            margin-top: 2em;
        }
        #dialog-link {
            padding: .4em 1em .4em 20px;
            text-decoration: none;
            position: relative;
        }
        #dialog-link span.ui-icon {
            margin: 0 5px 0 0;
            position: absolute;
            left: .2em;
            top: 50%;
            margin-top: -8px;
        }
        #icons {
            margin: 0;
            padding: 0;
        }
        #icons li {
            margin: 2px;
            position: relative;
            padding: 4px 0;
            cursor: pointer;
            float: left;
            list-style: none;
        }
        #icons span.ui-icon {
            float: left;
            margin: 0 4px;
        }
        .fakewindowcontain .ui-widget-overlay {
            position: absolute;
        }
    </style>
    <LINK href="css/default.css" rel="stylesheet" type="text/css"/>

    <LINK href="css/fonts.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.css">
    <script>

    </script>

</head>

<body style="width: 100%;height: 100%">

<%-- For the ranking system --%>
<script type="text/javascript">(function (d, t, e, m) {
    // Async Rating-Widget initialization.
    window.RW_Async_Init = function () {
        RW.init({
            huid: "157957",
            uid: "11595c5b2a386165e86414e2d15c31f3",
            source: "website",
            options: {
                "size": "medium",
                "style": "ratingwidget"
            }
        });
        RW.render();
    };

    // Append Rating-Widget JavaScript library.
    var rw, s = d.getElementsByTagName(e)[0], id = "rw-js",
            l = d.location, ck = "Y" + t.getFullYear() +
                    "M" + t.getMonth() + "D" + t.getDate(), p = l.protocol,
            f = (-1 < l.search.indexOf("DBG=") ? "" : ".min"),
            a = ("https:" == p ? "secure." + m + "js/" : "js." + m);
    if (d.getElementById(id)) return;
    rw = d.createElement(e);
    rw.id = id;
    rw.async = true;
    rw.type = "text/javascript";
    rw.src = p + "//" + a + "external" + f + ".js?ck=" + ck;
    s.parentNode.insertBefore(rw, s);
}(document, new Date(), "script", "rating-widget.com/"));</script>

<script type="text/javascript">

    //function to verify if a given cookie is already set
    function cookieIsSet(name) {
        var cookies = document.cookie.split(";");
        for (var i in cookies) {
            if (i.indexOf(name + "=") == 0)
                return true;
        }
        return false;
    }

    function createCookie(name,value,days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime()+60*1000);
            var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/";
    }

    function viewProfile() {
        var content = document.getElementById("tags").value;
        var firstname = content.split(" ")[0];
        var secondname = content.split(" ")[1];

        //add a cookie containing the selected firstname + secondname
        createCookie("firstname", firstname,1);
        createCookie("secondname", secondname,1);

        // redirect to the corresponding user page
        window.location.replace("user_profile.jsp");
    }

    function writeComment() {
        var comment = document.getElementById("comms").value;

        //add cookies for the first and second user id and the comment
        createCookie("comment", comment, 1);
    }

    function insertComment(){

        <%
            Cookie[] cookies=request.getCookies();
            String cookieComment = "comment";
            String cookieCurrentUser = "user";
            String cookieUserViewed ="firstname";

            Map<String, String> cookieMap2 = new HashMap<String, String>();
            cookieMap2.put(cookieComment, null);
            cookieMap2.put(cookieCurrentUser,null);
            cookieMap2.put(cookieUserViewed,null);

            Thread.sleep(100);
            if (cookies != null)

            {
                System.out.println();
                for (int i = 0; i < cookies.length; i++)
                {
                    System.out.println(cookies[i].getName()+":"+cookies[i].getValue());
                    if (cookieMap2.containsKey(cookies[i].getName()))
                    {
                        cookieMap2.put(cookies[i].getName(), cookies[i].getValue());
                    }
                }
            }

            st = con.createStatement();
            if (cookieMap2.get(cookieCurrentUser)!=null) {
                query = "SELECT * FROM `user` WHERE `firstname` like '"+cookieMap2.get(cookieUserViewed)+"'";
                rs = st.executeQuery(query);

                if (rs.next()) {

                    Integer user_id2 = rs.getInt("id");
                    System.out.println("user_id:"+user_id2);
                    st = con.createStatement();
                    query = "SELECT * FROM `user` WHERE `username` like '"+cookieMap2.get(cookieCurrentUser)+"'";
                    rs = st.executeQuery(query);
                    if (rs.next()) {
                        System.out.println(rs.getInt("id"));
                        System.out.println(cookieMap2.get(cookieComment));
                        if(cookieMap2.get(cookieComment) != null) {
                            query = "INSERT INTO `comments` VALUES(NULL,'"+rs.getInt("id")+"',"+user_id2+"','"+cookieMap2.get(cookieComment)+"')";
                            st = con.createStatement();
                            st.executeUpdate(query);
                        }
                }
            }
            }
        %>
    }


</script>


<%!
    Statement st;
    Connection con;
    String query;
    ResultSet rs;
%>

<%--display logo--%>
<section style="height:auto">
    <div id="header-wrapper">
        <div id="header" class="container">
            <div id="credentials">
                <a href="index.jsp" class="button">Log out</a>
            </div>
            <div id="logo">
                <h1> GetMoving </h1>
            </div>

            <div id="menu">
                <ul>
                    <li><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
                    <li><a href="#" accesskey="2" title="">Events</a></li>
                    <li class="current_page_item"><a href="#" accesskey="5" title="">MyProfile</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

<style type="text/css">
    #ProfilePage {
        /* Move it off the top of the page, then centre it horizontally */
        margin: 50px auto;
        width: 935px;
        height: 600px;
        /* For visibility. Delete me */
        border: 1px solid black;
    }

    #LeftCol {
        /* Move it to the left */
        float: left;

        width: 400px;
        text-align: center;

        /* Move it away from the content */
        margin-right: 20px;

    }

    #RightCol {
        /* Move it to the left */

        width: 500px;
        text-align: center;

        /* Move it away from the content */
        margin-left: 420px;

    }


    #Photo {
        /* Width and height of photo container */
        width: 200px;
        height: 200px;

        /* For visibility. Delete me */
        border: 1px solid black;
    }

    #ProfileOptions {
        text-align: center;
        width: 200px;

        /* For visibility. Delete me */
    }

    #Rating {
        /* Give it a width */
        display: inline-block;
        width: 300px;

        /* For visibility. Delete me */
    }

    #Comments {
        /* Give it a width */
        display: block;

        /* For visibility. Delete me */
    }

    #MoreAboutMe {
        margin-top: 100px;
    }

    #Likes {
        /* Give it a width */
        display: block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid black;
    }

    #Dislikes {
        /* Give it a width */
        display: block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid #000000;
    }

    #Info {
        width: 400px;
        text-align: center;

        /* Move it to the right */
        float: right;

        /* For visibility. Delete me */
        border: 1px solid black;
    }

    #Info strong {
        /* Give it a width */
        display: inline-block;
        width: 100px;

        /* For visibility. Delete me */
        border: 1px solid black;
    }

    #Info span {
        /* Give it a width */
        display: inline-block;
        width: 250px;
    }

</style>

<div id="page-wrapper">
<div id="page" class="container">

<div id="search_options">
    <form method="get" action="javascript:viewProfile()">
        <%
            cookies=request.getCookies();
            String cookieName = "user";

            // verify if the firstname and secondname are the same
            // if not, redirect the user to the desired profile page
            String cookieFirstName = "firstname";
            String cookieSecondName = "secondname";
            Map<String, String> cookieMap = new HashMap<String, String>();
            cookieMap.put(cookieName, null);
            cookieMap.put(cookieFirstName, null);
            cookieMap.put(cookieSecondName, null);
            if (cookies != null)
            {
                for (int i = 0; i < cookies.length; i++)
                {
                    if (cookieMap.containsKey(cookies[i].getName()))
                    {
                        cookieMap.put(cookies[i].getName(), cookies[i].getValue());
                    }
                }
            }
        %>

        <div style="border:2px dotted black;padding:4px;width:25em;">
            <table border="0" align="center" cellpadding="0">
                <tr>
                    <td>
                        <input id="tags" class="ui-autocomplete" type="text" name="q" size="25" style="color:#808080;position: relative"
                               maxlength="255" value="Search for people"
                               onfocus="if(this.value==this.defaultValue)this.value=''; this.style.color='black';" onblur="if(this.value=='')this.value=this.defaultValue; "/>
                    </td>
                    <td>
                        <input type="submit" class="button" value="Go!" onclick="viewProfile()" />
                    </td>
                </tr>
            </table>
        </div>

    </form>
</div>

<div id="ProfilePage">
<div id="LeftCol">
<div id="Photo">
    <%
        Cookie myCookie = null;
        if (cookies != null)
        {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies [i].getName().equals (cookieName))
                {
                    myCookie = cookies[i];
                    break;
                }
            }
        }
        System.out.println(myCookie.getValue());
        ServletContext context = request.getServletContext();
        String fullPath = context.getRealPath("/assets/images");
        File photo = null;

        String nameToSearch = null;
        String nameCookie = null;
        Boolean currentUser = false;

        if(cookieMap.containsKey(cookieFirstName)) {
            nameToSearch = cookieMap.get(cookieFirstName);
        }
        if(cookieMap.containsKey(cookieName)) {
            nameCookie = cookieMap.get(cookieName);
        }

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

        st = con.createStatement();

        query = "SELECT * FROM `user` WHERE `firstname` like '"+nameToSearch+"'";
        rs = st.executeQuery(query);
        if (rs.next()) {
            // if the username in the cookie also has the firstname contained in the cookie, we are
            // dealing with the same person
            if(cookieMap.containsKey(cookieName)) {
                if(rs.getString("username") == cookieMap.get(cookieName)) {
                    currentUser = true;
                }
            }

            photo = new File(fullPath+File.separator+rs.getString("username")+".jpg");
            if (photo.exists()) {
                out.print("<img style=\"width:202px; height:202px\" src="+"assets/images/"+rs.getString("username")+".jpg"+" alt=\"MD Logo\" />");

                // only the current user should have the possibility to change his/her profile picture
            }else if(currentUser == true) {
                out.print("<form id=\"form_upload\" method=\"POST\" action=\"UploadFileServlet\" enctype=\"multipart/form-data\" >\n" +
                        "            File: <br>\n" +
                        "            <input type=\"file\" name=\"file\" id=\"file\" /> <br>\n" +
                        "            <br>\n" +
                        "            <input type=\"submit\" value=\"Upload\" name=\"upload\" id=\"upload\" />\n" +
                        "        </form>");
            }
        }
        else {
            query = "SELECT * FROM `user` WHERE `username` like '"+nameCookie+"'";
            rs = st.executeQuery(query);
            if (rs.next()) {

                photo = new File(fullPath+File.separator+rs.getString("username")+".jpg");
                if (photo.exists()) {
                    out.print("<img style=\"width:202px; height:202px\" src="+"assets/images/"+rs.getString("username")+".jpg"+" alt=\"MD Logo\" />");

                }else {
                    out.print("<form id=\"form_upload\" method=\"POST\" action=\"UploadFileServlet\" enctype=\"multipart/form-data\" >\n" +
                            "            File: <br>\n" +
                            "            <input type=\"file\" name=\"file\" id=\"file\" /> <br>\n" +
                            "            <br>\n" +
                            "            <input type=\"submit\" value=\"Upload\" name=\"upload\" id=\"upload\" />\n" +
                            "        </form>");
                }
            }
        }
    %>

</div>
<div id="ProfileOptions">
    <h3>
        <%
            if(cookieMap.get(cookieFirstName) != null) {
                out.print(cookieMap.get(cookieFirstName) + " " + cookieMap.get(cookieSecondName));
            }
            else {
                st = con.createStatement();
                if (cookies != null)
                {
                    for (int i = 0; i < cookies.length; i++)
                    {
                        if (cookies [i].getName().equals (cookieName))
                        {
                            myCookie = cookies[i];
                            break;
                        }
                    }
                }
                System.out.print(myCookie.getValue());
                query = "SELECT * FROM `user` WHERE `username` like '"+myCookie.getValue()+"'";
                rs = st.executeQuery(query);
                if (rs.next()) {
                    out.print(rs.getString("firstname") + " " + rs.getString("secondname"));
                }
            }
        %>
    </h3>
</div>
<div id="Info">
    <p>
        <strong>Gender:</strong>
            <span>
                <%
                    if(cookieMap.get(cookieFirstName) != null) {
                        st = con.createStatement();

                        query = "SELECT * FROM `user` WHERE `firstname` like '"+cookieMap.get(cookieFirstName)+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("gender"));
                        }
                    }
                    else {
                        st = con.createStatement();
                        if (cookies != null)
                        {
                            for (int i = 0; i < cookies.length; i++)
                            {
                                if (cookies [i].getName().equals (cookieName))
                                {
                                    myCookie = cookies[i];
                                    break;
                                }
                            }
                        }
                        System.out.print(myCookie.getValue());
                        query = "SELECT * FROM `user` WHERE `username` like '"+myCookie.getValue()+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("gender"));
                        }
                    }
                %>
            </span>
    </p>

    <p>
        <strong>Type of user:</strong>
            <span>
                <%
                    if(cookieMap.get(cookieFirstName) != null) {
                        st = con.createStatement();

                        query = "SELECT * FROM `user` WHERE `firstname` like '"+cookieMap.get(cookieFirstName)+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("type"));
                        }
                    }
                    else {
                        st = con.createStatement();
                        if (cookies != null)
                        {
                            for (int i = 0; i < cookies.length; i++)
                            {
                                if (cookies [i].getName().equals (cookieName))
                                {
                                    myCookie = cookies[i];
                                    break;
                                }
                            }
                        }
                        System.out.print(myCookie.getValue());
                        query = "SELECT * FROM `user` WHERE `username` like '"+myCookie.getValue()+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("type"));
                        }
                    }
                %>
            </span>
    </p>

    <p>
        <strong>Birthday:</strong>
            <span>
               <%
                   if(cookieMap.get(cookieFirstName) != null) {
                       st = con.createStatement();

                       query = "SELECT * FROM `user` WHERE `firstname` like '"+cookieMap.get(cookieFirstName)+"'";
                       rs = st.executeQuery(query);
                       if (rs.next()) {
                           out.print(rs.getString("bmonth") + "/" + rs.getString("bday") + "/" + rs.getString("byear"));
                       }
                   }
                   else {
                       st = con.createStatement();
                       if (cookies != null)
                       {
                           for (int i = 0; i < cookies.length; i++)
                           {
                               if (cookies [i].getName().equals (cookieName))
                               {
                                   myCookie = cookies[i];
                                   break;
                               }
                           }
                       }
                       System.out.print(myCookie.getValue());
                       query = "SELECT * FROM `user` WHERE `username` like '"+myCookie.getValue()+"'";
                       rs = st.executeQuery(query);
                       if (rs.next()) {
                           out.print(rs.getString("bmonth") + "/" + rs.getString("bday") + "/" + rs.getString("byear"));
                       }
                   }
               %>
            </span>
    </p>

    <p>
        <strong>Address:</strong>
            <span>
                <%
                    // if someone else is viewing my profile, do not allow him/her to edit the address
                    if(cookieMap.get(cookieFirstName) == null) {
                %>
                    <form action="Address" method="POST">
                        <div><INPUT TYPE=TEXT NAME=addr SIZE=15> <br></div>
                        <INPUT TYPE=SUBMIT VALUE="Update your address">
                    </form>
                <% } %>
            </span>
    </p>
    <p>
        <strong>Phone number:</strong>
            <span>
                <%
                    // if someone else is viewing my profile, do not allow him/her to edit the phone number
                    if(cookieMap.get(cookieFirstName) == null) {
                %>
                    <form action="Phone" method="POST">
                        <div><INPUT TYPE=TEXT NAME=phone SIZE=15> <br></div>
                        <INPUT TYPE=SUBMIT VALUE="Update your phone no">
                    </form>
                <%}%>
            </span>
    </p>
    <p>
        <strong>Email address:</strong>
            <span>
                <%
                    if(cookieMap.get(cookieFirstName) != null) {
                        st = con.createStatement();

                        query = "SELECT * FROM `user` WHERE `firstname` like '"+cookieMap.get(cookieFirstName)+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("username"));
                        }
                    }
                    else {

                        st = con.createStatement();
                        if (cookies != null)
                        {
                            for (int i = 0; i < cookies.length; i++)
                            {
                                if (cookies [i].getName().equals (cookieName))
                                {
                                    myCookie = cookies[i];
                                    break;
                                }
                            }
                        }
                        System.out.print(myCookie.getValue());
                        query = "SELECT * FROM `user` WHERE `username` like '"+myCookie.getValue()+"'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            out.print(rs.getString("username"));
                        }
                    }
                %>
            </span>
    </p>
</div>



<!-- Needed because other elements inside ProfilePage have floats -->
<div style="clear:both"></div>
</div>
<div id="RightCol">
    <div id="Rating">
        <p>
            <strong>Rating:</strong>

        <div class="rw-ui-container"></div>
        </p>
    </div>
    <div id="Comments">
        <h3> Last Comments </h3>

        <div id="accordion">
            <%
                st = con.createStatement();
                if(cookieMap.get(cookieFirstName) != null) {
                    query = "SELECT * FROM `user` u1,`user` u2,`comments` WHERE u1.`firstname` like '"+cookieMap.get(cookieFirstName)+"' and u1.`id`=`id_user2` and u2.`id`=`id_user1`";
                } else {
                    query = "SELECT * FROM `user` u1,`user` u2,`comments` WHERE u1.`username` like '"+cookieMap.get(cookieName)+"' and u1.`id`=`id_user2` and u2.`id`=`id_user1`";
                }
                rs = st.executeQuery(query);

                if (rs.next()){
                    out.print("<h3>"+rs.getString("u2.firstname")+" "+rs.getString("u2.secondname")+"</h3>");
                    out.print("<div>"+rs.getString("comment")+"</div>");
                    while (rs.next()) {
                        out.print("<h3>"+rs.getString("u2.firstname")+" "+rs.getString("u2.secondname")+"</h3>");
                        out.print("<div>"+rs.getString("comment")+"</div>");
                    }
                }
                else {
                    out.print("<h3>User1</h3>\n" +
                            "                        <div>Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</div>\n" +
                            "                        <h3>User2</h3>\n" +
                            "                        <div>Phasellus mattis tincidunt nibh.</div>\n" +
                            "                        <h3>User3</h3>\n" +
                            "                        <div>Nam dui erat, auctor a, dignissim quis.</div>");
                }
                if (cookieMap.get(cookieFirstName) != null) {
            %>
            <form  method="POST">
                <div align="center">
                    <br>
                    <input id="comms" type="text" size="100" value="Write your comment" onclick="writeComment()">
                    <br><input type="submit" class="button" value="Submit" onclick="insertComment()"><br>
                </div>
            </form>
            <%
                }
            %>

        </div>

    </div>
    <div id="MoreAboutMe">
        <h3>MoreAboutMe</h3>
        <div id="More">
            <h3>Likes</h3>
            <%
                st = con.createStatement();
                if (cookieMap.get(cookieFirstName)!=null) {
                    query = "SELECT * FROM `user` u,`likes` WHERE u.`firstname` like '"+cookieMap.get(cookieFirstName)+"' and u.`id`=`id_user`";
                } else {
                    query = "SELECT * FROM `user` u,`likes` WHERE u.`username` like '"+cookieMap.get(cookieName)+"' and u.`id`=`id_user`";
                }
                rs = st.executeQuery(query);
                if (rs.next()){
                    out.print("<div>"+rs.getString("like"));
                    while (rs.next()) {
                        out.print(", "+rs.getString("like"));
                    }
                    out.print("</div>");
                }
                else {
                    out.print("<div>Phasellus mattis tincidunt nibh.</div>");
                }
            %>
            <h3>Dislikes</h3>
            <%
                st = con.createStatement();
                if (cookieMap.get(cookieFirstName) != null){
                    query = "SELECT * FROM `user` u,`dislikes` WHERE u.`firstname` like '"+cookieMap.get(cookieFirstName)+"' and u.`id`=`id_user`";
                } else {
                    query = "SELECT * FROM `user` u,`dislikes` WHERE u.`username` like '"+cookieMap.get(cookieName)+"' and u.`id`=`id_user`";
                }
                rs = st.executeQuery(query);
                if (rs.next()){
                    out.print("<div>"+rs.getString("dislike"));
                    while (rs.next()) {
                        out.print(", "+rs.getString("dislike"));
                    }
                    out.print("</div>");
                }
                else {
                    out.print("<div>Nam dui erat, auctor a, dignissim quis.</div>");
                }
            %>
        </div>
    </div>
</div>

</div>
</div>


</div>
</body>
</html>
