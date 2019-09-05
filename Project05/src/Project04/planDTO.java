package Project04;

public class planDTO {
	private int user_no;
	private String user_name1;
	private String user_name2;
	private String user_pwd;
	private String user_date;
	private String user_title;
	private String user_lat;
	private String user_lng;
	private String user_logtime;
	public planDTO() {
		super();
	}
	public planDTO(String user_name1, String user_name2, String user_pwd, String user_date, String user_title, String user_lat,
			String user_lng) {
		super();
		this.user_name1 = user_name1;
		this.user_name2 = user_name2;
		this.user_pwd = user_pwd;
		this.user_date = user_date;
		this.user_title = user_title;
		this.user_lat = user_lat;
		this.user_lng = user_lng;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name1() {
		return user_name1;
	}
	public String getUser_name2() {
		return user_name2;
	}
	public void setUser_name1(String user_name1) {
		this.user_name1 = user_name1;
	}
	public void setUser_name2(String user_name2) {
		this.user_name2 = user_name2;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public String getUser_title() {
		return user_title;
	}
	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}
	public String getUser_lat() {
		return user_lat;
	}
	public void setUser_lat(String user_lat) {
		this.user_lat = user_lat;
	}
	public String getUser_lng() {
		return user_lng;
	}
	public void setUser_lng(String user_lng) {
		this.user_lng = user_lng;
	}
	public String getUser_logtime() {
		return user_logtime;
	}
	public void setUser_logtime(String user_logtime) {
		this.user_logtime = user_logtime;
	}
}
