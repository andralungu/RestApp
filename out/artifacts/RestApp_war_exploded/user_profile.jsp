<!DOCTYPE html>

<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>

<%!
    Statement st;
    Connection con;
    String query;
    ResultSet rs;
%>

<style type="text/css">
    #ProfilePage
    {
        /* Move it off the top of the page, then centre it horizontally */
        margin: 50px auto;
        width: 635px;

        /* For visibility. Delete me */
        border: 1px solid red;
    }

    #LeftCol
    {
        /* Move it to the left */
        float: left;

        width: 200px;
        text-align: center;

        /* Move it away from the content */
        margin-right: 20px;

        /* For visibility. Delete me */
        border: 1px solid brown;
    }

    #Photo
    {
        /* Width and height of photo container */
        width: 200px;
        height: 200px;

        /* For visibility. Delete me */
        border: 1px solid green;
    }

    #PhotoOptions
    {
        text-align: center;
        width: 200px;

        /* For visibility. Delete me */
        border: 1px solid brown;
    }

    #Info
    {
        width: 400px;
        text-align: center;

        /* Move it to the right */
        float: right;

        /* For visibility. Delete me */
        border: 1px solid blue;
    }

    #Info strong
    {
        /* Give it a width */
        display: inline-block;
        width: 100px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Info span
    {
        /* Give it a width */
        display: inline-block;
        width: 250px;

        /* For visibility. Delete me */
        border: 1px solid purple;
    }

</style>

<div id="ProfilePage">
    <div id="LeftCol">
        <div id="Photo"></div>
        <div id="ProfileOptions">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

                st = con.createStatement();
                query = "SELECT * FROM `user` WHERE `id_u`='1'";
                rs = st.executeQuery(query);
                if(rs.next()) {
                    out.print(rs.getString("firstname") + " " + rs.getString("secondname"));
                }
            %>
        </div>
    </div>

    <div id="Info">
        <p>
            <strong>Gender:</strong>
            <span>
                <%
                    st = con.createStatement();
                    query = "SELECT * FROM `user` WHERE `id_u`='1'";
                    rs = st.executeQuery(query);
                    if(rs.next()) {
                        out.print(rs.getString("gender"));
                    }
                %>
            </span>
        </p>
        <p>
            <strong>Type of user:</strong>
            <span>
                <%
                    st = con.createStatement();
                    query = "SELECT * FROM `user` WHERE `id_u`='1'";
                    rs = st.executeQuery(query);
                    if(rs.next()) {
                        out.print(rs.getString("type"));
                    }
                %>
            </span>
        </p>
        <p>
            <strong>Birthday:</strong>
            <span>
               <%
                   st = con.createStatement();
                   query = "SELECT * FROM `user` WHERE `id_u`='1'";
                   rs = st.executeQuery(query);
                   if(rs.next()) {
                       out.print(rs.getString("bmonth") + "/" + rs.getString("bday") + "/" + rs.getString("byear"));
                   }
               %>
            </span>
        </p>
        <p>
            <strong>Address:</strong>
            <span>
                <form action="Address" method="POST">
                        <div> <INPUT TYPE=TEXT NAME=addr SIZE=15> <br> </div>
                        <INPUT TYPE=SUBMIT VALUE="Update your address">
                </form>
            </span>
        </p>
        <p>
            <strong>Phone number:</strong>
            <span>
                <form action="Phone" method="POST">
                    <div> <INPUT TYPE=TEXT NAME=phone SIZE=15> <br> </div>
                    <INPUT TYPE=SUBMIT VALUE="Update your phone no">
                </form>
            </span>
        </p>
        <p>
            <strong>Email address:</strong>
            <span>
                <%
                    st = con.createStatement();
                    query = "SELECT * FROM `user` WHERE `id_u`='1'";
                    rs = st.executeQuery(query);
                    if(rs.next()) {
                        out.print(rs.getString("username"));
                    }
                %>
            </span>
        </p>
    </div>

    <!-- Needed because other elements inside ProfilePage have floats -->
    <div style="clear:both"></div>
</div>

</body>
</html>
