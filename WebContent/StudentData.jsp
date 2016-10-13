<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Student Data</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection(
					"jdbc:mysql://localhost/testDB", "root", "abracadabra");
			PreparedStatement ps = cn
					.prepareStatement("insert into UserData(id,name,password)values(null,?,?)");
			String name = request.getParameter("name").trim();
			String password = request.getParameter("password");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.executeUpdate();
			ps.close();
			cn.close();
			PrintWriter pw = response.getWriter();
			pw.println("Your data has been successfully submitted");
		} catch (Exception e) {
			System.out.println("An error has occured");
			e.printStackTrace();
		} finally {
		}
	%>
</body>

</html>