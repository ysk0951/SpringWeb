package web.ysk.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ProjectVO {
	private int num;
	private String projectName;
	private String content; 
	private Timestamp regdate;
	private int viewcnt;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "projectVO [num=" + num + ", projectName=" + projectName + ", content=" + content + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + "]";
	}
	public ProjectVO(int num, String projectName, String content, Timestamp regdate, int viewcnt) {
		this.num = num;
		this.projectName = projectName;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public ProjectVO() {
		// TODO Auto-generated constructor stub
	}
}
