package animal_ft;
import java.util.ArrayList;


public class UranaiDTO {

  private int id12;
  private int id60;
  private String name12;
  private String name60;
  private String detail;
  private String picture12;
  private int lover_12id;
  private String lover_12detail;
  private String lover_12picture;
  private int friend_12id;
  private String friend_12detail;
  private String friend_12picture;
  private int work_12id;
  private String work_12detail;
  private String work_12picture;
  private String lover_12name;
  private String friend_12name;
  private String work_12name;
  

  public UranaiDTO(){
  }

  public UranaiDTO(int id12, int id60,String name12, String name60, String detail, String picture12,
				   int lover_12id, String lover_12detail, String lover_12picture,
				   int friend_12id, String friend_12detail, String friend_12picture,
				   int work_12id, String work_12detail, String work_12picture,String lover_12name,String friend_12name,String work_12name)
				  {

    this.id12 = id12;
    this.id60 = id60;
    this.name12 = name12;
    this.name60 = name60;
    this.detail = detail;
    this.picture12 = picture12;
    this.lover_12id = lover_12id;
    this.lover_12detail = lover_12detail;
    this.lover_12picture = lover_12picture;
    this.friend_12id = friend_12id;
    this.friend_12detail = friend_12detail;
    this.friend_12picture = friend_12picture;
    this.work_12id = work_12id;
    this.work_12detail = work_12detail;
    this.work_12picture = work_12picture;
    this.lover_12name = lover_12name;
    this.friend_12name = friend_12name;
    this.work_12name = work_12name;
  }

  public int get12id(){
    return id12;
  }
  public int get60id(){
    return id60;
  }
  public String get12Name(){
    return name12;
  }
  public String get60Name(){
    return name60;
  }
  public String getDetail(){
    return detail;
  }
  public String get12Picture(){
    return picture12;
  }
  public int getLover_12id(){
    return lover_12id;
  }
  public String getLover_detail(){
    return lover_12detail;
  }
  public String getLover_picture(){
    return lover_12picture;
  }
  public int getFriend_12id(){
    return friend_12id;
  }
  public String getFriend_detail(){
    return friend_12detail;
  }
  public String getFriend_picture(){
    return friend_12picture;
  }
  public int getWork_12id(){
    return work_12id;
  }
  public String getWork_detail(){
    return work_12detail;
  }
  public String getWork_picture(){
    return work_12picture;
  }
  public String getLover_name(){
    return lover_12name;
  }
  public String getFriend_name(){
    return friend_12name;
  }
  public String getWork_name(){
    return work_12name;
  }

}