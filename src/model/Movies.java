package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Movies {

    public void getMovies(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hexa", "root", "unlock");
            String query = "select idmovies, cover from movies";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()){
                int movie_id = rs.getInt(1);
                String coverURL = rs.getString(2);
            }
        }catch (Exception e){
            System.out.println("Here Error...");
        }

    }

}
