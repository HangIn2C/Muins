<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP;
        IMP.init('imp03314248');
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '스트리밍 구독 결제',
            amount : 7000,
            buyer_name: '${loginID}',
            buyer_tel : '010-1234-5678',
            buyer_addr : '경기 성남시 분당구 돌마로 ',
            buyer_postcode : '123-456'
        }, function(rsp) {
            if ( rsp.success ) {
                msg = '결제 성공!';
                console.log('테스트');
		     	$.ajax({
		          type:'Post',
		          url:'usergradeupdate',
		          data: {
		             id: '${loginID}'
		          },
		          success:function(resultData){
		          }
		        }); //ajax
		        
                alert(msg);
                window.open('','_self').close();
            } else {
                msg = '결제 실패!';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                window.open('','_self').close();
            }
        });
        
    });
    
    
    
    </script>
    
 
</body>
</html>