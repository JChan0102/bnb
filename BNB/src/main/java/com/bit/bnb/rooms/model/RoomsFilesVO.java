package com.bit.bnb.rooms.model;

public class RoomsFilesVO {
	private String roomsId;
	private String file_name;
	private String file_priority;

	public final String getRoomsId() {
		return roomsId;
	}

	public final void setRoomsId(String roomsId) {
		this.roomsId = roomsId;
	}

	public final String getFile_name() {
		return file_name;
	}

	public final void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public final String getFile_priority() {
		return file_priority;
	}

	public final void setFile_priority(String file_priority) {
		this.file_priority = file_priority;
	}

	@Override
	public String toString() {
		return "RoomsFilesVO [roomsId=" + roomsId + ", file_name=" + file_name + ", file_priority=" + file_priority
				+ "]";
	}

}
