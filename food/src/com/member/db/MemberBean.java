package com.member.db;

import java.sql.Date;

public class MemberBean {
	private int f_mem_num;
	private String f_mem_id;
	private String f_mem_pw;
	private String f_mem_name;
	private String f_mem_phone;
	private String f_mem_addr;
	private String f_mem_addr1;
	private String f_mem_addr2;
	private String f_mem_email;
	private String f_mem_nick;
	private Date f_mem_date;
	private String f_mem_ip;	

	public int getF_mem_num() {
		return f_mem_num;
	}
	
	public void setF_mem_num(int f_mem_num) {
		this.f_mem_num = f_mem_num;
	}	
	
	public String getF_mem_id() {
		return f_mem_id;
	}
	public void setF_mem_id(String f_mem_id) {
		this.f_mem_id = f_mem_id;
	}
	public String getF_mem_pw() {
		return f_mem_pw;
	}
	public void setF_mem_pw(String f_mem_pw) {
		this.f_mem_pw = f_mem_pw;
	}
	public String getF_mem_name() {
		return f_mem_name;
	}
	public void setF_mem_name(String f_mem_name) {
		this.f_mem_name = f_mem_name;
	}
	public String getF_mem_phone() {
		return f_mem_phone;
	}
	public void setF_mem_phone(String f_mem_phone) {
		this.f_mem_phone = f_mem_phone;
	}
	public String getF_mem_addr() {
		return f_mem_addr;
	}
	public void setF_mem_addr(String f_mem_addr) {
		this.f_mem_addr = f_mem_addr;
	}
	public String getF_mem_addr1() {
		return f_mem_addr1;
	}
	public void setF_mem_addr1(String f_mem_addr1) {
		this.f_mem_addr1 = f_mem_addr1;
	}
	public String getF_mem_addr2() {
		return f_mem_addr2;
	}
	public void setF_mem_addr2(String f_mem_addr2) {
		this.f_mem_addr2 = f_mem_addr2;
	}
	public String getF_mem_email() {
		return f_mem_email;
	}
	public void setF_mem_email(String f_mem_email) {
		this.f_mem_email = f_mem_email;
	}
	public String getF_mem_nick() {
		return f_mem_nick;
	}
	public void setF_mem_nick(String f_mem_nick) {
		this.f_mem_nick = f_mem_nick;
	}
	public Date getF_mem_date() {
		return f_mem_date;
	}
	public void setF_mem_date(Date f_mem_date) {
		this.f_mem_date = f_mem_date;
	}
	public String getF_mem_ip() {
		return f_mem_ip;
	}
	public void setF_mem_ip(String f_mem_ip) {
		this.f_mem_ip = f_mem_ip;
	}

	@Override
	public String toString() {
		return "MemberBean [f_mem_num=" + f_mem_num + ", f_mem_id=" + f_mem_id + ", f_mem_pw=" + f_mem_pw
				+ ", f_mem_name=" + f_mem_name + ", f_mem_phone=" + f_mem_phone + ", f_mem_addr=" + f_mem_addr
				+ ", f_mem_addr1=" + f_mem_addr1 + ", f_mem_addr2=" + f_mem_addr2 + ", f_mem_email=" + f_mem_email
				+ ", f_mem_nick=" + f_mem_nick + ", f_mem_date=" + f_mem_date + ", f_mem_ip=" + f_mem_ip
				+ "]";
	}	

}
