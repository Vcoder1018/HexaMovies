<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - History</title>
</head>
<body>
    <h3>Booking History...</h3>
    <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");

        Statement stmt = con.createStatement();
        String historyQuery = "select `iduser-movies`, movies.name, `bookig-date`, `tickets`, bookings.`price` from bookings INNER JOIN movies ON bookings.`movies_idmovies` = movies.idmovies where users_email = 'vivek.dubey2869@gmail.com'";
        ResultSet rs = stmt.executeQuery(historyQuery);
        %>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Movie Name</th>
            <th>Booked Date</th>
            <th>No of Tickets</th>
            <th>Total Price</th>
        </tr>
        <% while(rs.next()){ %>
        <tr>
            <td> <%= rs.getInt(1) %></td>
            <td> <%= rs.getString(2) %></td>
            <td> <%= rs.getString(3) %></td>
            <td> <%= rs.getInt(4) %></td>
            <td> <%= rs.getInt(5) %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
