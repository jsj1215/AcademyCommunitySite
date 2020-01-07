package com.care.imageboard_dto;

import java.sql.Date;

public class ImageBoardDTO {
		//======================================
		//1. 변수
		//======================================
		//게시판 작성에 필요한 변수들(table : imageboard)
		private int num;
		private String id;
		private String title;
		private String content;
		private Date savedate;
		private int hit;
		private int idgroup;
		private int likes;
		//이미지 관련된 내용을 저장하는 공간 들(table : imagetable)
		private int image_index;						//imagetable자체의 num
		private int board_num;							//imageboard의 num과 매칭될 수 있도록
		private String original_file_name;
		private String stored_file_name;				//실제 저장되는 file_name(저장시 현재 시간 +original_file_name)
		private String file_size;
		private String file_path;
		//답글(table : imageboard_reply)
		private String reply_id;
		private String reply_content;
		private Date reply_date;
		private int reply_num;
		private int step;
		private int indent;
		private int chk;								//답글 게시판 전용 num(해당 값으로 답글 삭제 되도록 한다.)
		
		
		//======================================
		//2. getter & setter
		//======================================
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
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
		public Date getSavedate() {
			return savedate;
		}
		public void setSavedate(Date savedate) {
			this.savedate = savedate;
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
		public int getLikes() {
			return likes;
		}
		public void setLikes(int likes) {
			this.likes = likes;
		}
		
		public String getOriginal_file_name() {
			return original_file_name;
		}
		public void setOriginal_file_name(String original_file_name) {
			this.original_file_name = original_file_name;
		}
		
		public int getImage_index() {
			return image_index;
		}
		public void setImage_index(int image_index) {
			this.image_index = image_index;
		}
		public int getBoard_num() {
			return board_num;
		}
		public void setBoard_num(int board_num) {
			this.board_num = board_num;
		}
		public String getStored_file_name() {
			return stored_file_name;
		}
		public void setStored_file_name(String stored_file_name) {
			this.stored_file_name = stored_file_name;
		}
		public String getFile_size() {
			return file_size;
		}
		public void setFile_size(String file_size) {
			this.file_size = file_size;
		}
		public String getFile_path() {
			return file_path;
		}
		public void setFile_path(String file_path) {
			this.file_path = file_path;
		}
		public String getReply_id() {
			return reply_id;
		}
		public void setReply_id(String reply_id) {
			this.reply_id = reply_id;
		}
		public String getReply_content() {
			return reply_content;
		}
		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}
		public int getReply_num() {
			return reply_num;
		}
		public void setReply_num(int reply_num) {
			this.reply_num = reply_num;
		}
		public Date getReply_date() {
			return reply_date;
		}
		public void setReply_date(Date reply_date) {
			this.reply_date = reply_date;
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
		public int getChk() {
			return chk;
		}
		public void setChk(int chk) {
			this.chk = chk;
		}


}
