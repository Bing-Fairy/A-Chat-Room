package com.test;

import com.dao.Impl.UserDaoImpl;
import com.dao.UserDao;
import com.domain.User;

import java.sql.SQLException;

public class C3P0Test {
    public static void main(String[] args){
        User user = new User();
        user.setNickname("aaa");
        user.setPassword("1234567890");
        user.setSex("男");
        user.setEmail("aaa@123456.com");
        UserDao ud = new UserDaoImpl();
        try {
            ud.addUser(user);
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
