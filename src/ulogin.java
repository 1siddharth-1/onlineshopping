

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class ulogin
 */
@WebServlet("/ulogin")
public class ulogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ulogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("email");
		String pass=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","1234");
			String qr="select email,pass from regs where email=? and pass=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,id);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				HttpSession Session=request.getSession();
				Session.setAttribute("id",id);
				Session.setAttribute("pass",pass);
				RequestDispatcher rd=request.getRequestDispatcher("shopping.jsp");
				rd.forward(request,response);
			}
			else
			{
				out.println("invalid user name or pass");
			}
		}
			catch(Exception e)
			{
				out.println(e);
			}
		
	}
}


