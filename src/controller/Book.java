package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Book extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{

            String email = req.getParameter("email");
            int movie_id = Integer.parseInt(req.getParameter("movie_id"));
            System.out.println(movie_id);
            int show_id = Integer.parseInt(req.getParameter("showId"));
            java.util.Date date=new java.util.Date();
            java.sql.Date bookingDate=new java.sql.Date(date.getTime());
            System.out.println("date to be inserted (Booking)" + bookingDate);
            String dateS = req.getParameter("showDate");
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String showDate = simpleDateFormat.format(new SimpleDateFormat("yyyy-MM-dd").parse(dateS));
            System.out.println("date to be inserted (Show Date)" + showDate);
            int tickets = Integer.parseInt(req.getParameter("tickets"));
            int price = Integer.parseInt(req.getParameter("price"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");
            Statement stmt = con.createStatement();
            String qury = "INSERT INTO `hexa`.`bookings` (`users_email`, `movies_idmovies`, `shows-movies_id`, `bookig-date`, `show-date`, `tickets`, `price`) VALUES ('"+ email +"', '"+ movie_id +"', '"+ show_id +"', '"+ bookingDate +"', '"+ showDate +"', '"+ tickets +"', '"+ price +"');";
            int rows = stmt.executeUpdate(qury);
            System.out.println(rows + " Updated");
        }catch (Exception e){

        }

        resp.sendRedirect(req.getContextPath()+"/history.jsp");
    }
}
