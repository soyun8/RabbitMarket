<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매자평가-직거래</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
        .estimation_save{
            width: 100%;
            text-align: center;
        }

        .estimation_save_btn{
            width: 40px;
            background-color: #F79646;
            padding: 5px;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            text-align: center;
            margin: 15px;
            display: inline-block;
        }

        .estimation_cover{
            width: 400px;
            border: 1px solid #F79646;
            margin: auto;
            padding: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .estimation_question{
            margin-top: 20px;
        }

        .estimation_question div{
            background-color: white;
            color: #F79646;
            margin: 10px 0;
            padding: 10px 10px;
            font-weight: 600;
            cursor: pointer;
        }

        img{
            width: 100px;
            margin-left: 100px;
        }

        p{
            font-weight: 600;
            font-size: 20px;
            margin-top: 65px;
            margin-bottom: 0px;
        }
        hr{
            border: 0.1px solid #F79646;
            margin-bottom: 10px;
        }
        
        .title_cover{
            width: 100%;
            font-weight: 600;
            font-size: 20px;
            display: inline-flex;
        }

        span{
            font-size: 13px;
        }

        title_img{
            display: inline-flex;
        }

    </style>
</head>

<body>
    <div class="estimation_cover">
        <div class="title_cover">
            <div class="title_img">
                <p>구매자 평가 - 직거래</p>
            </div>
            <div class="title_img">
                <img src="/resources/img/rabbit.jpg"/>
            </div>
        </div>
        <hr/>
        <span>해당되는 항목을 클릭해주세요.</span>

        <div class="estimation_question">
        	<c:forEach items="${dto}" var="question">
        		<div style="color: #F79646;" onclick="check(this)">${question.manner_content}</div>
        	</c:forEach>
        </div>
        
        <div class="estimation_save">
            <div class="estimation_save_btn" onclick="saveEstimation()">
            저장
            </div>
        </div> 
    </div>
</body>
<script>
    var point = 0;
    function check(elem) {
        var fontColor = elem.style.color;
    
        if(fontColor == 'rgb(247, 150, 70)'){
            point += 1;
            elem.style.color='white';
            elem.style.background='#F79646';
        }else{
            point -= 1;
            elem.style.color='#F79646';
            elem.style.background='white';
        }
    }
    
    function saveEstimation(){
    	console.log(point);
    	var trade_idx = "${trade_idx}";
    	$.ajax({
			url:'/sale/saveDirectBuyerEstimation'
			,type: 'GET'
			,data:{"trade_idx": trade_idx
				,"point":point}
			,success:function(data){
				if(data.success==1){
					alert('구매자 평가가 완료되었습니다.');
					self.close();
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    	
    }
	
</script>
</html>