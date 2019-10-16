<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - Description</title>
</head>
<body>
    <%

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");
        Statement stmt = con.createStatement();
        String movie_id = request.getParameter("movie_id");
        String qury = "select * from movies where idmovies = " + movie_id;

        ResultSet rs = stmt.executeQuery(qury);
        while (rs.next()){
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String cast = rs.getString(3);
            String genre = rs.getString(4);
            String releaseDate = rs.getString(5);
            int price = rs.getInt(6);
            String cover = rs.getString(7);
            out.print(id + " : " + name + " : " + cast + " : " + genre + " : " + releaseDate + " : " +price + " : " + cover);
            %>
                <form action="selectseats.jsp" method="get">
                    <input type="date" name="showDate">
                    <select name="time">
                        <option value="12">12PM - 3PM</option>
                        <option value="3">3PM - 6PM</option>
                        <option value="6">6PM - 9PM</option>
                    </select>
                    <input type="hidden" value="<%=id%>" name="movie_id">
                    <input type="hidden" value="<%=name%>" name="movie_name">
                    <input type="hidden" value="<%=price%>" name="movie_price">
                    <input type="submit" value="Select Seats">
                </form>
            <%
        }
    %>
</body>
</html>
