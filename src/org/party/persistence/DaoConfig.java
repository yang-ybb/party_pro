package org.party.persistence;

import org.apache.ibatis.session.*;
import org.apache.ibatis.io.*;
import java.io.*;
import java.util.*;

public class DaoConfig {
    private static final String properties = "dbinfo/dbInfo.properties";
    private static final String source = "org/party/persistence/DaoConfig.xml";
    private static SqlSessionFactoryBuilder builder = null;
    private static SqlSessionFactory sessionsFactory = null;
    static {
        try {
            Reader reader = Resources.getResourceAsReader(source);
            Properties prop = Resources.getResourceAsProperties(properties);
            builder = new SqlSessionFactoryBuilder();
            sessionsFactory = builder.build(reader, prop);
            System.out.println("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSession getNewSession() {
        return sessionsFactory.openSession();
    }
}
