package com.web.servlet;

import com.domain.User;
import com.service.Impl.UserServiceImpl;
import com.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        }catch (Exception e){
            e.printStackTrace();
        }
        UserService us = new UserServiceImpl();
        try {
            user = us.findUser(user);
            if(user!=null){

                user.setStatus("1");
                //更新user的登录状态
                us.updateUserInfo(user);
                request.getSession().setAttribute("u",user);//如果登录成功，就把他放到session中
                request.getRequestDispatcher("/WEB-INF/page/ChatMain.jsp").forward(request,response);
            }else{
                request.setAttribute("Error","账号或者密码输入错误");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
