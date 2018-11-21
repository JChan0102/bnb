package com.bit.bnb.rooms.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RoomsImgVO {
	private String roomsId;
	private List<String> roomfilename;
	private List<MultipartFile> roomfile;

	public final String getRoomsId() {
		return roomsId;
	}

	public final void setRoomsId(String roomsId) {
		this.roomsId = roomsId;
	}

	public final List<String> getRoomfilename() {
		return roomfilename;
	}

	public final void setRoomfilename(List<String> roomfilename) {
		this.roomfilename = roomfilename;
	}

	public final List<MultipartFile> getRoomfile() {
		return roomfile;
	}

	public final void setRoomfile(List<MultipartFile> roomfile) {
		this.roomfile = roomfile;
	}

	@Override
	public String toString() {
		return "RoomsImgVO [roomsId=" + roomsId + ", roomfilename=" + roomfilename + ", roomfile=" + roomfile + "]";
	}

}
