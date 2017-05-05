<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>5/05作業</title>
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
      <h1 style="color:black;font-size:40px" ;>NCHU</h1>
    </div>
    <div>
      <form action="final.jsp" method="post">
        帳號：<input type='text' name="account"><br>
        密碼：<input type='password' name="password"><br><br>
        <input type="hidden" name="determine" value="index" ClientIDMode='Static'>
        <input type="submit" value="login">
      </form>
      <button><a href = "register.jsp" style="color:black;text-decoration: none">register</a></button>
    </div>
  </body>
</html>
