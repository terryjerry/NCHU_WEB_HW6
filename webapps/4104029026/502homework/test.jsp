<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
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
    <title>register</title>
    <link rel="stylesheet" href="assets/css/main2.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <body>
    <%
      String name = request.getParameter("abc");
      String determine = request.getParameter("determine");
      String sql = "select * from test where account='" + name + "'";
      database.query(sql);
      ResultSet rs = database.getRS();
      if(rs.next()) {
        out.print("帳號重複請重新輸入");
      }else {
        out.print("");
      }
    %>
  </body>
</html>
