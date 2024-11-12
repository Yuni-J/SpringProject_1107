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
					<span class="badge text-bg-light rounded-pill">${fvo.regDate } / ${fvo.fileSize } Btyes</span>
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
<br>
<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 컨테이너 스타일 */
/* .container-md {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
} */
.container-md {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

/* 제목 */
h1 {
    color: #6f42c1;  /* 제목 색상 */
    font-size: 2rem;
    margin-bottom: 20px;
}

/* HR 선 */
hr {
    border-color: #6f42c1;
    border-width: 2px;
    margin-top: 20px;
    margin-bottom: 30px;
}

/* 읽기 전용 입력 필드 */
input[type="text"], textarea {
    background-color: #f1f1f1; /* 배경색 변경 */
    border: 1px solid #ccc;
    font-size: 1rem;
    padding: 10px;
    border-radius: 5px;
    width: 100%;
}

textarea {
    height: 150px;
}

/* 파일 리스트 */
.list-group-item {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    padding: 15px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* 파일 다운로드 버튼 스타일 */
a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    margin-left: 10px;
}

a:hover {
    text-decoration: underline;
}

/* 댓글 입력란 */
.input-group {
    margin-bottom: 20px;
}

/* 댓글 목록 */
.list-group-item {
    margin-bottom: 15px;
}

.fw-bold {
    font-weight: bold;
    color: #333;
}

/* 댓글 작성자 이름 */
#cmtWriter {
    font-weight: bold;
    color: #6f42c1;
}

/* 댓글 작성 버튼 */
#cmtAddBtn {
    background-color: #6f42c1;
    color: white;
    border: none;
    font-weight: bold;
    border-radius: 5px;
}

#cmtAddBtn:hover {
    background-color: #5a33a1;  /* 버튼 hover 색상 */
}

/* 댓글 더보기 버튼 */
#moreBtn {
    margin-top: 20px;
}

/* 댓글 모달 */
.modal-content {
    border-radius: 8px;
    padding: 20px;
    background-color: #fff;
}

.modal-header {
    border-bottom: 2px solid #6f42c1;
}

.modal-footer {
    border-top: 2px solid #6f42c1;
}

/* 댓글 수정 모달 */
#cmtTextMod {
    width: 100%;
    margin-bottom: 15px;
}

/* 수정 및 삭제 버튼 스타일 */
a button {
    background-color: #6f42c1; /* 메인 색상 */
    color: white;
    border: none;
    font-weight: bold;
    padding: 8px 12px; /* 버튼 크기 줄임 */
    font-size: 0.9rem;  /* 폰트 크기 조정 */
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    cursor: pointer;
    margin-right: 8px; /* 버튼 간격을 좀 더 좁힘 */
}

a button:hover {
    background-color: #5a33b1;  /* 호버 시 색상 */
    transform: scale(1.05);  /* 살짝 커지는 효과 */
}

/* 삭제 버튼에 다른 스타일 적용 */
a button:nth-child(2) {
    background-color: #e74c3c; /* 삭제 버튼은 빨간색 */
}

a button:nth-child(2):hover {
    background-color: #c0392b; /* 호버 시 색상 */
    transform: scale(1.05);  /* 살짝 커지는 효과 */
}

/* 버튼 안 텍스트는 중앙 정렬 */
a button span {
    display: block;
    text-align: center;
}


</style>
