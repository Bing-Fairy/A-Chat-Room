package com.web.servlet.check;

import com.domain.User;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class CkNameServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String nickname = request.getParameter("nickname");
/*
        else if(!nickname.matches("\\w{3,8}")){
            out.print("<font color='red'>账号需由3~8位的字母组成</font>");
        }*/
        if("".equals(nickname)){
            out.print("<br><font color='red'>账号不能为空</font>");
        }else if(!nickname.matches("^(?!_)(?!.*?_$)[a-zA-Z0-9_\\u4e00-\\u9fa5]+$")) {
            out.print("<br><font color='red'>账号为汉字、字母、数字的组合</font>");
        } else {
            UserService us = new UserServiceImpl();
            try {
                User user = us.findUserByName(nickname);
                if (user != null) {
                    out.print("<br><font color='red'>用户名已经存在</font>");
                } else {
                    out.print("<font color='green'>可以使用</font>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
