package com.care.board_replydto;

import java.sql.Timestamp;

public class BoardReplyDTO {
	private int id;
	private String name;
	private String content;
	private int step;
	private int indent;
	private int chk;
	private Timestamp savedate;
	
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
