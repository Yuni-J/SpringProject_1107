<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container-md {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 2em;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        caption {
            font-size: 1.2em;
            font-weight: bold;
            padding: 10px;
            text-align: center;
            color: #555;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        th {
            font-weight: bold;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            color: #555;
        }

        .auth-column {
            text-align: center;
            color: #007bff;
        }

        /* Add responsive styles */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }
            th, td {
                padding: 8px;
            }
        }
    </style>
<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> User List Page </h1>
	<hr>
	<table>
	  <caption>
	    This is an example table, and this is its caption to describe the contents.
	  </caption>
	  <thead>
	    <tr>
	      <th>ID</th>
	      <th>NickName</th>
	      <th>LastLogin</th>
	      <th>RegDate</th>
	      <th>auth</th>
	    </tr>
	  </thead>
	  <tbody>
		  <c:forEach items="${userList }" var="uvo">
		    <tr>
		      <td>${uvo.email }</td>
		      <td>${uvo.nickName }</td>
		      <td>${uvo.lastLogin }</td>
		      <td>${uvo.regDate }</td>
		      <c:forEach items="${uvo.authList }" var="auths">
			      <td>${auths.auth }</td>
		      </c:forEach>
		    </tr> 
		  </c:forEach>
	  </tbody>
	</table>
</div>


<jsp:include page="../layout/footer.jsp" />
