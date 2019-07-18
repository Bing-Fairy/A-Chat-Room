package com.web.servlet;

import com.domain.Message;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SendMyMessage extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String nickname = request.getParameter("nickname");
        String message = request.getParameter("textContent");
        Message ms = new Message();
        ms.setNickname(nickname);
        ms.setMessages(message);

        UserService us = new UserServiceImpl();
        try {
            us.addMessages(ms);
        }catch (Exception e){
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        out.print("");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
