package com.service.Impl;

import com.dao.Impl.UserDaoImpl;
import com.dao.UserDao;
import com.domain.Message;
import com.domain.User;
import com.service.UserService;

import java.sql.SQLException;
import java.util.List;


public class UserServiceImpl implements UserService {

    public User findUser(User user) throws Exception {

        UserDao ud = new UserDaoImpl();
        return ud.findUser(user);
    }


    public User findUserByName(String nickname) throws Exception {
        UserDao ud = new UserDaoImpl();
        return ud.findExitByName(nickname);
    }


    public void addUser(User user) throws Exception {
        UserDao ud = new UserDaoImpl();
        ud.addUser(user);
    }


    public void updateUserInfo(User user) throws Exception {
        UserDao ud = new UserDaoImpl();
        ud.updateUserInfo(user);
    }


    public List<User> findAllUsers() throws Exception {
        UserDao ud = new UserDaoImpl();
        return ud.findAllUsers();
    }


    public void addMessages(Message message) throws Exception {
        UserDao ud = new UserDaoImpl();
        ud.addMessages(message);
    }


    public List<Message> findAllMessages() throws Exception {
        UserDao ud = new UserDaoImpl();
        return ud.findAllMessages();
    }
}
