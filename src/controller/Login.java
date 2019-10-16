package controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Login extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
        response.sendRedirect(request.getContextPath() + "/moviehome.jsp");
    }
}
