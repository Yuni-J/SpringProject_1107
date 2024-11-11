<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> 글 쓰기 </h1>
	<hr>
	<form action="/board/insert" method="post" enctype="multipart/form-data">

		<ul class="list-group" id="cmtListArea">
			<li class="list-group-item">
				<div class="input-group mb-3">	
					<input class="form-control" type="text" id="t" name="title" placeholder="제목을 입력해 주세요">
				</div>
				
				<div class="row mb-3">
				  <div class="col">
				  	<sec:authentication property="principal.uvo" var="uvo"/>
				    <input class="form-control" type="text" id="w" name="writer" readonly="readonly" value="${uvo.nickName }">
				  </div>
				</div>		      
			</li>
		</ul>

		<ul class="list-group" id="cmtListArea">
			<li class="list-group-item">
				<div class="list-group-item">
			  		<textarea class="form-control" id="c" name="content" rows="3" placeholder="내용을 입력해 주세요" 
    					style="outline: none; height: 150px; box-shadow: none;"></textarea>
			  	</div>			      
			</li>
		</ul>
		
		<!-- 첨부파일 입력 라인 추가 -->
		<div class="mb-3">
		  <label for="file" class="form-label"></label>
		  <input type="file" class="form-control" name="files" id="file" 
		  multiple="multiple" style="display:none">
		  <button type="button" class="btn btn-outline-info btn-sm" id="trigger">FileUpload...</button>
		</div>
		
		<!-- 첨부파일 표시 라인 추가 -->
		<div class="mb-3" id="fileZone">

		</div>
		
		<button type="submit" class="btn btn-primary" id="regBtn">등록</button>
	</form>
</div>

<script type="text/javascript" src="/resources/js/boardFileRegister.js"></script>


<jsp:include page="../layout/footer.jsp" />
