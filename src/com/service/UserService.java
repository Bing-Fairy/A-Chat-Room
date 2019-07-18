package com.service;

import com.domain.Message;
import com.domain.User;

import java.util.List;

public interface UserService {

    public User findUser(User user) throws Exception;
    public User findUserByName(String nickname) throws Exception;

    public void addUser(User user) throws Exception;

    public void updateUserInfo(User user) throws Exception;

    public List<User> findAllUsers() throws Exception;

    public void addMessages(Message message) throws Exception;

    public List<Message> findAllMessages() throws Exception;
}
