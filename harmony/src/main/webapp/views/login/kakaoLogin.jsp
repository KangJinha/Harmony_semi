<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>  
<script src="//code.jquery.com/jquery-3.7.1.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
 <style>
 * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

a {
  text-decoration: none;
  color: black;
}

li {
  list-style: none;
}

.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}

.login {
  width: 30%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h2 {
  color: tomato;
  font-size: 2em;
}
.login_sns {
  padding: 20px;
  display: flex;
}

.login_sns li {
  padding: 0px 15px;
}

.login_sns a {
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  border-radius: 50px;
  background: white;
  font-size: 20px;
  box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
}

.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_pw {
  margin-top: 20px;
  width: 80%;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_etc {
  padding: 10px;
  width: 80%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}
.button  {
margin-top: 150px;
}

 </style>   
</head>
<body>
    <div class="wrap">
        <div class="login">
            <h2>Log-in</h2>
           
     
            
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox" name="" id=""> Remember Me?
                </div>
                <div class="forgot_pw">
                <a href="">Forgot Password?</a>
            </div>
            </div>
            <div>
                <button class="button" onclick="kakaoLogin();">
                <img class="btnImg" src ="<%=request.getContextPath() %>/image/kakao_login.png">
    		  </button>
            </div>
        </div>
    </div>
</body>



<body>
	<div>
	<button onclick="kakaoLogout();">
          <span>카카오 로그아웃</span>
     </button>
     </div>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('cc95c9b42927b4f8a48697f198c5594e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
    	  console.log('로그인체크');
    	  console.log(response);
   	  Kakao.API.request({
      url: '/v2/user/me',
      success: function (response) {
    	  console.log(response);
    	  console.log(response.id);
    	  console.log(response.kakao_account['email']);
    	  console.log(response.properties['nickname']);
    	  const frm = $('<form>').attr({
    		  action:'<%=request.getContextPath()%>/member/kakaoLogin.do',
    		  method:'post'
    	  }).append($('<input>').attr({type:'hidden',name:'id',value:response.id}))
    	  .append($('<input>').attr({type:'hidden',name:'email',value:response.kakao_account['email']}))
    	  .append($('<input>').attr({type:'hidden',name:'nickname',value:response.properties['nickname']}));
    	
    	  console.log(frm);
    	  $('body').first().append(frm);
    	  frm.submit();
    	  <%-- $.ajax({
              url:"<%=request.getContextPath()%>/member/kakaoLogin.do",
              data:{"id":response.id,"email":response.kakao_account['email']},
              Type:"post",
              success:function(data){
                  //성공적으로 하고나면 이동할 url
                  location.href="<%=request.getContextPath()%>/";
              }
    	  }); --%>
          },
          fail: function (error) {
            console.log(error)
          }
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
      url: '/v1/user/unlink',
      success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<%@ include file="/views/common/footer.jsp" %>  