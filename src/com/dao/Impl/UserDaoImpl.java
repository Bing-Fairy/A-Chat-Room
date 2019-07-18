package com.dao.Impl;

import com.dao.UserDao;
import com.domain.Message;
import com.domain.User;
import com.util.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.awt.print.Book;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    public void addUser(User user) throws SQLException {

        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        qr.update("insert into Users values(?,?,?,?,?,?)",0,user.getNickname(),user.getPassword(),user.getSex(),user.getEmail(),user.getStatus());
    }


    public User findUser(User user) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select * from users where nickname = ? and password = ?",new BeanHandler<User>(User.class),user.getNickname(),user.getPassword());
    }


    public User findExitByName(String nickname) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select * from users where nickname = ? ",new BeanHandler<User>(User.class),nickname);
    }


    public void updateUserInfo(User user) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        qr.update("update users set status = ? where nickname = ?",user.getStatus(),user.getNickname());
    }



    public List<User> findAllUsers() throws SQLException {

        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        Object[] params={"1"};
        return qr.query("select * from users where status = ?",new BeanListHandler<User>(User.class),params);

    }


    public void addMessages(Message message) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        qr.update("insert into message values(?,?)",message.getNickname(),message.getMessages());
    }


    public List<Message> findAllMessages() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());

        return qr.query("select * from message ",new BeanListHandler<Message>(Message.class));

    }
}
