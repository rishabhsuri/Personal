<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.io.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Use of student details</title>
</head>
<body>
<form method="post">
		 	Please enter your details --&gt;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name : &nbsp;<input type="text" name="name" style="width: 139px; height: 32px">  <br><br>
			Password : <input type="password" name="password" style="width: 141px; height: 35px"/><br><br><br /> <input
			type="submit" name="submit" value="Enter" style="height: 33px; width: 84px; "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" style="height: 32px; width: 112px; ">
	</form>
<%

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/testDB", "root", "abracadabra");
		PreparedStatement ps = cn.prepareStatement("insert into UserData(id,name,password)values(null,?,?)");
		String name = request.getParameter("name").trim();
		String password = request.getParameter("password");
		ps.setString(1, name);
		ps.setString(2, password);
		ps.executeUpdate();
		ps.close();
		cn.close();
		PrintWriter pw = response.getWriter();
		pw.println("Your data has been successfully submitted");
		response.sendRedirect("success.html");
		
	} catch (Exception e) {
		System.out.println("An error has occured");
		e.printStackTrace();
		System.out.println(e.getMessage());
	} finally {
	}

%>
</body>
</html>