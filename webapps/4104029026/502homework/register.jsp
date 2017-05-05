<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>register</title>
    <%request.setCharacterEncoding("UTF-8");%>
    <link rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        body {
            background-image: url("background.jpg");
        }
    </style>

  </head>
  <body>
    <div>
      <h1 style="color:black;font-size:40px">register</h1>
    </div>
    <div>
      <form action="final.jsp" method="post">
        帳號：&nbsp&nbsp<input type='text' name="account2" size="16"><br>
        密碼：&nbsp&nbsp<input type='password' name="password2" size="16"><br>
        姓名：&nbsp&nbsp<input type='text' name="username" size="16"><br>
        生日：&nbsp&nbsp<input type='date' name="birthday" size="16"><br>
        memo：<textarea name="memo" rows="1" cols="17">無</textarea><br>
        <input type="hidden" name="determine" value="register" ClientIDMode='Static'>
        <input type="submit" value="提交"/>
      </form>
    </div>
  </body>
</html>
