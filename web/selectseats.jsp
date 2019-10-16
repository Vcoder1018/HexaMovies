<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - Seat Selection</title>
</head>
<body>
<%--    <%--%>
<%--        for (int i = 1; i <= 200; i++){--%>
<%--            if(i%10 == 0){--%>

<%--                %>--%>
<%--    <button><%out.println(i);%></button>--%>
<%--                <br>--%>
<%--    <%--%>
<%--            }else{--%>
<%--                %>--%>

<%--                <button><%out.println(i);%></button>--%>

<%--                <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>


<%
    String userEmail = "vivek.dubey2869@gmail.com";
    int movie_id = Integer.parseInt(request.getParameter("movie_id"));
    String movie_name = request.getParameter("movie_name");
    int showId = 0;
    String date = request.getParameter("showDate");
    int time = Integer.parseInt(request.getParameter("time"));
    int price = Integer.parseInt(request.getParameter("movie_price"));
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
    String showDate = simpleDateFormat.format(new SimpleDateFormat("yyyy-MM-dd").parse(date));

    int totalTickets = 200;

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");
    Statement stmt = con.createStatement();

    String ticketsLeftQuery = "select sum(tickets) from bookings where `shows-movies_id` = (select id from `shows-movies` where shows = " + time + " AND movies_idmovies = " + movie_id + ") AND `show-date` like '" + showDate + "'";
    String showMovieIdQuery = "select id from `shows-movies` where shows = " + time + " AND `movies_idmovies` = " + movie_id;
    ResultSet rs = stmt.executeQuery(ticketsLeftQuery);
    while (rs.next()){
        out.println("Hurry only " + (totalTickets - rs.getInt(1)) + " Tickets are left.");

    }
    ResultSet rs2 = stmt.executeQuery(showMovieIdQuery);
    while(rs2.next()){
        showId = rs2.getInt(1);
    }






%>
<p><%=movie_name%></p>
<br>
<p>Number of tickets: </p>
<form action="confirmbooking.jsp" method="get">
    <select name="tickets">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
    </select>

    <input type="hidden" value="<%=userEmail%>" name="email">
    <input type="hidden" value="<%=movie_id%>" name="movie_id">
    <input type="hidden" value="<%=movie_name%>" name="movie_name">
    <input type="hidden" value="<%=time%>" name="time">
    <input type="hidden" value="<%=showId%>" name="showId">
    <input type="hidden" value="<%=showDate%>" name="showDate">
    <input type="hidden" value="<%=price%>" name="price">
    <input value="Book" type="submit">
</form>

</body>
</html>
