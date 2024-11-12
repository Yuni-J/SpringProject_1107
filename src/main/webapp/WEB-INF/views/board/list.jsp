<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
    <h1> Board List Page </h1>
    <hr>

    <!-- 검색 폼 -->
    <div class="container-fluid" style="padding: 0;">
        <form action="/board/list" method="get" class="d-flex" role="search" id="searchForm">
            <!-- 검색 조건 -->
            <select class="form-select" name="type" id="inpurGounpSelect01">
                <option ${ph.pgvo.type == null ? 'selected' : '' }> 선택하시오 </option>
                <option value="twc" ${ph.pgvo.type eq 'twc' ? 'selected' : '' }>전체</option>
                <option value="t" ${ph.pgvo.type eq 't' ? 'selected' : '' }>제목</option>
                <option value="w" ${ph.pgvo.type eq 'w' ? 'selected' : '' }>작가</option>
                <option value="c" ${ph.pgvo.type eq 'c' ? 'selected' : '' }>내용</option>
                <option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected' : '' }>제목+작가</option>
                <option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected' : '' }>제목+내용</option>
                <option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected' : '' }>작가+내용</option>
            </select>

            <input class="form-control me-2" name="keyword" type="search" placeholder="검색어를 입력해주세요" value="${ph.pgvo.keyword}"
            style="width: 750px;">
            <input type="hidden" name="pageNo" value="1">
            <input type="hidden" name="qty" value="${ph.pgvo.qty }" id="qtyInput"> <!-- qty 값을 숨김 입력 필드로 추가 -->

            <button type="submit" class="btn btn-success position-relative">
                Search
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    ${ph.totalCount }
                    <span class="visually-hidden">unread messages</span>
                </span>
            </button>

            <!-- 보여줄 개수 선택 (qty) -->
            <select class="form-select" name="qty" onchange="updateQty()">
                <option value="10" ${ph.pgvo.qty == 10 ? 'selected' : '' }>10개씩</option>
                <option value="5" ${ph.pgvo.qty == 5 ? 'selected' : '' }>5개씩</option>
                <option value="15" ${ph.pgvo.qty == 15 ? 'selected' : '' }>15개씩</option>
                <option value="20" ${ph.pgvo.qty == 20 ? 'selected' : '' }>20개씩</option>
            </select>
        </form>
    </div> 

    <!-- 게시판 테이블 -->
    <table>
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Writer</th>
                <th scope="col">RegDate</th>
                <th scope="col">ReadCount</th> 
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="bvo">
            <tr>
                <td>${bvo.bno }</td>
                <td style="position: relative;">
                    <a href="/board/detail?bno=${bvo.bno}">${bvo.title}</a>
                    <c:if test="${bvo.cmtQty > 0 }">
                        <span class="fw-bold text-danger">[${bvo.cmtQty }]</span>
                    </c:if>
                    <c:if test="${bvo.hasFile > 0 }">
                        <span class="position-absolute top-0 start-20 badge rounded-pill bg-secondary">${bvo.hasFile }</span>
                    </c:if>
                </td>
                <td>${bvo.writer }</td>
                <td>${bvo.regDate }</td>
                <td>${bvo.readCount }</td> 
            </tr>  
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <nav aria-label="Page navigation example" style="background-color: transparent;">
        <ul class="pagination justify-content-center">
            <li class="page-item ${ph.prev eq false ? 'disabled' : '' }">
                <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
                <li class="page-item ${ph.pgvo.pageNo eq i? 'active' : '' }">
                    <a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
                </li>
            </c:forEach>
            <li class="page-item ${ph.next eq false ? 'disabled' : '' }">
                <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

</div>
<br>


<jsp:include page="../layout/footer.jsp" /> 

<script>
// qty가 변경되면 자동으로 폼을 제출
function updateQty() {
    var qty = document.querySelector('select[name="qty"]').value;
    document.getElementById('qtyInput').value = qty; // qty 값을 숨김 입력 필드에 설정
    document.getElementById('searchForm').submit(); // 폼을 자동 제출
}
</script>


<style>
/* 전체 컨테이너 스타일 */
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

/* 제목 스타일 */
h1 {
    color: #6f42c1; /* 메인 색상 */
    font-size: 2rem;
    text-align: center;
    margin-bottom: 20px;
}

/* 구분선 */
hr {
    border-color: #6f42c1; /* 메인 색상 */
    border-width: 2px;
    margin-top: 20px;
    margin-bottom: 30px;
}

/* 검색 폼 스타일 */
#searchForm {
    margin-bottom: 20px;
}

/* 검색 조건 - 드롭다운 선택 */
#inpurGounpSelect01 {
    width: auto;
    margin-right: 10px;
}

/* 검색어 입력란 */
.form-control {
    height: 40px;
    width: 250px;
}

/* 검색 버튼 스타일 */
.btn-success {
    background-color: #6f42c1; /* 메인 색상 */
    border-color: #6f42c1;
    font-weight: bold;
    height: 40px;
    margin-left: 10px;
}

.btn-success:hover {
    background-color: #5a33b1;
    border-color: #5a33b1;
}

/* 보여줄 개수 (qty) 선택 스타일 */
select.form-select {
    width: auto;
    margin-left: 10px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

/* 테이블 헤더 */
th {
    background-color: #6f42c1; /* 메인 색상 */
    color: #fff;
    padding: 12px;
    text-align: left;
    font-weight: bold;
    border-bottom: 2px solid #fff;
}

/* 테이블 바디 */
td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

/* 행 hover 효과 */
tr:hover {
    background-color: #f4f4f4;
    cursor: pointer;
}

/* 테이블 캡션 */
caption {
    font-size: 1.2rem;
    font-weight: bold;
    margin-bottom: 15px;
    text-align: center;
    color: #6f42c1; /* 메인 색상 */
}

/* 페이지네이션 스타일 */
.pagination {
    margin-top: 30px;
    justify-content: center;
}

.page-item .page-link {
    color: #6f42c1; /* 메인 색상 */
    font-weight: bold;
}

.page-item.disabled .page-link {
    color: #ccc;
}

.page-item.active .page-link {
    background-color: #6f42c1; /* 메인 색상 */
    border-color: #6f42c1;
    color: white;
}

.page-link:hover {
    background-color: #5a33b1;
    border-color: #5a33b1;
    color: white;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container-md {
        padding: 20px;
    }

    .form-control {
        width: 200px;
    }

    .btn-success {
        font-size: 0.9rem;
    }

    table.table th,
    table.table td {
        font-size: 0.9rem;
        padding: 8px;
    }

    .pagination {
        font-size: 0.9rem;
    }
}


</style>

