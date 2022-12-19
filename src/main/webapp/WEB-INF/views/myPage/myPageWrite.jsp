<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>

<link rel="stylesheet" href="../resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="/resources/css/uikit.min.css">

<link rel="stylesheet" href="/resources/css/community/sub.css" />
<link rel="stylesheet" href="/resources/css/community/base.css" />
<link rel="stylesheet" href="/resources/css/community/contents.css" />

<body>
<form action="./myPageList" name="search-form" autocomplete="off">
	<input type="hidden" id="memberEmail" name="memberEmail" value="" />
		<div class="wrapper">
			<div class="container">
				<div class="top-background-div"></div>
				<div class="top-container">
					<div class="profilePhotoContainer">
                  <div class="profilePhoto-text" id="profile">
                  <img style="border-radius: 50%; width:180px; height: 180px; max-width:fit-content; hidden; object-fit: cover; " src="profile/${memberProfile}" />
                  </div>
               </div><br><br>
${memberEmail }
					<div class="text" value="memberNickname">${memberNickname}</div>
					<button type="button" class="btn-normal" onclick="location.href='/profile'">프로필 수정</button>
				</div>
				<div>
					<div class="row">
						<div class="index-section">
							<div class="index-circle" onclick="location.href='./myPage?memberEmail=${memberEmail}'">
								<h5 style="font-family: 'Montserrat' !important">
									<b>즐겨찾기</b>
								</h5>
								<div>
									<h2 style="line-height: 1; font-weight: 700" id="mypick">1</h2>
								</div>
							</div>

							<div class="index-circle" onclick="myReviewData()">
								<h5 style="font-family: 'Montserrat' !important">
									<b>내가 쓴 글</b>
								</h5>
								<div>
									<h2 style="line-height: 1; font-weight: 700" id="myReview">${count}</h2>
								</div>
							</div>
							
							<div class="index-circle" onclick="myChattingData()">
                        <h5 style="font-family: 'Montserrat' !important">
                           <b>쪽지함</b>
                        </h5>
                        <div>
                           <h2 style="line-height: 1; font-weight: 700" id="myChatting">0</h2>
                        </div>
                     </div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="section-divider"></div> -->
			<div class="container uk-container-large" id="mypageData">
				<!-- 즐겨찾기 div -->
				<div class="uk-padding-small">
					<div class="section-title-container">
						<h3 class="section-title">
							<b>내가쓴글</b>
						</h3>
					</div>
					<div class="drop_menu mouse_click">
                           <div class="board">
                              <table class="list type1">
                                 <caption>전체 게시물 : 번호, 제목, 글쓴이, 날짜, 조회수, 추천수로 구성됨</caption>
                                 <colgroup>
                                    <col class="width_60 display_sm_none" />
                                    <col />
                                    <col class="width_100 width_phone_80" />
                                    <col class="width_100 width_phone_80 display_sm_none" />
                                    <col class="width_80 display_md_none" />
                                    <col class="width_80 display_md_none" />
                                 </colgroup>
                                 <thead>
                                    <tr>
                                       <th scope="col" class="display_sm_none">번호</th>
                                       <th scope="col">제목</th>
                                       <th scope="col">글쓴이</th>
                                       <th scope="col" class="display_sm_none">날짜</th>
                                       <th scope="col" class="display_md_none">조회 수</th>
                                       <th scope="col" class="display_md_none">추천 수</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:choose>
                                       <c:when
                                          test="${articleList!=null && pageInfo.listCount>0 }">
                                          <tr class="notice">
                                             <td class="num display_sm_none">공지</td>
                                             <td class="text_left color_black"><a
                                                href="상세보기.html" class="subject"> <span
                                                   class="cate color_bluelight display_none display_sm_block">[공지]</span>공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지공지
                                                   <span class="comment">14</span> <i class="icon_img"></i>
                                                   <i class="icon_new"></i>
                                             </a></td>
                                             <td class="text_left color_black"><a href="#"
                                                class="writer" onclick="return false;"> <!-- <span
                                       class="writer_img"> <img
                                          src="assets/img/sub/writer_comgom.png" alt="글쓴이 사진"></span> -->
                                                   컴곰
                                             </a></td>
                                             <td class="display_sm_none">2021.02.09</td>
                                             <td class="display_md_none">1</td>
                                             <td class="display_md_none">1</td>
                                          </tr>
                                          <c:forEach var="article" items="${articleList }">
                                             <input type="hidden" href="./comDetail?memberEmail=${memberEmail }">
                                             <tr>
                                                <td class="num display_sm_none">${article.comNum }</td>
                                                <td class="text_left color_black"><a href="./comDetail?comNum=${article.comNum}&memberEmail=${memberEmail }"
                                                   class="subject"> ${article.comTitle}
                                                </a></td>
                                                <td class="text_left color_black"><a href="#"
                                                   class="writer" onclick="return false;">${article.memberNickname}
                                                </a></td>
                                                <td class="display_sm_none">${article.comDate}</td>
                                                <td class="display_md_none">${article.comViews}</td>
                                                <td class="display_md_none">${article.comReco}</td>
                                             </tr>
                                          </c:forEach>
                                       </c:when>
                                    </c:choose>
                                 </tbody>
                              </table>
                           </div>
                           </div>
                           
                           <div class="paging-in" style="text-align: center;">
                                 <c:choose>
                                    <c:when test="${pageInfo.page<=1}">
                                 <img src="/resources/images/community/prev.png">&nbsp;
                              </c:when>
                                    <c:otherwise>
                                       <a href="myPageList?memberEmail=${memberEmail }&page=${pageInfo.page-1}"><img src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
                                 </c:choose>
                              <c:forEach var="i" begin="${pageInfo.startPage }"
                                 end="${pageInfo.endPage }">
                                 <c:choose>
                                    <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                                    <c:otherwise>
                                       <a href="myPageList?memberEmail=${memberEmail }&page=${i}">[${i }]</a>
                                    </c:otherwise>
                                 </c:choose> 
                              </c:forEach>
                              
                              <%-- <div>
                              <c:forEach var="i" begin="${pageInfo.startPage }"
                                 end="${pageInfo.endPage }">
                                 <c:choose>
                                    <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                                    <c:otherwise>
                                       <a href="communitylist?page=${i}">[${i }]</a>
                                    </c:otherwise>
                                 </c:choose> 
                              </c:forEach>
                              </div> --%>
                                 <c:choose>
                                    <c:when test="${pageInfo.page>=pageInfo.maxPage }">
                              </c:when>
                                    <c:otherwise>
                                       <a href="myPageList?memberEmail=${memberEmail }&page=${pageInfo.page+1}">&nbsp;<img src="/resources/images/community/next.png"></a>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
	                      </div>
                        </div>
                       </div>
		</form>
</body>
</html>