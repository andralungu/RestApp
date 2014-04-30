package Simple;

import Simple.Encryption;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement st;
    Connection con;
    String query;
    String parola;
    String username;
    String firstname;
    String secondname;
    ResultSet rs;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");
            st = con.createStatement();
            firstname = request.getParameter("firstname");
            secondname = request.getParameter("secondname");
            username = request.getParameter("user");

            query = "SELECT * FROM `user` WHERE `username`='"+ username +"'"+" AND `id_u`>2";
            parola = (String) request.getParameter("passwd");
            parola = Encryption.crypt(parola);
            String paroladb="";
            rs = st.executeQuery(query);
		
			/* if the password is correct, send the user to his/her profile page. Otherwise, sand the user back 
				to the landing page to try his/her credentials one more time or to sign up. */
            if (rs.next()) paroladb=rs.getString("password");
            if (paroladb.equals(parola)) {
                /*
                When I login with the current user I save the username into a cookie in order to use it later to
                            display home page
                 */
                Cookie cookie = new Cookie("user",username);
                cookie.setMaxAge(60*60); //1 hour
                response.addCookie(cookie);
            	response.sendRedirect("user_profile.jsp");
            }
            else {
                System.out.println(parola+" "+paroladb);
               	response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter p=response.getWriter();
        p.println("Success!");
        doGet(request,response);
    }

}
