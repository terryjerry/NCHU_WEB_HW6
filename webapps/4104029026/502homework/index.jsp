<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>5/05作業</title>
    <%request.setCharacterEncoding("UTF-8");%>
    <link rel="stylesheet" href="assets/css/main2.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        body {
            background-image: url("background.jpg");
        }
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

  </head>
  <body>
    <header id="header" class="alt">
        <nav>
            <ul>
                <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
            </ul>
        </nav>
    </header>
    <div align="center">
      <h1 style="color:black;font-size:40px" ;>NCHU</h1>
    </div>
    <div align="center">
      <form action="final.jsp" method="post" id="bord">
        帳號：<input type='text' name="account" size="15" required/><br>
        密碼：<input type='password' name="password" size="15" required/><br><br>
        <input type="hidden" name="determine" value="index" ClientIDMode='Static' />
        <input type="submit" value="login" />
        <a href = "register.jsp" style="color:white;text-decoration: none;"><input type="button" value="register" /></a>
      </form>
    </div>
  </body>
</html>
