<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> Board Detail Page </h1>
	<hr>
	<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<div class="mb-3">
		 <label for="n" class="form-label">no.</label>
		 <input type="text" class="form-control" id="n" value="${bvo.bno }" readonly>
	</div>
	<div class="mb-3">
		 <label for="t" class="form-label">title</label>
		 <input type="text" class="form-control" id="t" value="${bvo.title }" readonly>
	</div>
	<div class="mb-3">
		 <label for="w" class="form-label">writer</label>
		 <input type="text" class="form-control" id="w" value="${bvo.writer }" readonly>
		 <label for="r" class="badge text-bg-light">regDate ${bvo.regDate }</label>
	</div>
	<div class="mb-3">
		 <label for="c" class="form-label">content</label>
		 <textarea class="form-control" id="c" rows="3" value="${bvo.content }" readonly>${bvo.content }</textarea>
	</div>
	
	<!-- file upload line -->
	<c:set value="${bdto.flist }" var="flist"></c:set>
	<div class="mb-3">
		<ul class="list-group list-group-flush">
		<!-- 파일의 개수만큼 li를 반복하여 파일 표시 타입이 1인 경우만 그림을 표시 -->
			<c:forEach items="${flist }" var="fvo">
				<li class="list-group-item">
					<c:choose>
						<c:when test="${fvo.fileType > 0 }">
							<div>
								<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}">
							</div>
						</c:when>
						<c:otherwise>
						<!-- 일반파일 : 아이콘 가져와서 다운로드 가능하게 생성 -->
						<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }"> 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
							  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
							</svg>
						</a>
						</c:otherwise>
					</c:choose>
					<div class="fw-bold">${fvo.fileName }</div>
					<span class="badge text-bg-primary rounded-pill">${fvo.regDate } / ${fvo.fileSize } Btyes</span>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.nickName" var="authNick"/>
		<c:if test="${bvo.writer == authNick}">   
			<a href="/board/modify?bno=${bvo.bno }"><button type="button">수정</button></a>
			<a href="/board/delete?bno=${bvo.bno }"><button type="button">삭제</button></a>
		</c:if>
	</sec:authorize>
	<hr>
	
	<!-- comment line -->
	<!-- comment post -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.nickName" var="authNick"/>
		<div class="input-group mb-3">
			<span class="input-group-text" id="cmtWriter">${authNick }</span>
			<input type="text" id="cmtText" class="form-control" placeholder="댓글 작성" aria-describedy="basic-addon1">
			<button type="button" id="cmtAddBtn" class="btn btn-outline-secondary">등록</button>
		</div>
		<c:set value="${authNick }" var="nick" />
	</sec:authorize>
	
	<!-- comment print -->
	<ul class="list-group" id="cmtListArea">
		<li class="list-group">
			<div class="list-group">
				<div class="fw-bold" value="${bvo.writer}">writer</div>
				Content
			</div>
			<span class="badge text-bg-light rounded-pill">reDate : ${cvo.regDate }</span>
		</li>
	</ul>
	
	<!-- comment more button -->
	<div>
		<button type="button" id="moreBtn" date-page="1" class="btn btn-dark"
		style="visibility:hidden">More +</button>
	</div>
	
	<!-- comment modal line -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="cmtWriterMod">${authNick }</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-boay">
					<input type="text" class="form-control" id="cmtTextMod">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" id="cmtModBtn" class="btn btn-primary">Changes</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	let bnoVal = `<c:out value="${bvo.bno }" />`;
	console.log(bnoVal);
	let authNick = `<c:out value="${nick }" />`;
	console.log(authNick);
	</script>

	<script type="text/javascript" src="/resources/js/boardDetailComment.js"></script>
	
	<script type="text/javascript">
		spreadCommentList(bnoVal);
	</script>

</div>

<jsp:include page="../layout/footer.jsp" />
