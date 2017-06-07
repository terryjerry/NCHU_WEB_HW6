<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>register</title>
    <%request.setCharacterEncoding("UTF-8");%>
    <link rel="stylesheet" href="assets/css/main2.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>

        #bord {
          border-radius:50px;
          -moz-border-radius:50px;
          -webkit-border-radius:50px;
          -webkit-box-shadow:0px 0px 50px 20px #00f9ff inset;
          -moz-box-shadow:0px 0px 50px 20px #00f9ff inset;
          box-shadow:0px 0px 50px 20px #00f9ff inset;
          margin-right: 35%;
          margin-left: 35%;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
    function verify(){
          var txt = $("#acc").val();
          $.post("test.jsp", {abc: txt}, function(response){
              $("span").html(response);
          });
    }
    </script>
  </head>
  <body style='background-image: url("background.jpg")'>
    <header id="header" class="alt">
        <h1 id="ab"><strong><a href="index.html" style="color:black">回登錄頁面</a></strong></h1>
        <nav>
            <ul>
                <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
            </ul>
        </nav>
    </header>
    <div align="center">
      <br/><h1 style="color:black;font-size:40px">register</h1>
    </div>
    <div align="center">
      <form action="final.jsp" method="post" id="bord">
        帳號：&nbsp&nbsp<input type='text' name="account2" size="16" id="acc" onblur=verify() required><p><span></span></p><br>
        密碼：&nbsp&nbsp<input type='password' name="password2" size="16" required><br>
        姓名：&nbsp&nbsp<input type='text' name="username" size="16" required><br>
        生日：&nbsp&nbsp<input type='date' name="birthday" size="16" required><br>
        memo：<textarea name="memo" rows="1" cols="17" required>無</textarea><br>
        <input type="hidden" name="determine" value="register" ClientIDMode='Static'>
        <input type="submit" value="提交"/>
      </form>
    </div>
  </body>
</html>
