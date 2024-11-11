package com.ezen.spring.dao;

import java.util.List;

import com.ezen.spring.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> getList(int bno);

	List<FileVO> selectListAllFile();

	long getBnoToUuid(String uuid);

	int removeFile(String uuid);


}
