package com.util;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class C3P0Util {

    //得到一个数据源
    private static DataSource dataSource = new ComboPooledDataSource();

    public static DataSource getDataSource() {
        return dataSource;
    }

    //从数据源中得到一个连接
    public static Connection getConnection(){
        try{
            return dataSource.getConnection();
        }catch (SQLException e){
            throw new RuntimeException("服务器忙，请稍等...");
        }
    }

    //回收一个连接
    public static void release(Connection conn, Statement stmt, ResultSet rs){
        if(rs!=null){
            try{
            rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        if(stmt!=null){
            try{
                stmt.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try{
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }

}
