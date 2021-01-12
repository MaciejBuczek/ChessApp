package com.java.model;

import lombok.Data;

@Data
public class Message {
	private String message;
	private String sender;
	private Integer recievierId;
}
