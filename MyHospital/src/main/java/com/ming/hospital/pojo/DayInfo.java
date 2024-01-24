package com.ming.hospital.pojo;

/*读出预约信息*/
public class DayInfo {

	private String date;//日期 (xx月xx日)
	private String week;//具体星期几  (星期x)

	public String getSpecificTime() {
		return SpecificTime;
	}

	public void setSpecificTime(String specificTime) {
		SpecificTime = specificTime;
	}

	private String fullDate;// 完整日期 (xxxx年xx月xx日)
	private String SpecificTime;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getFullDate() {
		return fullDate;
	}

	public void setFullDate(String fullDate) {
		this.fullDate = fullDate;
	}

	@Override
	public String toString() {
		return fullDate + " "+week+" "+SpecificTime;
	}
}
