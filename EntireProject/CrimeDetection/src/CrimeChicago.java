/*
 *  CrimeChicago.java
 *  
 *
 * Classical  : To fetch the form field data from the html
 * 
 * @version   : CrimeChicago.java,v 1.1 2015/30/04 22:34:10 
 * 
 * @author    : Apurwa Dandekar  Id$ ard5145
 *               Deepali Kamat Id$ ddk9074  
 *               Eric Fortunato Id$ eef2302
 * 
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseConnection.DbConnection;

/**
 * Servlet implementation class CrimeChicago
 */
@WebServlet("/CrimeChicago")
public class CrimeChicago extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrimeChicago() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * fuction : get method to process the request
	 * 
	 * @params : HttpServletRequest
	 * 
	 * @params : HttpServletResponse
	 * 
	 * @return : none
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// Create a database connection
		DbConnection db = new DbConnection();
		db.connect();
		response.setContentType("text/plain");
		// fetch a location and month entered by the user
		String location = request.getParameter("location");
		String month = request.getParameter("month");
		int wardNum = 0;
		// put the value in the sql queries to fetch the ward number for the
		// location
		String selectSQL = "select distinct ward from CHICAGOCRIMEDATA where block =?";
		PreparedStatement st;
		// execute the sql query
		try {
			st = db.con.prepareStatement(selectSQL);
			PrintWriter out = response.getWriter();
			st.setString(1, location);
			ResultSet rs = st.executeQuery();

			// extract the value from a resultset
			while (rs.next()) {
				wardNum = rs.getInt("ward");
			}
			st.close();

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		//pass the value of month and location in the url
		
		String url = "/ViewResult.jsp?wardNom=" + wardNum + "&monthNum="
				+ month;
		//dispatch the request to the jsp page
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		request.setAttribute("wardNo", wardNum);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	

}
