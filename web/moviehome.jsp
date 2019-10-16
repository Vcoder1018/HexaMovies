<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - Home</title>
</head>
<body>

    <%

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");
            String query = "select idmovies, name , cover from movies";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()){
                int movie_id = rs.getInt(1);
                String name = rs.getString(2);
                String coverURL = rs.getString(3);
                String movieDescriptionURL = request.getContextPath() + "/moviedescription.jsp" + "?movie_id=" + movie_id + "&name=" + name + "&coverURL=" + coverURL;
                %>
    <a href="<%=movieDescriptionURL%>"> <div><%out.println(movie_id + " : " + name + " : " + coverURL);%></div></a>
            <%
            }
        }catch (Exception e){
            System.out.println("Here Error...");
        }

    %>

</body>
</html>
