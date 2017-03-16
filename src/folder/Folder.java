package folder;

import java.util.ArrayList;

public class Folder
{
  private String text;
  private String iconCls;
  private ArrayList<Folder> items;
  
  public Folder(String text, String iconCls, ArrayList<Folder> items)
  {
    this.text = text;
    this.iconCls = iconCls;
    this.items = items;
  }
  
  public Folder(String text, String iconCls)
  {
    this.text = text;
    this.iconCls = iconCls;
    items = null;
  }
  
  public ArrayList<Folder> getItems() {
    return items;
  }
  
  public void setItems(ArrayList<Folder> items) {
    this.items = items;
  }
  
  public String getText() {
    return text;
  }
  
  public void setText(String text) {
    this.text = text;
  }
  
  public String getIconCls() {
    return iconCls;
  }
  
  public void setIconCls(String iconCls) {
    this.iconCls = iconCls;
  }
}