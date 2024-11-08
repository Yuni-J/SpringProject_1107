<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
    <h1> Board List Page </h1>
    <hr>
    <div class="container-fluid">
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

            <input class="form-control me-2" name="keyword" type="search" placeholder="검색어를 입력해주세요" value="${ph.pgvo.keyword }">
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

    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">title</th>
                <th scope="col">writer</th>
                <th scope="col">regDate</th>
                <th scope="col">readCount</th> 
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="bvo">
            <tr>
                <td>${bvo.bno }</td>
                <td style="position: relative;">
                    <a href="/board/detail?bno=${bvo.bno}">${bvo.title}</a>
                </td>
                <td>${bvo.writer }</td>
                <td>${bvo.regDate }</td>
                <td>${bvo.readCount }</td> 
            </tr>  
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagingnation Line -->
    <nav aria-label="Page navigation example">
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

<jsp:include page="../layout/footer.jsp" /> 

<script>
// qty가 변경되면 자동으로 폼을 제출
function updateQty() {
    var qty = document.querySelector('select[name="qty"]').value;
    document.getElementById('qtyInput').value = qty; // qty 값을 숨김 입력 필드에 설정
    document.getElementById('searchForm').submit(); // 폼을 자동 제출
}
</script>
