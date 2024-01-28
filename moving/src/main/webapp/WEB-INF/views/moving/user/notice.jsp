<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include  file="../../inc/header.jsp" %>

    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">공지 리스트</h2>
      <div id="container" class="container">
        <div class="as_board-list">
          <div class="list-tabs type2">
            <span class="list-tabs__item is-active">공지사항</span>
          </div>

          <div class="as_board-list__head">
            <h3 class="as_board-list__notice">총 <strong>${paging.listtotal}개</strong>의 게시글이 있습니다.</h3>
            <div class="srch-box">
              <div class="select-box">
                <select id="srchKey" class="select">
                  <option value="TitleNm">제목</option>
                  <option value="ContentsNm">내용</option>
                </select>
              </div>
              <div class="inp-box">
                <label>
                  <input type="text" id="srchVal" class="inp bg-none" value="" placeholder="검색어를 입력해주세요.">
                </label>
                <button type="button" class="btn-del"><span class="blind">입력 내용 삭제</span></button>
                <button type="button" class="btn-srch"><span class="blind">입력어로 검색</span></button>
              </div>
            </div>
          </div>

          <div class="as_board-list__table">
            <table>
              <colgroup>
                <col style="width:10%">
                <col>
                <col style="width:13%">
                <col style="width:13%">
                <col style="width:12%">
              </colgroup>
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>구분</th>
                  <th>등록일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
				<c:choose>
					<c:when test="${list.size() > 0}">
						<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${paging.listtotal-paging.pstartno-status.index}</td>
							<td><a href="${pageContext.request.contextPath}/noticeDetail.as?board_no=${dto.board_no}">${dto.b_title}</a></td>
							<td>${dto.user_no==0?"관리자":"Unknown"}</td>
							<td>${dto.b_crtdate.split(' ')[0]}</td>
							<td>${dto.b_hit}</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
						   <td colspan="8" class="is-empty">
						      <p>등록된 게시글이 없습니다.</p>
						   </td>
						</tr>
					</c:otherwise>
				</c:choose>
              </tbody>
            </table>
          </div>

          <div class="pagenate">
			<c:if test="${paging.startPage>=paging.bottomlimit}">
				<li class="prev">
					<a href="${pageContext.request.contextPath}/notice.as?pstartno=${(paging.startPage-2)*paging.onepagelimit}"><span class="blind">이전 페이지</span></a>
				</li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
				<li <c:if test="${paging.currentPage == i}">class="is-active"</c:if>>
					<a href="${pageContext.request.contextPath}/notice.as?pstartno=${(i-1)*paging.onepagelimit}">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pagetotal}">
				<li class="next">
					<a href="${pageContext.request.contextPath}/notice.as?pstartno=${paging.endPage*paging.onepagelimit}"><span class="blind">다음 페이지</span></a>
				</li>
			</c:if>
          </div>
        </div>
      </div>
    </main>
    <!-- //main -->
    
<%@ include  file="../../inc/footer.jsp" %>
