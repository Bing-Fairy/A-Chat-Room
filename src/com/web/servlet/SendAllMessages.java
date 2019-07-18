package com.web.servlet;

import com.domain.Message;
import com.domain.User;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class SendAllMessages extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();


        UserService us = new UserServiceImpl();
        try {
            List<Message> Messages = us.findAllMessages();
            for(int i=0;i<Messages.size();i++){
                out.print("<font color='white'>"+Messages.get(i).getNickname()+"："+Messages.get(i).getMessages()+"</font><br>");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
