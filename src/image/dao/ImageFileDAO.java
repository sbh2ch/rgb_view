package image.dao;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import image.vo.ImageFileVO;

public class ImageFileDAO
{
  private SqlSession session = null;
  
  public ImageFileDAO() {
    session = MyAppSqlConfig.getSqlSessionInstance();
  }
  
  public ImageFileVO selectImage(ImageFileVO img) {
    return (ImageFileVO)session.selectOne("kosc.br.goci.dataMapper.selectImage", img);
  }
  
  public void insertImage(ImageFileVO img) {
    session.insert("kosc.br.goci.dataMapper.insertImage", img);
    session.commit();
  }
}