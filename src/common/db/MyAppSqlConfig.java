package common.db;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyAppSqlConfig
{
  private static final org.apache.ibatis.session.SqlSession sqlMapper;
  
  static
  {
    try
    {
      String resource = "config/mybatis/sqlMapConfig.xml";
      java.io.Reader reader = org.apache.ibatis.io.Resources.getResourceAsReader(resource);
      SqlSessionFactory sqlFactory = new SqlSessionFactoryBuilder().build(reader);
      sqlMapper = sqlFactory.openSession();
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException("Error initializing MyAppSqlConfig class. Cause: " + e);
    } }
  
  public MyAppSqlConfig() {}
  
  public static org.apache.ibatis.session.SqlSession getSqlSessionInstance() { return sqlMapper; }
}