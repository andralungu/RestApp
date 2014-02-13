package Simple;

import Simple.Encryption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement st;
    Connection con;
    String query;
    String parola;
    String username;
    ResultSet rs;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/getmoving", "root", "");
            st = con.createStatement();
            System.out.println("To out-put All the request-attributes received from request - ");


            username = request.getParameter("user");
            query = "SELECT * FROM `user` WHERE `username`='"+ username +"'"+" AND `id_u`>2";
            parola = (String) request.getParameter("passwd");
            System.out.println(parola);
            System.out.println(username);
            parola = Encryption.crypt(parola);
            String paroladb="";
            rs = st.executeQuery(query);
		
			/* if the password is correct, send the user to his/her profile page. Otherwise, sand the user back 
				to the landing page to try his/her credentials one more time or to sign up. */
            if (rs.next()) paroladb=rs.getString("password");
            if (paroladb.equals(parola)) {
            	request.getRequestDispatcher("user_profile.jsp").forward(request, response);
            }
            else {
                System.out.println(parola+" "+paroladb);
               	request.getRequestDispatcher("index.jsp").forward(request, response);
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
