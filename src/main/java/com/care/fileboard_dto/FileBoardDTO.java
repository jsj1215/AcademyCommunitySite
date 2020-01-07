package com.care.fileboard_dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author user
 *
 */
public class FileBoardDTO {

	private int id;
	private String name;
	private String title;
	private String content;
	private Timestamp savedate;
	private String sel;
	private String searchData;
	private int page;

	private int hit;
	private int idgroup;
	private int step;
	private int indent;
	
	private String file_name;
	private String file_name_key;
	private String file_ext;
	private String filechk;
	private long file_size;
	
	private List<MultipartFile> files;
	
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	public String getFile_ext() {
		return file_ext;
	}

	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}


	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_name_key() {
		return file_name_key;
	}
	public void setFile_name_key(String file_name_key) {
		this.file_name_key = file_name_key;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public String getFilechk() {
		return filechk;
	}
	public void setFilechk(String filechk) {
		this.filechk = filechk;
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
	public String getTitle() {
		return title;
	}

	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getIdgroup() {
		return idgroup;
	}
	public void setIdgroup(int idgroup) {
		this.idgroup = idgroup;
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
}
