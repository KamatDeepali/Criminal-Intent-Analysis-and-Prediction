<!--
 *  ViewResult.jsp
 *  
 *
 * Classical  : To fetch the value  from data base and represent it to the user
 * 
 * @version   : CrimeChicago.java,v 1.1 2015/30/04 22:34:10 
 * 
 * @author    :  Apurwa Dandekar  Id$ ard5145
 *               Deepali Kamat Id$ ddk9074  
 *               Eric Fortunato Id$ eef2302
 * 
 */-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="DatabaseConnection.*"
	isErrorPage="false"%>
<%@page language="java" import="java.sql.*" isErrorPage="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./style.css" />
<title>Crime Detection For Chicago</title>
</head>
<body id="body2">
	<div id="one1" style="width: 60%; float: left">
		<h2>
			<u>Crime Prediction</u>
		</h2>
		<table border=5 cellspacing=10 cellpadding=10 width="100%">
			<%
				//conect to the database
				DbConnection db = new DbConnection();
				db.connect();
				HttpSession sess = request.getSession();
				//fetch ward number and month from the http request
				String wardNumber = request.getParameter("wardNom");
				int wardNum = Integer.parseInt(wardNumber);
				String month = request.getParameter("monthNum");

				PreparedStatement st;
				String risk1 = "";
				String pArsons = "";
				String Pbattery = "";
				String Pburglary = "";
				String Pgambling = "";
				String Phomicide = "";
				String pKidnapp = "";
				String POffemceChild = "";
				String pProstitution = "";
				String pRobbery = "";
				String pSexualAssault = "";
				String pTheft = "";

				//fetch the risk factor for that month for that ward from the database
				String selectSQL = "select risk from RISKWARDMONTH where C_MONTH=? AND ward=?";
				try {
					st = db.con.prepareStatement(selectSQL);
					st.setString(1, month);
					st.setInt(2, wardNum);
					ResultSet rs1 = st.executeQuery();

					while (rs1.next()) {
						risk1 = rs1.getString("risk");
					}

					st.close();
					//fetch statistical values for crime types from the database
					selectSQL = "select pArsons, Pbattery,Pburglary,Pgambling,Phomicide,pKidnapp,POffemceChild,pProstitution,pRobbery,pSexualAssault,pTheft from percenatge where ward=?";

					st = db.con.prepareStatement(selectSQL);
					st.setInt(1, wardNum);
					rs1 = st.executeQuery();

					while (rs1.next()) {
						pArsons = rs1.getString("pArsons");
						Pbattery = rs1.getString("Pbattery");
						Pburglary = rs1.getString("Pburglary");
						Pgambling = rs1.getString("Pgambling");
						Phomicide = rs1.getString("Phomicide");
						pKidnapp = rs1.getString("pKidnapp");
						POffemceChild = rs1.getString("POffemceChild");
						pProstitution = rs1.getString("pProstitution");
						pRobbery = rs1.getString("pRobbery");
						pSexualAssault = rs1.getString("pSexualAssault");
						pTheft = rs1.getString("pTheft");
					}

				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				if (wardNumber.equals("0")) {
			%>
			<!-- Present the data to the user -->
			<tr>
				<td>The location you have entered doesn't exist please go to
					the <a href='index.html'> link</a> and enter proper location
				</td>
			</tr>
			<%
				} else {
			%>

			<tr>
				<td colspan="2">The location you have selected comes under ward
					<b><%=wardNumber%></b>
				</td>
			</tr>
			<tr>
				<td>The crime prediction for ward<b> <%=wardNumber%></b> in <b><%=month%></b>
					is:
				</td>
				<%
					if (risk1.equals("VH")) {
				%>

				<td style="background-color: red; width: 50px">VERY HIGH</td>
			</tr>
			<%
				} else if (risk1.equals("H")) {
			%>


			<td style="background-color: yellow; width: 50px">HIGH</td>
			</tr>
			<%
				} else if (risk1.equals("L")) {
			%>


			<td style="background-color: green; width: 50px">LOW</td>
			</tr>
			<%
				} else if (risk1.equals("VL")) {
			%>


			<td style="background-color: blue; width: 50px">VERY LOW</td>
			</tr>
			<%
				}
			%>

			<tr>
				<td>The overall risk factor for ward <b><%=wardNumber%></b> is:
					<div>
						<b><i> <img src="map.jpg"
							alt="Hover to reveal the location on the map and its Crime Rate"
							onmouseover="this.src='map.jpg';" onmouseout="this.src='#';" />
						</i></b>
					</div>
				</td>
				<%
					//as per the analysis made depending upon the box plot divided each ward into 4 risk factors.

						if (wardNum == 1 || wardNum == 4 || wardNum == 5
								|| wardNum == 7 || wardNum == 8 || wardNum == 9
								|| wardNum == 10 || wardNum == 18 || wardNum == 26
								|| wardNum == 29 || wardNum == 32 || wardNum == 37) {
				%>
				<td style="background-color: yellow; width: 50px">HIGH</td>
				<%
					} else if (wardNum == 11 || wardNum == 12 || wardNum == 13
								|| wardNum == 14 || wardNum == 22 || wardNum == 23
								|| wardNum == 25 || wardNum == 30 || wardNum == 31
								|| wardNum == 35 || wardNum == 43 || wardNum == 44
								|| wardNum == 46 || wardNum == 49) {
				%>
				<td style="background-color: green; width: 50px">LOW</td>
				<%
					} else if (wardNum == 2 || wardNum == 3 || wardNum == 6
								|| wardNum == 15 || wardNum == 16 || wardNum == 17
								|| wardNum == 20 || wardNum == 21 || wardNum == 24
								|| wardNum == 27 || wardNum == 28 || wardNum == 34
								|| wardNum == 42) {
				%>
				<td style="background-color: red; width: 50px">VERY HIGH</td>
				<%
					} else {
				%>
				<td style="background-color: blue; width: 50px">VERY LOW</td>
				<%
					}
				%>
			</tr>
		</table>

		<!-- Provid the statistics for each crime type for the selected ward -->

		<h3>The Statistics of each crime type for the given ward over 10
			years</h3>
		<table border=5 cellspacing=10 cellpadding=10 width="100%">
			<tr>
				<th>Crime Type</th>
				<th style="width: 50px">Percentage</th>
			</tr>
			<tr>
				<td>KIDNAPPING</td>
				<td style="width: 50px"><%=pKidnapp%></td>
			</tr>

			<tr>
				<td>ARSON</td>
				<td style="width: 50px"><%=pArsons%></td>
			</tr>
			<tr>
				<td>BATTERY</td>
				<td style="width: 50px"><%=Pbattery%></td>
			</tr>

			<tr>
				<td>THEFT</td>
				<td style="width: 50px"><%=pTheft%></td>
			</tr>
			<tr>
				<td>ROBBERY</td>
				<td style="width: 50px"><%=pRobbery%></td>
			</tr>
			<tr>
				<td>HOMICIDE</td>
				<td style="width: 50px"><%=Phomicide%></td>
			</tr>
			<tr>
				<td>OFFENSE INVOLVING CHILDREN</td>
				<td style="width: 50px"><%=POffemceChild%></td>
			</tr>
			<tr>
				<td>CRIM SEXUAL ASSAULT</td>
				<td style="width: 50px"><%=pSexualAssault%></td>
			</tr>
			<tr>
				<td>BURGLARY</td>
				<td style="width: 50px"><%=Pburglary%></td>
			</tr>
			<tr>
				<td>GAMBLING</td>
				<td style="width: 50px"><%=Pgambling%></td>
			</tr>
		</table>
	</div>
	<div id="two2"
		style="width: 40%; float: left; background: url(crimetypes.jpg)">
	</div>
	<%
		}
	%>
</body>
</html>