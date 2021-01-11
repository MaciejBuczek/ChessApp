package com.java.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Result {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date date;
	private String oponentName;
	private String result;
	
	public Result() {}
	public Result(Integer id, Date date, String oponentName, String result) {
		super();
		this.id = id;
		this.date = date;
		this.oponentName = oponentName;
		this.result = result;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getOponentName() {
		return oponentName;
	}
	public void setOponentName(String oponentName) {
		this.oponentName = oponentName;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
