package image.vo;

public class ImageFileVO
{
  private int no;
  private String name;
  private String path;
  
  public ImageFileVO() {}
  
  public ImageFileVO(String name, String path) {
    this.name = name;
    this.path = path;
  }
  
  public int getNo() {
    return no;
  }
  
  public void setNo(int no) {
    this.no = no;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public String getPath() {
    return path;
  }
  
  public void setPath(String path) {
    this.path = path;
  }
}