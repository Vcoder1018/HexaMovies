<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - Confirm Booking</title>
</head>
<body>
<%
    String userEmail = "vivek.dubey2869@gmail.com";
    int movie_id = Integer.parseInt(request.getParameter("movie_id"));
    String movie_name = request.getParameter("movie_name");
    int showId = 0;
    String date = request.getParameter("showDate");
    int time = Integer.parseInt(request.getParameter("time"));
    int price = Integer.parseInt(request.getParameter("price"));
    int tickets = Integer.parseInt(request.getParameter("tickets"));
    int finalPrice = price*tickets;

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

<h3>Confirm Booking</h3>
<%
    out.println("User Id : " + userEmail);
    %><br><%
    out.println("Movie : " + movie_name);
    %><br><%
    out.println("Show Date : " + showDate);
    %><br><%
    if(time == 12){
        out.println("Show time : " + time + " - " + 3);
    }else
    out.println("Show time : " + time + " - " + (time+3));
    %><br><%
    out.println("Tickets : " + tickets);
    %><br><%
    out.println("Ticket Price : " + finalPrice);
%>

<form action="Book" method="get">
    <input type="hidden" value="<%=userEmail%>" name="email">
    <input type="hidden" value="<%=movie_id%>" name="movie_id">
    <input type="hidden" value="<%=showId%>" name="showId">
    <input type="hidden" value="<%=showDate%>" name="showDate">
    <input type="hidden" value="<%=tickets%>" name="tickets">
    <input type="hidden" value="<%=finalPrice%>" name="price">
    <input value="Book" type="submit">
</form>

</body>
</html>
