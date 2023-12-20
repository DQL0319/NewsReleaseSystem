package com.nrs.utils;

import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.util.Properties;

public class DbUtils {
    private static Properties properties = new Properties();
    private static DataSource source;

    static {
        try {
            String path = DbUtils.class.getClassLoader().getResource("/").getPath();
            FileInputStream fileInputStream = new FileInputStream(new File(path + "com/nrs/resources/dbcp.properties"));
            properties.load(fileInputStream);
            source = BasicDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        return source.getConnection();
    }

    public static DataSource getSource() {
        return source;
    }
}
