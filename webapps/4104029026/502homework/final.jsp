<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029026"/>
  <jsp:setProperty property="user" name="database" value="4104029026"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029026!"/>
</jsp:useBean>
<%
  database.connectDB();
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>final</title>
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
          margin-right: 10%;
          margin-left: 10%;
        }
        #bord2 {
          border-radius:50px;
          -moz-border-radius:50px;
          -webkit-border-radius:50px;
          -webkit-box-shadow:0px 0px 50px 20px #00f9ff inset;
          -moz-box-shadow:0px 0px 50px 20px #00f9ff inset;
          box-shadow:0px 0px 50px 20px #00f9ff inset;
          margin-right: 38%;
          margin-left: 38%;
        }
    </style>

  </head>
  <body align="center">
    <%
      String determine = request.getParameter("determine");

      if(determine.equals("register")){
  			String account = request.getParameter("account2");
  			String password = request.getParameter("password2");
  			String username = request.getParameter("username");
  			String birthday = request.getParameter("birthday");
  			String memo = request.getParameter("memo");

        try{

          String sql = "insert into test (account,password,username,birthday,memo) values(?,?,?,?,?)";
          database.insertData(account,password,username,birthday,memo);
          session.setAttribute("user", account);
          out.println(account + "註冊成功，2秒後跳轉至主化面");
          response.setHeader("Refresh","2; URL=new.jsp");
  			}catch(Exception ex){
          out.println("帳號重複，請重新輸入");
          response.setHeader("Refresh","1; URL=register.jsp");
        }
      }else if(determine.equals("index")){
        String account = request.getParameter("account");
  			String password = request.getParameter("password");

        try{
          String sql = "select * from test where account='" + account + "' and password='" + password + "'";
          database.query(sql);
          ResultSet rs = database.getRS();

          if(rs.next()) {
            out.println(account + "登入成功，2秒後跳轉至主化面");
            session.setAttribute("user", account);
            rs.close();
            response.setHeader("Refresh","0; URL=new.jsp");

          }else {
              out.println("帳密輸入錯誤，請重新輸入");
              response.setHeader("Refresh","2; URL=index.jsp");
          }
        }catch(Exception ex){
  				out.println(ex.getMessage());
          response.setHeader("Refresh","2; URL=index.jsp");
  			}
      }
    %>
  </body>
</html>
