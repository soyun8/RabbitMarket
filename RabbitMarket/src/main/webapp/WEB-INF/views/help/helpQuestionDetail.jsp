<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>

<style>
	table{
		border-top: 2px solid black;
		border-collapse: collapse;
		width : 100%;
		border-bottom: 2px solid black;
	}
	
   td{
	   	border-top: 1px solid black;
	    padding : 10px;
	    text-align: left;
   }
	
	.title{
		font-weight: 600;
		text-align: auto;
	}

	.content {
		text-align: left;
		margin : 30px;
	}
	#btn-list{
      color: white;
      font-size: 20px;
      background-color: #ff8e32;
      width: 90px;
      border-style: none;
      height: 50px;
     
    }
	#btn-list2{
      color: white;
      font-size: 20px;
      background-color: #ff8e32;
      width: 180px;
      border-style: none;
      height: 50px;
     
    }
	div#btn{
		text-align: center;
		margin-top : 20px;
	}
	.flex_box{
		display: flex;
	}

</style>
</head>
<body>
<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   <jsp:include page="../include/helpNavigation.jsp"></jsp:include>
   <br/><br/>
   <div class="our_content_area">
   <div class="flex_box">
   <table>
		<tr>
			<td class="title">제목</td>
			<td>${dto.subject}</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td class="title">카테고리</td>
			<td >${dto.question_category}</td>
			<td class="title">작성자</td>
			<td>${dto.member_id}</td>
		</tr>
		<tr>
			<td class="title">문의상태</td>
			<td>${msg}</td>
			<td class="title">작성일</td>
			<td>${dto.reg_date}</td>
		</tr>
		<tr>
			
		</tr>
		<tr>
		<td></td>
			<td colspan="2">
			<div class="content">
				${dto.content}
			</div>
			</td>
		

		<td>
		 <c:if test="${sessionScope.loginId == dto.member_id && msg ne '답변완료'}">
		<div class="up">
		 &nbsp;
		<button id="delete">삭제</button>
		</div>	
		</c:if>
		<br/>
		</td>	
		</tr>
		
		<tr>
			<td class="title">작성자</td>
			<td >${dto.admin_id}</td>
			<td class="title">작성일</td>
			<td >${dto.answer_date}</td>
			
		</tr>
		<tr>
		<td></td>
			<td colspan="3">
			<div class="content">
				${dto.answer}
			</div>	
			</td>
		
		</tr>	
		</table>
	
   </div>
   <div id="btn"><br/>
   <button id="btn-list" onclick="location.href = '/help/helpQuestionMain' ">목록</button>
    &nbsp; &nbsp; &nbsp; 
   <button id="btn-list2" onclick="location.href = '/myPage/questionList' ">내 1:1 문의 내역</button>
   </div>
   </div>
  
</body>
<script>
	//문의글 삭제 성공시 오는 msg
	var check="${removeOK}";
		if(check != ""){
		 	alert(check);
		}
$(function(){
	$('#delete').click(function(){
		if(confirm("삭제 하시겠습니까?")){
			location.href = "./help_Question_Delete/${question_idx}";
		}
	});
});
</script>
</html>