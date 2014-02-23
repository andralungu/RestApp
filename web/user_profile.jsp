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

    <LINK href="css/default.css" rel="stylesheet" type="text/css"/>

    <LINK href="css/fonts.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.css">
    <script src="assets/javascripts/jquery-1.11.0.min.js"></script>
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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="js/jquery.fileupload-image.js"></script>

<%-- jQuery script for uploading pictures --%>
<script>
    $('#fileupload').fileupload({
        url: '//jquery-file-upload.appspot.com/',
        dataType: 'json',
        // Enable image resizing, except for Android and Opera,
        // which actually support image resizing, but fail to
        // send Blob objects via XHR requests:
        disableImageResize: /Android(?!.*Chrome)|Opera/
                .test(window.navigator && navigator.userAgent),
        previewMaxWidth: 800,
        previewMaxHeight: 800,
        previewCrop: true // Force cropped images
    }).on('fileuploadprocessalways', function (e, data) {
        var index = data.index,
                file = data.files[index],
                node = $(data.context.children()[index]);
        if (file.preview) {
            node
                    .prepend('<br/>')
                    .prepend(file.preview)
        }
        if (file.error) {
            node
                    .append('<br/>')
                    .append($('<span class="text-danger"/>').text(file.error));
        }
    });
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
            <div id="logo">
                <img class="logo" width="350" height="100" style="max-height: 100%" src="assets/images/logo.png">
            </div>

            <div id="menu">
                <ul>
                    <li><a href="#" accesskey="1" title="">Homepage</a></li>
                    <li><a href="#" accesskey="2" title="">Events</a></li>
                    <li><a href="#" accesskey="3" title="">Organization</a></li>
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
        width: 635px;

        /* For visibility. Delete me */
        border: 1px solid red;
    }

    #LeftCol {
        /* Move it to the left */
        float: left;

        width: 200px;
        text-align: center;

        /* Move it away from the content */
        margin-right: 20px;

        /* For visibility. Delete me */
        border: 1px solid brown;
    }

    #Photo {
        /* Width and height of photo container */
        width: 200px;
        height: 200px;

        /* For visibility. Delete me */
        border: 1px solid green;
    }

    #PhotoOptions {
        text-align: center;
        width: 200px;

        /* For visibility. Delete me */
        border: 1px solid brown;
    }

    #Rating {
        /* Give it a width */
        display: inline-block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Comments {
        /* Give it a width */
        display: inline-block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Likes {
        /* Give it a width */
        display: inline-block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Dislikes {
        /* Give it a width */
        display: inline-block;
        width: 300px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Info {
        width: 400px;
        text-align: center;

        /* Move it to the right */
        float: right;

        /* For visibility. Delete me */
        border: 1px solid blue;
    }

    #Info strong {
        /* Give it a width */
        display: inline-block;
        width: 100px;

        /* For visibility. Delete me */
        border: 1px solid orange;
    }

    #Info span {
        /* Give it a width */
        display: inline-block;
        width: 250px;

        /* For visibility. Delete me */
        border: 1px solid purple;
    }

</style>

<div id="page-wrapper">
<div id="page" class="container">
<div id="ProfilePage">
<div id="LeftCol">
    <div id="Photo">
        <form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data"
              class="">
            <!-- Redirect browsers with JavaScript disabled to the origin page -->
            <noscript>&lt;input type="hidden" name="redirect"
                value="http://blueimp.github.io/jQuery-File-Upload/"&gt;</noscript>
            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
            <div class="fileupload-buttonbar">
                <div class="fileupload-buttons">
                    <!-- The fileinput-button span is used to style the file input field as button -->
            <span class="fileinput-button ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                  role="button" aria-disabled="false"><span
                    class="ui-button-icon-primary ui-icon ui-icon-plusthick"></span><span class="ui-button-text">
                <span>Add files...</span>

            </span><input type="file" name="files[]" multiple=""></span>
                    <button type="submit"
                            class="start ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                            role="button" aria-disabled="false"><span
                            class="ui-button-icon-primary ui-icon ui-icon-circle-arrow-e"></span><span
                            class="ui-button-text">Start upload</span></button>
                    <button type="reset"
                            class="cancel ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                            role="button" aria-disabled="false"><span
                            class="ui-button-icon-primary ui-icon ui-icon-cancel"></span><span class="ui-button-text">Cancel upload</span>
                    </button>
                    <button type="button"
                            class="delete ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                            role="button" aria-disabled="false"><span
                            class="ui-button-icon-primary ui-icon ui-icon-trash"></span><span class="ui-button-text">Delete</span>
                    </button>
                    <input type="checkbox" class="toggle">
                    <!-- The global file processing state -->
                    <span class="fileupload-process"></span>
                </div>
                <!-- The global progress state -->
                <div class="fileupload-progress fade" style="display:none">
                    <!-- The global progress bar -->
                    <div class="progress ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar"
                         aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                        <div class="ui-progressbar-value ui-widget-header ui-corner-left"
                             style="display: none; width: 0%;"></div>
                    </div>
                    <!-- The extended global progress state -->
                    <div class="progress-extended">&nbsp;</div>
                </div>
            </div>
            <!-- The table listing the files available for upload/download -->
            <table role="presentation">
                <tbody class="files">
                <tr class="template-upload fade" style="">
                    <td>
                        <span class="preview"><canvas width="60" height="80"></canvas></span>
                    </td>
                    <td>
                        <p class="name">DSC08289.JPG</p>
                        <strong class="error"></strong>
                    </td>
                    <td>
                        <p class="size">326.67 KB</p>

                        <div class="progress ui-progressbar ui-widget ui-widget-content ui-corner-all"
                             role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                            <div class="ui-progressbar-value ui-widget-header ui-corner-left"
                                 style="display: none; width: 0%;"></div>
                        </div>
                    </td>
                    <td>

                        <button class="start ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                                role="button" aria-disabled="false"><span
                                class="ui-button-icon-primary ui-icon ui-icon-circle-arrow-e"></span><span
                                class="ui-button-text">Start</span></button>


                        <button class="cancel ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary"
                                role="button" aria-disabled="false"><span
                                class="ui-button-icon-primary ui-icon ui-icon-cancel"></span><span
                                class="ui-button-text">Cancel</span></button>

                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <div id="ProfileOptions">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");

            st = con.createStatement();
            query = "SELECT * FROM `user` WHERE `id_u`='1'";
            rs = st.executeQuery(query);
            if (rs.next()) {
                out.print(rs.getString("firstname") + " " + rs.getString("secondname"));
            }
        %>
    </div>
</div>

<div id="Rating">
    <p>
        <strong>Rating:</strong>

    <div class="rw-ui-container"></div>
    </p>
</div>
<div id="accordion">
    <h3>Section 1</h3>
    <div>
        <p>
            Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
            ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
            amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
            odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
        </p>
    </div>
    <h3>Section 2</h3>
    <div>
        <p>
            Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
            purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
            velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
            suscipit faucibus urna.
        </p>
    </div>
    <h3>Section 3</h3>
    <div>
        <p>
            Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
            Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
            ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
            lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
        </p>
        <ul>
            <li>List item one</li>
            <li>List item two</li>
            <li>List item three</li>
        </ul>
    </div>
    <h3>Section 4</h3>
    <div>
        <p>
            Cras dictum. Pellentesque habitant morbi tristique senectus et netus
            et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
            faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
            mauris vel est.
        </p>
        <p>
            Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
            Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
            inceptos himenaeos.
        </p>
    </div>
</div>
<div id="Comments">
    <div id="lists" class="container">
        <div id="offers_accordion">
            <p class="list_title"> Last Comments </p>



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
                    if (rs.next()) {
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
                    if (rs.next()) {
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
                   if (rs.next()) {
                       out.print(rs.getString("bmonth") + "/" + rs.getString("bday") + "/" + rs.getString("byear"));
                   }
               %>
            </span>
        </p>

        <p>
            <strong>Address:</strong>
            <span>
                <form action="Address" method="POST">
                    <div><INPUT TYPE=TEXT NAME=addr SIZE=15> <br></div>
                    <INPUT TYPE=SUBMIT VALUE="Update your address">
                </form>
            </span>
        </p>
        <p>
            <strong>Phone number:</strong>
            <span>
                <form action="Phone" method="POST">
                    <div><INPUT TYPE=TEXT NAME=phone SIZE=15> <br></div>
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
                    if (rs.next()) {
                        out.print(rs.getString("username"));
                    }
                %>
            </span>
        </p>
    </div>



        <!-- Needed because other elements inside ProfilePage have floats -->
        <div style="clear:both"></div>
    </div>
</div>
</div>

</body>
</html>

<SCRIPT>
    $("#accordion").accordion();
</SCRIPT>