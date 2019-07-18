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

public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        User user = new User();
        try {
            String sex = request.getParameter("sex");
            BeanUtils.populate(user, request.getParameterMap());
            user.setSex(sex);
            user.setStatus("0");

        }catch (Exception e){
            e.printStackTrace();
        }
        UserService us = new UserServiceImpl();
        try {
            if(us.findUser(user)==null) {
                us.addUser(user);
            }
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
