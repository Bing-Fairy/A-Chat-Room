package com.web.servlet;

import com.domain.User;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

public class UpdateLoginPeople extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();


        UserService us = new UserServiceImpl();
        try {
            List<User>  LoginedUsers = us.findAllUsers();
            for(int i=0;i<LoginedUsers.size();i++){
                out.print("<font color='white'>"+LoginedUsers.get(i).getNickname()+" "+LoginedUsers.get(i).getSex()+"</font><br>");
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
