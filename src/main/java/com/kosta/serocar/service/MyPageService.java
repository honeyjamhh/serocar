package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.PageInfo;

public interface MyPageService  {
	//커뮤니티 페이징 및 서칭
	List<Community> getCommunityList(int page, String memberEmail, PageInfo pageInfo) throws Exception;
}
