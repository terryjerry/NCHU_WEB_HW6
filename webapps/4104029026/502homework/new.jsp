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
if(session.getAttribute("user") == null){
  out.println("請重新登入");
  response.setHeader("Refresh","0; URL=index.jsp");
}
%>
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
      try {
        String sql = "select * from test";
        database.query(sql);
        ResultSet rs = database.getRS();
      %>
        <div align="center">
        <table id="bord">
          <tr>
            <th>account</th>
            <th>password</th>
            <th>name</th>
            <th>birthday</th>
            <th>memo</th>
          </tr>
          <%
          while(rs.next()){
          %>
          <tr align="center">
            <td><%=rs.getString("account")%></td>
            <td><%=rs.getString("password")%></td>
            <td><%=rs.getString("username")%></td>
            <td><%=rs.getString("birthday")%></td>
            <td><%=rs.getString("memo")%></td>
          </tr>
          <%
        }
        %>
        </table>
        </div>
        <br><br>
        <div align="center">
          <form action="search.jsp" method="post" id="bord2">
            輸入帳號查詢：<input type='text' name="account3" size="15" required/><br>
            <input type="hidden" name="determine" value="search" ClientIDMode='Static' />
            <input type="submit" value="search" />
          </form>
        </div>
        <br/><br/><a href="logout.jsp"><button>登出</button><a/><br/><br/>
        <%
        rs.close();
      }catch(Exception ex){
        out.println(ex.getMessage());
        response.setHeader("Refresh","2; URL=index.jsp");
      }
    %>
  </body>
</html>
