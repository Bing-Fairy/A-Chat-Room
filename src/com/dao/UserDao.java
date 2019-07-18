package com.dao;

import com.domain.Message;
import com.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    /**
     * 登录查找用户名和密码
     * @param user
     * @return
     * @throws SQLException
     */
    public User findUser(User user) throws SQLException;

    /**
     * 注册添加用户
     * @param user
     * @throws SQLException
     */
    public void  addUser(User user) throws SQLException;

    /**
     * 通过昵称查找用户是否存在
     * @param nickname
     * @return
     * @throws SQLException
     */
    public User findExitByName(String nickname) throws SQLException;

    /**
     *更新用户登录状态
     * @param user
     * @throws SQLException
     */
    public void updateUserInfo(User user) throws SQLException;

    public List<User> findAllUsers() throws SQLException;

    public void addMessages(Message message) throws SQLException;

    public List<Message> findAllMessages() throws SQLException;
}
