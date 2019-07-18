package com.web.servlet;

import com.domain.User;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginOutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        UserService us = new UserServiceImpl();
        try {
            User user = us.findUserByName(request.getParameter("nickname"));

            user.setStatus("0");
            us.updateUserInfo(user);
            request.getSession().invalidate();//使用sessions销毁
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
