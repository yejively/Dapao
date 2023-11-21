package com.dapao.domain;

import lombok.Data;

@Data
public class FileVO {

	private int file_no; //(pk, 기본키)
	private String uuid; // uuid
	private String uploadPath;  // 파일 경로
	private String fileName; // 파일명
	private String filePath; // 파일주소
	private boolean image; // 파일타입
	private int it_no; // it_no 
	private int prod_no; // prod_no
	
	
}
