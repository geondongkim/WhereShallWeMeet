package Project04;

public class userDTO {
	private int user_no;
	private String user_name;
	private String user_pwd;
	private String user_date;
	private String user_title;	
	private String user_memo;
	private String user_location;
	private String user_lat;
	private String user_lng;
	private String user_logtime;
	
	public userDTO() {
		super();
	}
	public userDTO(String user_name, String user_date, String user_title, String user_location) {
		super();
		this.user_name = user_name;
		this.user_date = user_date;
		this.user_title = user_title;
		this.user_location = user_location;
	}
	public userDTO(String user_name, String user_pwd, String user_date, String user_title, String user_memo, String user_location,
			String user_lat, String user_lng) {
		super();
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_date = user_date;
		this.user_title = user_title;
		this.user_memo = user_memo;
		this.user_location = user_location;
		this.user_lat = user_lat;
		this.user_lng = user_lng;
	}
	public userDTO(int user_no, String user_name, String user_pwd, String user_date, String user_title, String user_memo,
			String user_location, String user_lat, String user_lng, String user_logtime) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_date = user_date;
		this.user_title = user_title;
		this.user_memo = user_memo;
		this.user_location = user_location;
		this.user_lat = user_lat;
		this.user_lng = user_lng;
		this.user_logtime = user_logtime;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getUser_memo() {
		return user_memo;
	}
	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}
	public String getUser_location() {
		return user_location;
	}
	public void setUser_location(String user_location) {
		this.user_location = user_location;
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
