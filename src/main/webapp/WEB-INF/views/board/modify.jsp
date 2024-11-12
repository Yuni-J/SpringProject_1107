<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> Board Modify Page </h1>
	<hr>
	<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<form action="/board/update" method="post" enctype="multipart/form-data">
	
		<div class="mb-3">
		 <label for="n" class="form-label">no.</label>
		 <input type="text" class="form-control" name="bno" id="n" value="${bvo.bno }" readonly>
	</div>
	<div class="mb-3">
		 <label for="t" class="form-label">title</label>
		 <input type="text" class="form-control" name="title" id="t" value="${bvo.title }">
	</div>
	<div class="mb-3">
		 <label for="w" class="form-label">writer</label>
		 <input type="text" class="form-control" id="w" value="${bvo.writer }" readonly>
		 <label for="r" class="badge text-bg-light">regDate ${bvo.regDate }</label>
	</div>
	<div class="mb-3">
		 <label for="c" class="form-label">content</label>
		 <textarea class="form-control" name="content" id="c" rows="3" value="${bvo.content }">${bvo.content }</textarea>
	</div>
	
		<!-- file 추가 -->
	<!-- 첨부파일 입력 라인 추가 -->
	<div class="mb-3">
	  <label for="file" class="form-label"></label>
	  <input type="file" class="form-control" id="file" name="files" 
	  		multiple="multiple" style="display:none">
	  <button type="button" class="btn btn-info" id="trigger">FileUpload...</button>
	</div>
	
	<!-- 첨부파일 표시 라인 추가 -->
	<div class="mb-3" id="fileZone">
	</div>
	
	
	<!-- file upload 표시라인 -->
	<c:set value="${bdto.flist }" var="flist"></c:set>
	<div class="mb-3">
		<ul class="list-group list-group-flush">
			<!-- 파일의 개수만큼 li를 반복하여 파일 표시 타입이 1인경우만 그림을 표시 -->
		  	<c:forEach items="${flist }" var="fvo">
		  		 <li class="list-group-item">
		  		 	<c:choose>
		  		 		<c:when test="${fvo.fileType > 0 }">
		  		 			<div>
		  		 				<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}">
		  		 			</div>
		  		 		</c:when>
		  		 		<c:otherwise>
		  		 			<!-- 일반파일 : 아이콘 하나 가져와서 다운로드 가능하게 생성 -->
		  		 			<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName}">
		  		 				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down-fill" viewBox="0 0 16 16">
								  <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1m-1 4v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 11.293V7.5a.5.5 0 0 1 1 0"/>
								</svg>
		  		 			</a>
		  		 		</c:otherwise>
		  		 	</c:choose>
		  		 	<div class="fw-bold">${fvo.fileName }</div>
		  		 	<span class="badge text-bg-primary rounded-pill">${fvo.regDate } / ${fvo.fileSize }Bytes</span>
		  		 	<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger btn-sm file-x">x</button>
		  		 </li>
		  	</c:forEach>
		</ul>
	</div>
	
	<button type="submit" id="regBtn">수정</button>
	<a href="/board/list"><button type="button">list</button></a>
	</form>


<script type="text/javascript" src="/resources/js/boardFileModify.js"></script>
<script type="text/javascript" src="/resources/js/boardFileRegister.js"></script>

</div>

<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 컨테이너 스타일 */
/* .container-md {
    background-color: #f9f9f9; /* 배경색을 밝은 색으로 설정 */
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
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

/* 구분선 */
hr {
    border-color: #6f42c1;
    border-width: 2px;
    margin-top: 20px;
    margin-bottom: 30px;
}

/* 입력 필드 스타일 */
input[type="text"], textarea {
    background-color: #f1f1f1; /* 배경색 변경 */
    border: 1px solid #ccc;
    font-size: 1rem;
    padding: 10px;
    border-radius: 5px;
    width: 100%;
    box-sizing: border-box;
}

textarea {
    height: 150px;
}

/* 글 작성 필드 스타일 */
#cmtListArea {
    margin-bottom: 20px;
}

/* 첨부파일 입력 버튼 */
#trigger {
    background-color: #6f42c1;
    color: white;
    border: none;
    font-weight: bold;
    padding: 5px 15px;
    border-radius: 5px;
    margin-top: 10px;
}

#trigger:hover {
    background-color: #5a33a1;  /* 버튼 hover 색상 */
}

/* 첨부파일 표시 영역 */
#fileZone {
    margin-top: 10px;
}

#fileZone span {
    font-size: 14px;
    color: #333;
    padding: 5px;
    background-color: #f1f1f1;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-right: 10px;
}

#fileZone span a {
    color: #6f42c1;
    text-decoration: none;
}

#fileZone span a:hover {
    text-decoration: underline;
}

/* 파일 리스트 스타일 */
.list-group-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
}

.list-group-item img {
    max-width: 50px;
    max-height: 50px;
    margin-right: 10px;
}

.fw-bold {
    font-weight: bold;
}

/* 파일 삭제 버튼 스타일 */
.btn-outline-danger {
    border-radius: 50%;
    padding: 5px 10px;
    background-color: #e03e3e;
    color: white;
    font-size: 0.9rem;
    border: none;
}

.btn-outline-danger:hover {
    background-color: #c92a2a;
}

/* 수정 버튼 */
#regBtn {
    background-color: #6f42c1;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    border: none;
    font-weight: bold;
    margin-top: 20px;
    width: 100%;
}

#regBtn:hover {
    background-color: #5a33a1;
}

/* list 버튼 */
a button {
    background-color: #f8f9fa;
    border: 1px solid #ccc;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    margin-top: 20px;
    margin-left: 10px;
}

a button:hover {
    background-color: #e2e6ea;
}

/* 폼 필드 내부 마진 및 스타일링 */
input.form-control, textarea.form-control {
    margin-bottom: 10px;
}

/* 파일 업로드 input (hidden) */
input[type="file"] {
    display: none;
}

</style>